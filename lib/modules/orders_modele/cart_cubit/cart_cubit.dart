import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/enums/coupon_discount_type.dart';
import 'package:qris_health/constants/enums/coupon_type.dart';
import 'package:qris_health/modules/address_module/models/pincode/pincode.dart';
import 'package:qris_health/modules/all_scans_module/models/test_package_model/test_package_model.dart';
import 'package:qris_health/modules/orders_modele/models/coupon/coupon.dart';
import 'package:qris_health/modules/orders_modele/models/time_slot/time_slot.dart';
import 'package:qris_health/modules/refer_and_earn_module/cubits/qris_wallet_cubit/qris_wallet_cubit.dart';
import 'package:qris_health/shared/cubits/qris_config_cubit/qris_config_cubit.dart';

import '../../address_module/models/address/address.dart';
import '../models/cart/cart.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  double get cartTestValue => getCartTestPrices();

  void _updateCart({required Cart cart}) {
    emit(CartUpdated(cart: cart));
  }

  void addToCart(TestPackageModel testPackageModel) {
    if (state.cart.cartTests
        .any((element) => element.test.id == testPackageModel.id)) {
      return;
    }

    _updateCart(
        cart: state.cart.copyWith.call(cartTests: [
      ...state.cart.cartTests,
      CartTest(test: testPackageModel, patientIds: [])
    ]));
  }

  void addPatientToTest({required int patientId, required int testId}) {
    final cartTestIndex =
        state.cart.cartTests.indexWhere((element) => element.test.id == testId);

    if (cartTestIndex != -1) {
      final cartTest = state.cart.cartTests[cartTestIndex];
      final updatedCartTest = cartTest.copyWith
          .call(patientIds: [...cartTest.patientIds, patientId]);
      final tests = [...state.cart.cartTests]..removeAt(cartTestIndex);

      _updateCart(
          cart: state.cart.copyWith.call(
              cartTests: [...tests]..insert(cartTestIndex, updatedCartTest)));
    }
  }

  void changeAddress(Address? address) {
    _updateCart(cart: state.cart.copyWith.call(selectedAddress: address));
  }

  void removePatientFromTest({required int patientId, required int testId}) {
    final cartTestIndex =
        state.cart.cartTests.indexWhere((element) => element.test.id == testId);

    if (cartTestIndex != -1) {
      final cartTest = state.cart.cartTests[cartTestIndex];
      final updatedCartTest = cartTest.copyWith
          .call(patientIds: [...cartTest.patientIds]..removeAt(cartTestIndex));
      final tests = [...state.cart.cartTests]..removeAt(cartTestIndex);

      _updateCart(
          cart: state.cart.copyWith.call(
              cartTests: [...tests]..insert(cartTestIndex, updatedCartTest)));
    }
  }

  void removeTestFromCart(int testId) {
    final index =
        state.cart.cartTests.indexWhere((element) => element.test.id == testId);

    if (index != -1) {
      _updateCart(
          cart: state.cart.copyWith
              .call(cartTests: [...state.cart.cartTests]..removeAt(index)));
    }
  }

  void clearCart() {
    emit(CartInitial(cart: Cart(cartTests: [])));
  }

  void removeInvalidTests() {
    final tests = [...state.cart.cartTests];
    final validTests =
        tests.where((element) => element.patientIds.isNotEmpty).toList();
    _updateCart(cart: state.cart.copyWith.call(cartTests: validTests));
  }

  void updateTimeSlot(TimeSlot? timeSlot) {
    _updateCart(cart: state.cart.copyWith.call(timeSlot: timeSlot));
  }

  void updateCollectionDate(DateTime collectionDate) {
    _updateCart(cart: state.cart.copyWith.call(collectionDate: collectionDate));
  }

  void applyCoupon({required Coupon coupon}) {
    _updateCart(cart: state.cart.copyWith.call(appliedCoupon: coupon));
  }

  double getCartTestPrices() {
    double cartFinalValue = 0;

    for (var cartTest in state.cart.cartTests) {
      final testPrice = cartTest.test.price ?? 0;
      cartFinalValue += testPrice * cartTest.patientIds.length;
    }

    return cartFinalValue;
  }

  double getCartFinalValue({required BuildContext context}) {
    double cartFinalValue = getCartTestPrices();
    final config = BlocProvider.of<QrisConfigCubit>(context).state.config;

    /// Coupon calculations
    if (state.cart.appliedCoupon != null) {
      final appliedCoupon = state.cart.appliedCoupon!;

      /// If coupon type is direct cashback
      if (appliedCoupon.discountAction == CouponType.dc) {
        /// If percentage coupon
        if (appliedCoupon.discountMode == CouponDiscountType.per) {
          final discountPercentage = appliedCoupon.couponPrice;
          final couponAmount = (getCartTestPrices() * discountPercentage) / 100;
          cartFinalValue = cartFinalValue - couponAmount;
          _updateCart(
              cart:
                  state.cart.copyWith.call(appliedCouponAmount: couponAmount));
        }

        /// If fixed discount coupon
        else if (appliedCoupon.discountMode == CouponDiscountType.fix) {
          final discountAmount = appliedCoupon.couponPrice;
          cartFinalValue = getCartTestPrices() - discountAmount;
          _updateCart(
              cart: state.cart.copyWith
                  .call(appliedCouponAmount: discountAmount));
        }
      }

      /// If coupon type is cashback
      else if (appliedCoupon.discountAction == CouponType.cb) {
        _updateCart(cart: state.cart.copyWith.call(appliedCouponAmount: null));
      }

      /// If coupon type is combo
      else if (appliedCoupon.discountAction == CouponType.sc) {
        /// If percentage coupon
        if (appliedCoupon.cdDiscountType == CouponDiscountType.per) {
          final discountPercentage = appliedCoupon.cdCouponAmt;
          final couponAmount = (getCartTestPrices() * discountPercentage) / 100;
          cartFinalValue = cartFinalValue - couponAmount;
          _updateCart(
              cart:
                  state.cart.copyWith.call(appliedCouponAmount: couponAmount));
        }

        /// If fixed discount coupon
        else if (appliedCoupon.cdDiscountType == CouponDiscountType.fix) {
          final discountAmount = appliedCoupon.cdCouponAmt;
          cartFinalValue = getCartTestPrices() - discountAmount;
          _updateCart(
              cart: state.cart.copyWith
                  .call(appliedCouponAmount: discountAmount));
        }
      }
    }

    /// Check redeem coins condition
    if (state.cart.redeemCoins) {
      cartFinalValue =
          cartFinalValue - ((config!.qcUsedCoins * getCartTestPrices()) ~/ 100);
    }

    /// For sample collection charges
    if (cartFinalValue < (state.cart.pincode?.minOrder ?? 0)) {
      cartFinalValue = cartFinalValue + state.cart.pincode!.deliveryCharge;
    }

    /// For hard copy charges
    if (state.cart.shouldGetHardCopy) {
      cartFinalValue =
          cartFinalValue + (state.cart.pincode?.hardCopyCharge ?? 0);
    }

    /// Subtract wallet amount
    cartFinalValue = cartFinalValue -
        BlocProvider.of<QrisWalletCubit>(context).getTotalAmount();

    return cartFinalValue;
  }

  void updateHardCopy(bool hardCopy) {
    _updateCart(cart: state.cart.copyWith.call(shouldGetHardCopy: hardCopy));
  }

  void removeInvalidTestsFromCart() {
    final tests = [...state.cart.cartTests];
    tests.removeWhere((element) => element.patientIds.isEmpty);

    _updateCart(cart: state.cart.copyWith.call(cartTests: tests));
  }

  void updateCollectionPincode(Pincode? pincode) {
    _updateCart(cart: state.cart.copyWith.call(pincode: pincode));
  }

  void toggleRedeemCoins() {
    final shouldRedeemCoins = !state.cart.redeemCoins;
    _updateCart(
        cart: state.cart.copyWith.call(
            redeemCoins: shouldRedeemCoins,
            appliedCouponAmount:
                shouldRedeemCoins ? null : state.cart.appliedCouponAmount,
            appliedCoupon:
                shouldRedeemCoins ? null : state.cart.appliedCoupon));
  }
}
