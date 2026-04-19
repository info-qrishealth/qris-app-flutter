import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qris_health/modules/address_module/models/pincode/pincode.dart';
import 'package:qris_health/modules/all_scans_module/models/test_package_model/test_package_model.dart';
import 'package:qris_health/modules/orders_modele/models/time_slot/time_slot.dart';
import 'package:qris_health/modules/orders_modele/services/cart_remote_mapper.dart';
import 'package:qris_health/modules/orders_modele/services/cart_service.dart';
import 'package:qris_health/modules/patients_module/cubits/patients_cubit/patients_cubit.dart';

import '../../address_module/models/address/address.dart';
import '../models/cart/cart.dart';
import '../models/cart/cart_summary.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  String? _currentUserId;

  double get cartTestValue => getCartTestPrices();

  String _ymd(DateTime d) =>
      '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  Future<void> _emitFromRemoteBody(Map<String, dynamic>? body, [BuildContext? context]) async {
    if (body == null) {
      emit(CartInitial(cart: const Cart(cartTests: []), cartSummary: null));
      return;
    }
    final items = body['items'];
    if (items == null || items is! List || items.isEmpty) {
      emit(CartInitial(cart: const Cart(cartTests: []), cartSummary: null));
      try {
        await CartService.clearCartLocally();
      } catch (_) {}
      return;
    }
    final cart = CartRemoteMapper.cartFromServerBody(body);
    final summary = CartRemoteMapper.summaryFromServerBody(body);
    if (cart.cartTests.isEmpty) {
      emit(CartInitial(cart: const Cart(cartTests: []), cartSummary: null));
      try {
        await CartService.clearCartLocally();
      } catch (_) {}
      return;
    }
    emit(CartUpdated(cart: cart, cartSummary: summary));

    try {
      await CartService.saveCartLocally(cartData: json.encode(body));
    } catch (_) {}

    if (context != null && context.mounted) {
      final patients = CartRemoteMapper.patientsFromServerBody(body);
      if (patients.isNotEmpty) {
        final patientsCubit = BlocProvider.of<PatientsCubit>(context);
        for (final patient in patients) {
          final existing = patientsCubit.getPatientByPatientId(patientId: patient.id);
          if (existing == null) {
            patientsCubit.addNewPatient(patient);
          }
        }
      }
    }
  }

  Future<void> refreshCartFromServer({BuildContext? context}) async {
    if (_currentUserId == null) return;
    final ctx = context;
    try {
      final body = await CartService.fetchFullCart();
      final safeContext = ctx != null && ctx.mounted ? ctx : null;
      await _emitFromRemoteBody(body, safeContext);
    } catch (e) {
      debugPrint('refreshCartFromServer: $e');
    }
  }

  Future<void> _applyServerBody(Map<String, dynamic>? body, {BuildContext? context}) async {
    final safeContext = context != null && context.mounted ? context : null;
    await _emitFromRemoteBody(body, safeContext);
  }

  Future<void> loadCart({required String userId, BuildContext? context}) async {
    _currentUserId = userId;
    await refreshCartFromServer(context: context);
  }

  Future<void> addToCart(TestPackageModel testPackageModel) async {
    if (_currentUserId == null) return;
    if (state.cart.cartTests.any((e) => e.test.id == testPackageModel.id)) {
      return;
    }
    final body = await CartService.addCartItem(
      testId: testPackageModel.id,
      type: testPackageModel.type?.name,
    );
    await _applyServerBody(body);
  }

  bool isPatientAlreadyAddedToThisTest({required int testId, required int patientId}) {
    final cartTestIndex = state.cart.cartTests.indexWhere((e) => e.test.id == testId);
    if (cartTestIndex == -1) return false;
    return state.cart.cartTests[cartTestIndex].patientIds.contains(patientId);
  }

  Future<void> addPatientToTest({required int patientId, required int testId}) async {
    if (_currentUserId == null) return;
    final body =
        await CartService.addPatientToCartItem(testId: testId, patientId: patientId);
    await _applyServerBody(body);
  }

  Future<void> removePatientFromTest({required int patientId, required int testId}) async {
    if (_currentUserId == null) return;
    final body =
        await CartService.removePatientFromCartItem(testId: testId, patientId: patientId);
    await _applyServerBody(body);
  }

  Future<void> changeAddress(Address? address) async {
    if (_currentUserId == null) return;
    final id = address?.id;
    if (id != null) {
      final body = await CartService.attachAddress(addressId: id);
      await _applyServerBody(body);
    } else {
      final body = await CartService.removeAddress();
      await _applyServerBody(body);
    }
  }

  void setSelectedAddressLocal(Address? address) {
    emit(CartUpdated(
      cart: state.cart.copyWith(selectedAddress: address),
      cartSummary: state.cartSummary,
    ));
  }

  Future<void> removeTestFromCart(int testId) async {
    if (_currentUserId == null) return;
    final body = await CartService.removeCartItem(testId: testId);
    await _applyServerBody(body);
  }

  void setUserId(String userId) {
    _currentUserId = userId;
  }

  Future<void> removeInvalidTests() async {
    final tests = [...state.cart.cartTests];
    final invalid = tests.where((t) => t.patientIds.isEmpty).map((t) => t.test.id).toList();
    Map<String, dynamic>? lastBody;
    for (final testId in invalid) {
      lastBody = await CartService.removeCartItem(testId: testId);
    }
    if (lastBody != null) {
      await _applyServerBody(lastBody);
    }
  }

  /// Local-only slot selection. Server sync happens on Continue via updateCollectionDate.
  Future<void> updateTimeSlot(TimeSlot? timeSlot) async {
    setTimeSlotLocal(timeSlot);
  }

  void setTimeSlotLocal(TimeSlot? timeSlot) {
    emit(CartUpdated(
      cart: state.cart.copyWith(timeSlot: timeSlot),
      cartSummary: state.cartSummary,
    ));
  }

  Future<void> updateCollectionDate(DateTime collectionDate) async {
    if (_currentUserId == null) return;
    final slot = state.cart.timeSlot;
    if (slot != null) {
      final body = await CartService.updateSlot(
        slotId: slot.id,
        collectionDate: _ymd(collectionDate),
      );
      await _applyServerBody(body);
    } else {
      emit(CartUpdated(
        cart: state.cart.copyWith(collectionDate: collectionDate),
        cartSummary: state.cartSummary,
      ));
    }
  }

  void setCollectionDateLocal(DateTime collectionDate) {
    emit(CartUpdated(
      cart: state.cart.copyWith(collectionDate: collectionDate),
      cartSummary: state.cartSummary,
    ));
  }

  Future<void> applyCouponByCode({
    required String couponCode,
    String? userId,
    String platform = 'app',
    BuildContext? context,
  }) async {
    final uid = userId ?? _currentUserId;
    if (uid == null) {
      throw Exception('Not logged in');
    }
    _currentUserId = uid;
    final body = await CartService.applyCoupon(couponCode: couponCode, platform: platform);
    await _applyServerBody(body, context: context);
  }

  Future<void> updateHardCopy(bool hardCopy) async {
    if (_currentUserId == null) return;
    if (hardCopy) {
      final body = await CartService.applyHardCopy();
      await _applyServerBody(body);
    } else {
      final body = await CartService.removeHardCopy();
      await _applyServerBody(body);
    }
  }

  Future<void> removeInvalidTestsFromCart() async {
    final ids = state.cart.cartTests.where((t) => t.patientIds.isEmpty).map((t) => t.test.id).toList();
    Map<String, dynamic>? lastBody;
    for (final testId in ids) {
      lastBody = await CartService.removeCartItem(testId: testId);
    }
    if (lastBody != null) {
      await _applyServerBody(lastBody);
    }
  }

  void updateCollectionPincode(Pincode? pincode) {
    emit(CartUpdated(
      cart: state.cart.copyWith(pincode: pincode),
      cartSummary: state.cartSummary,
    ));
  }

  Future<void> toggleRedeemCoins() async {
    if (_currentUserId == null) return;
    if (state.cart.redeemCoins) {
      final body = await CartService.removeRedeemCoins();
      await _applyServerBody(body);
    } else {
      final body = await CartService.applyRedeemCoins();
      await _applyServerBody(body);
    }
  }

  Future<void> removeAppliedCouponAndCoins() async {
    if (_currentUserId == null) return;
    // Keep both API calls; apply final server response only once.
    await CartService.removeCoupon();
    final body = await CartService.removeRedeemCoins();
    await _applyServerBody(body);
  }

  T _fromSummary<T>(T Function(CartSummary s) getter, T defaultValue) {
    final s = state.cartSummary;
    return s != null ? getter(s) : defaultValue;
  }

  double getCartTestPrices() => _fromSummary((s) => s.cartTestPrices, 0.0);

  double getCartFinalValue({BuildContext? context}) =>
      _fromSummary((s) => s.cartFinalValue, 0.0);

  double getBaseCartValue() => _fromSummary((s) => s.baseCartValue, 0.0);

  int getDeliveryCharge() => _fromSummary((s) => s.deliveryCharge, 0);

  int getHardCopyCharges() => _fromSummary((s) => s.hardCopyCharges, 0);

  String getCollectiveSampleType() => _fromSummary((s) => s.sampleType, '');

  String getCollectiveTubeType() => _fromSummary((s) => s.tubeType, '');
}
