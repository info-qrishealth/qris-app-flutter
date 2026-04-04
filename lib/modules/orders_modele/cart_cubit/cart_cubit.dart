import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qris_health/modules/address_module/models/pincode/pincode.dart';
import 'package:qris_health/modules/all_scans_module/models/test_package_model/test_package_model.dart';
import 'package:qris_health/modules/orders_modele/models/coupon/coupon.dart';
import 'package:qris_health/modules/orders_modele/models/time_slot/time_slot.dart';
import 'package:qris_health/modules/orders_modele/services/cart_service.dart';
import 'package:qris_health/modules/patients_module/cubits/patients_cubit/patients_cubit.dart';
import 'package:qris_health/modules/patients_module/models/patient/patient.dart';

import '../../address_module/models/address/address.dart';
import '../models/cart/cart.dart';
import '../models/cart/cart_summary.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  String? _currentUserId;

  int? _serverCartId;

  double get cartTestValue => getCartTestPrices();

  /// Load cart from backend/local storage
  Future<void> loadCart({required String userId, BuildContext? context}) async {
    _currentUserId = userId;
    
    try {
      final cartResponse = await CartService.loadCart(userId: userId);
      
      if (cartResponse != null && cartResponse['cart_data'] != null) {
        final rawId = cartResponse['id'];
        if (rawId != null) {
          _serverCartId = (rawId as num).toInt();
        }

        final cartDataString = cartResponse['cart_data'] as String;
        
        if (cartDataString.isNotEmpty) {
          final cartJson = json.decode(cartDataString);
          final cart = Cart.fromJson(cartJson);
          
          // Load patients into PatientsCubit if context is provided
          if (context != null && cartResponse['patients'] != null) {
            final patientsMap = cartResponse['patients'] as Map<String, dynamic>;
            final patients = patientsMap.values
                .map((patientData) => Patient.fromJson(patientData as Map<String, dynamic>))
                .toList();
            
            if (patients.isNotEmpty && context.mounted) {
              final patientsCubit = BlocProvider.of<PatientsCubit>(context);
              for (var patient in patients) {
                // Check if patient already exists, if not add it
                final existingPatient = patientsCubit.getPatientByPatientId(patientId: patient.id);
                if (existingPatient == null) {
                  patientsCubit.addNewPatient(patient);
                }
              }
            }
          }
          
          emit(CartUpdated(cart: cart));
        }
      }
    } catch (e) {
      debugPrint('Error loading cart: $e');
    }
  }

  /// Save cart to backend and local storage
  Future<void> _saveCart() async {
    if (_currentUserId == null) return;
    
    try {
      final cartJson = state.cart.toJson();
      final cartDataString = json.encode(cartJson);
      
      final id = await CartService.saveCart(
        userId: _currentUserId!,
        cartData: cartDataString,
      );
      if (id != null) _serverCartId = id;
    } catch (e) {
      debugPrint('Error saving cart: $e');
    }
  }

  Future<void> _ensureServerCartId() async {
    if (_currentUserId == null) return;
    if (_serverCartId != null) return;

    final cartJson = json.encode(state.cart.toJson());
    final id = await CartService.saveCart(
      userId: _currentUserId!,
      cartData: cartJson,
    );
    if (id != null) _serverCartId = id;
    if (_serverCartId == null) {
      final data = await CartService.getCartFromBackend(userId: _currentUserId!);
      final rawId = data?['id'];
      if (rawId != null) _serverCartId = (rawId as num).toInt();
    }
  }

  Future<void> applyCouponByCode({
    required String couponCode,
    String? userId,
    BuildContext? context,
  }) async {
    final uid = userId ?? _currentUserId;
    if (uid == null) {
      throw Exception('Not logged in');
    }
    _currentUserId = uid;

    await _ensureServerCartId();
    final cid = _serverCartId;
    if (cid == null) {
      throw Exception('Could not sync cart. Please try again.');
    }

    await CartService.applyCoupon(
      userId: uid,
      cartId: cid,
      couponCode: couponCode,
    );
    await loadCart(userId: uid, context: context);
    await loadCartSummary(userId: uid);
  }

  void _updateCart({required Cart cart}) {
    emit(CartUpdated(cart: cart, cartSummary: null));
    _saveCart();
  }

  void addToCart(TestPackageModel testPackageModel) {
    if (state.cart.cartTests
        .any((element) => element.test.id == testPackageModel.id)) {
      return;
    }

    removeAppliedCouponAndCoins();
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
      removeAppliedCouponAndCoins();

      _updateCart(
          cart: state.cart.copyWith.call(
              cartTests: [...tests]..insert(cartTestIndex, updatedCartTest)));
    }
  }

  bool isPatientAlreadyAddedToThisTest(
      {required int testId, required int patientId}) {
    final cartTestIndex =
        state.cart.cartTests.indexWhere((element) => element.test.id == testId);

    if (cartTestIndex != -1) {
      final cartTest = state.cart.cartTests[cartTestIndex];
      return cartTest.patientIds.any((element) => element == patientId);
    }

    return false;
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
          .call(patientIds: [...cartTest.patientIds]..remove(patientId));
      final tests = [...state.cart.cartTests]..removeAt(cartTestIndex);
      removeAppliedCouponAndCoins();

      _updateCart(
          cart: state.cart.copyWith.call(
              cartTests: [...tests]..insert(cartTestIndex, updatedCartTest)));
    }
  }

  void removeTestFromCart(int testId) {
    final index =
        state.cart.cartTests.indexWhere((element) => element.test.id == testId);

    if (index != -1) {
      removeAppliedCouponAndCoins();
      _updateCart(
          cart: state.cart.copyWith
              .call(cartTests: [...state.cart.cartTests]..removeAt(index)));
    }
  }

  /// Clear cart from memory, backend and local storage
  Future<void> clearCart() async {
    if (_currentUserId != null) {
      await CartService.clearCart(userId: _currentUserId!);
    }
    _serverCartId = null;
    emit(CartInitial(cart: Cart(cartTests: []), cartSummary: null));
  }

  /// Set user ID for cart persistence
  void setUserId(String userId) {
    _currentUserId = userId;
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

  /// Fetches cart summary from backend (all calculations done server-side).
  Future<void> loadCartSummary({
    required String userId,
  }) async {
    if (state.cart.cartTests.isEmpty) return;
    try {
      final cartDataString = json.encode(state.cart.toJson());
      final result = await CartService.calculateCart(
        userId: userId,
        cartData: cartDataString,
      );
      if (result == null) return;
      final summary = CartSummary.fromJson(result);
      final updatedCart = state.cart.copyWith.call(
        walletRedeemedAmount: summary.walletRedeemedAmount,
        appliedCouponAmount: summary.appliedCouponAmount,
        redeemedQrisCoins: summary.redeemedQrisCoins,
      );
      emit(CartUpdated(cart: updatedCart, cartSummary: summary));
    } catch (e) {
      debugPrint('Error loading cart summary: $e');
    }
  }

  /// Reads a value from cart summary or returns default (no logic/calc change).
  T _fromSummary<T>(T Function(CartSummary s) getter, T defaultValue) {
    final s = state.cartSummary;
    return s != null ? getter(s) : defaultValue;
  }

  /// Cart test total (package prices only). From backend summary when available.
  double getCartTestPrices() =>
      _fromSummary((s) => s.cartTestPrices, 0.0);

  /// Final payable amount. From backend summary when available.
  double getCartFinalValue({BuildContext? context}) =>
      _fromSummary((s) => s.cartFinalValue, 0.0);

  /// Base cart value (packages + delivery + hard copy). From backend summary when available.
  double getBaseCartValue() =>
      _fromSummary((s) => s.baseCartValue, 0.0);

  void updateHardCopy(bool hardCopy) {
    removeAppliedCouponAndCoins();
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

  void removeAppliedCouponAndCoins() {
    _updateCart(
        cart: state.cart.copyWith.call(
            appliedCoupon: null,
            appliedCouponAmount: null,
            redeemCoins: false,
            redeemedQrisCoins: 0));
  }

  int getDeliveryCharge() =>
      _fromSummary((s) => s.deliveryCharge, 0);

  int getHardCopyCharges() =>
      _fromSummary((s) => s.hardCopyCharges, 0);

  String getCollectiveSampleType() =>
      _fromSummary((s) => s.sampleType, '');

  String getCollectiveTubeType() =>
      _fromSummary((s) => s.tubeType, '');
}
