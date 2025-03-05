import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qris_health/modules/all_scans_module/models/test_package_model/test_package_model.dart';
import 'package:qris_health/modules/orders_modele/models/coupon/coupon.dart';
import 'package:qris_health/modules/orders_modele/models/time_slot/time_slot.dart';

import '../../../shared/models/qris_config/qris_config.dart';
import '../../address_module/models/address/address.dart';
import '../models/cart/cart.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void _updateCart({required Cart cart}) {
    emit(CartUpdated(cart: cart));
  }

  void addToCart(TestPackageModel testPackageModel) {
    if (state.cart.cartTests
        .any((element) => element.testId == testPackageModel.id)) {
      return;
    }

    _updateCart(
        cart: state.cart.copyWith.call(cartTests: [
      ...state.cart.cartTests,
      CartTest(testId: testPackageModel.id, patientIds: [])
    ]));
  }

  void addPatientToTest({required int patientId, required int testId}) {
    final cartTestIndex =
        state.cart.cartTests.indexWhere((element) => element.testId == testId);

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
        state.cart.cartTests.indexWhere((element) => element.testId == testId);

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
        state.cart.cartTests.indexWhere((element) => element.testId == testId);

    if (index != -1) {
      _updateCart(
          cart: state.cart.copyWith
              .call(cartTests: [...state.cart.cartTests]..removeAt(index)));
    }
  }

  void clearCart() {
    emit(CartInitial());
  }

  void removeInvalidTests() {
    final tests = [...state.cart.cartTests];
    final validTests =
        tests.where((element) => element.patientIds.isNotEmpty).toList();
    _updateCart(cart: state.cart.copyWith.call(cartTests: validTests));
  }

  void updateTimeSlot(TimeSlot timeSlot) {
    _updateCart(cart: state.cart.copyWith.call(timeSlot: timeSlot));
  }

  void updateCollectionDate(DateTime collectionDate) {
    _updateCart(cart: state.cart.copyWith.call(collectionDate: collectionDate));
  }

  void applyCoupon({required Coupon coupon, required QrisConfig config}) {}
}
