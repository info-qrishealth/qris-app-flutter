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

  Cart _mergeCartPricingFromSummary(Cart cart, CartSummary? summary) {
    if (summary == null) return cart;
    return cart.copyWith(
      appliedCouponAmount: summary.appliedCouponAmount ?? cart.appliedCouponAmount,
      redeemedQrisCoins: summary.redeemedQrisCoins,
    );
  }

  Future<void> _emitFromRemoteBody(Map<String, dynamic>? body, [BuildContext? context]) async {
    if (body == null) {
      emit(CartInitial(cart: const Cart(cartTests: []), cartSummary: null));
      return;
    }
    final cart = CartRemoteMapper.cartFromServerBody(body);
    final summary = CartRemoteMapper.summaryFromServerBody(body);
    final merged = _mergeCartPricingFromSummary(cart, summary);
    emit(CartUpdated(cart: merged, cartSummary: summary));

    try {
      await CartService.saveCartLocally(cartData: json.encode(merged.toJson()));
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

  Future<void> loadCart({required String userId, BuildContext? context}) async {
    _currentUserId = userId;
    await refreshCartFromServer(context: context);
  }

  Future<void> addToCart(TestPackageModel testPackageModel) async {
    if (_currentUserId == null) return;
    if (state.cart.cartTests.any((e) => e.test.id == testPackageModel.id)) {
      return;
    }
    await CartService.addCartItem(
      testId: testPackageModel.id,
      type: testPackageModel.type?.name,
    );
    await refreshCartFromServer();
  }

  bool isPatientAlreadyAddedToThisTest({required int testId, required int patientId}) {
    final cartTestIndex = state.cart.cartTests.indexWhere((e) => e.test.id == testId);
    if (cartTestIndex == -1) return false;
    return state.cart.cartTests[cartTestIndex].patientIds.contains(patientId);
  }

  Future<void> addPatientToTest({required int patientId, required int testId}) async {
    if (_currentUserId == null) return;
    await CartService.addPatientToCartItem(testId: testId, patientId: patientId);
    await refreshCartFromServer();
  }

  Future<void> removePatientFromTest({required int patientId, required int testId}) async {
    if (_currentUserId == null) return;
    await CartService.removePatientFromCartItem(testId: testId, patientId: patientId);
    await refreshCartFromServer();
  }

  Future<void> changeAddress(Address? address) async {
    if (_currentUserId == null) return;
    final id = address?.id;
    if (id != null) {
      await CartService.attachAddress(addressId: id);
    } else {
      await CartService.removeAddress();
    }
    await refreshCartFromServer();
  }

  Future<void> removeTestFromCart(int testId) async {
    if (_currentUserId == null) return;
    await CartService.removeCartItem(testId: testId);
    await refreshCartFromServer();
  }

  Future<void> clearCart() async {
    try {
      final body = await CartService.fetchFullCart();
      final items = body?['items'] as List<dynamic>? ?? [];
      for (final raw in items) {
        if (raw is Map<String, dynamic> && raw['testId'] != null) {
          final tid = (raw['testId'] as num).toInt();
          await CartService.removeCartItem(testId: tid);
        }
      }
    } catch (e) {
      debugPrint('clearCart server cleanup: $e');
    }
    await CartService.clearCartForUser();
    emit(CartInitial(cart: const Cart(cartTests: []), cartSummary: null));
  }

  void setUserId(String userId) {
    _currentUserId = userId;
  }

  Future<void> removeInvalidTests() async {
    final tests = [...state.cart.cartTests];
    final invalid = tests.where((t) => t.patientIds.isEmpty).map((t) => t.test.id).toList();
    for (final testId in invalid) {
      await CartService.removeCartItem(testId: testId);
    }
    await refreshCartFromServer();
  }

  Future<void> updateTimeSlot(TimeSlot? timeSlot) async {
    if (_currentUserId == null) return;
    if (timeSlot == null) {
      emit(CartUpdated(
        cart: state.cart.copyWith(timeSlot: null),
        cartSummary: state.cartSummary,
      ));
      return;
    }
    final date = state.cart.collectionDate ?? DateTime.now();
    await CartService.updateSlot(
      slotId: timeSlot.id,
      collectionDate: _ymd(date),
    );
    await refreshCartFromServer();
  }

  Future<void> updateCollectionDate(DateTime collectionDate) async {
    if (_currentUserId == null) return;
    final slot = state.cart.timeSlot;
    if (slot != null) {
      await CartService.updateSlot(
        slotId: slot.id,
        collectionDate: _ymd(collectionDate),
      );
      await refreshCartFromServer();
    } else {
      emit(CartUpdated(
        cart: state.cart.copyWith(collectionDate: collectionDate),
        cartSummary: state.cartSummary,
      ));
    }
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
    final ctx = context;
    await CartService.applyCoupon(couponCode: couponCode, platform: platform);
    final safeContext = ctx != null && ctx.mounted ? ctx : null;
    await refreshCartFromServer(context: safeContext);
  }

  Future<void> updateHardCopy(bool hardCopy) async {
    if (_currentUserId == null) return;
    if (hardCopy) {
      await CartService.applyHardCopy();
    } else {
      await CartService.removeHardCopy();
    }
    await refreshCartFromServer();
  }

  Future<void> removeInvalidTestsFromCart() async {
    final ids = state.cart.cartTests.where((t) => t.patientIds.isEmpty).map((t) => t.test.id).toList();
    for (final testId in ids) {
      await CartService.removeCartItem(testId: testId);
    }
    await refreshCartFromServer();
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
      await CartService.removeRedeemCoins();
    } else {
      await CartService.applyRedeemCoins();
    }
    await refreshCartFromServer();
  }

  Future<void> removeAppliedCouponAndCoins() async {
    if (_currentUserId == null) return;
    await CartService.removeCoupon();
    await CartService.removeRedeemCoins();
    await refreshCartFromServer();
  }

  Future<void> loadCartSummary({required String userId, BuildContext? context}) async {
    _currentUserId = userId;
    await refreshCartFromServer(context: context);
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
