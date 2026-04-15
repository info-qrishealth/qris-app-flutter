import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qris_health/modules/all_scans_module/models/test_package_model/test_package_model.dart';
import 'package:qris_health/modules/orders_modele/models/time_slot/time_slot.dart';
import 'package:qris_health/modules/orders_modele/services/cart_service.dart';

import '../../address_module/models/address/address.dart';
import '../models/cart/cart.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  String? _currentUserId;

  double get cartTestValue => getCartTestPrices();

  String _ymd(DateTime d) =>
      '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  void _updateCart(Cart? cart) {
    emit(CartUpdated(cart: cart));
  }

  Future<void> fetchCart({BuildContext? context}) async {
    if (_currentUserId == null) return;

    try {
      final body = await CartService.fetchFullCart();
      _updateCart(body);
    } catch (e) {
      debugPrint('refreshCartFromServer: $e');
    }
  }

  Future<void> loadCart({required String userId, BuildContext? context}) async {
    _currentUserId = userId;
    await fetchCart(context: context);
  }

  Future<void> addToCart(TestPackageModel testPackageModel) async {
    if (_currentUserId == null) return;

    final cart = await CartService.addCartItem(
      testId: testPackageModel.id,
      type: testPackageModel.type?.name,
    );

    _updateCart(cart);
  }

  bool isPatientAlreadyAddedToThisTest(
      {required int testId, required int patientId}) {
    final cartTestIndex =
        state.cart?.cartTests.indexWhere((e) => e.test?.id == testId);
    if (cartTestIndex == -1 || cartTestIndex == null) return false;
    return state.cart!.cartTests[cartTestIndex].patientIds.contains(patientId);
  }

  Future<void> addPatientToTest(
      {required int patientId, required int testId}) async {
    if (_currentUserId == null) return;
    final cart = await CartService.addPatientToCartItem(
        testId: testId, patientId: patientId);

    _updateCart(cart);
  }

  Future<void> removePatientFromTest(
      {required int patientId, required int testId}) async {
    if (_currentUserId == null) return;
    final cart = await CartService.removePatientFromCartItem(
        testId: testId, patientId: patientId);

    _updateCart(cart);
  }

  Future<void> changeAddress(Address? address) async {
    if (_currentUserId == null) return;
    final id = address?.id;
    Cart? cart;
    if (id != null) {
      cart = await CartService.attachAddress(addressId: id);
    } else {
      cart = await CartService.removeAddress();
    }

    _updateCart(cart);
  }

  void setSelectedAddressLocal(Address? address) {
    emit(CartUpdated(
      cart: state.cart?.copyWith(selectedAddress: address),
    ));
  }

  Future<void> removeTestFromCart(int testId) async {
    if (_currentUserId == null) return;
    final cart = await CartService.removeCartItem(testId: testId);

    _updateCart(cart);
  }

  void setUserId(String userId) {
    _currentUserId = userId;
  }

  void setTimeSlotLocal(TimeSlot? timeSlot) {
    emit(CartUpdated(
      cart: state.cart?.copyWith(timeSlot: timeSlot),
    ));
  }

  Future<void> updateCollectionDate(DateTime collectionDate) async {
    if (_currentUserId == null) return;
    final slot = state.cart?.timeSlot;
    if (slot != null) {
      final cart = await CartService.updateSlot(
        slotId: slot.id,
        collectionDate: _ymd(collectionDate),
      );

      _updateCart(cart);
    } else {
      emit(CartUpdated(
        cart: state.cart?.copyWith(collectionDate: collectionDate),
      ));
    }
  }

  void setCollectionDateLocal(DateTime collectionDate) {
    emit(CartUpdated(
      cart: state.cart?.copyWith(collectionDate: collectionDate),
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
    final cart = await CartService.applyCoupon(
        couponCode: couponCode, platform: platform);

    _updateCart(cart);
  }

  Future<void> updateHardCopy(bool hardCopy) async {
    if (_currentUserId == null) return;
    Cart? cart;

    if (hardCopy) {
      cart = await CartService.applyHardCopy();
    } else {
      cart = await CartService.removeHardCopy();
    }

    _updateCart(cart);
  }

  Future<void> toggleRedeemCoins() async {
    if (_currentUserId == null) return;

    Cart? cart;

    if (state.cart?.redeemCoins == true) {
      cart = await CartService.removeRedeemCoins();
    } else {
      cart = await CartService.applyRedeemCoins();
    }

    _updateCart(cart);
  }

  Future<void> removeAppliedCouponAndCoins() async {
    if (_currentUserId == null) return;

    await CartService.removeCoupon();
    final cart = await CartService.removeRedeemCoins();
    _updateCart(cart);
  }

  T _fromCart<T>(T Function(Cart c) getter, T defaultValue) {
    final c = state.cart;
    return c != null ? getter(c) : defaultValue;
  }

  double getCartTestPrices() =>
      _fromCart((c) => c.cartTestPrices?.toDouble() ?? 0.0, 0.0);

  double getCartFinalValue({BuildContext? context}) =>
      _fromCart((c) => c.cartFinalValue?.toDouble() ?? 0.0, 0.0);

  double getBaseCartValue() =>
      _fromCart((c) => c.baseCartValue?.toDouble() ?? 0.0, 0.0);

  int getDeliveryCharge() => _fromCart((c) => c.deliveryCharge ?? 0, 0);

  int getHardCopyCharges() => _fromCart((c) => c.hardCopyCharges ?? 0, 0);

  String getCollectiveSampleType() => _fromCart((c) => c.sampleType ?? '', '');

  String getCollectiveTubeType() => _fromCart((c) => c.tubeType ?? '', '');
}
