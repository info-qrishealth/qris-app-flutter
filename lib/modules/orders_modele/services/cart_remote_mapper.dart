import 'package:flutter/foundation.dart';
import 'package:qris_health/modules/address_module/models/address/address.dart';
import 'package:qris_health/modules/all_scans_module/models/test_package_model/test_package_model.dart';
import 'package:qris_health/modules/orders_modele/models/cart/cart.dart';
import 'package:qris_health/modules/orders_modele/models/cart/cart_summary.dart';
import 'package:qris_health/modules/orders_modele/models/coupon/coupon.dart';
import 'package:qris_health/modules/orders_modele/models/time_slot/time_slot.dart';
import 'package:qris_health/modules/patients_module/models/patient/patient.dart';

class CartRemoteMapper {
  CartRemoteMapper._();

  static T? _tryParse<T>(
    dynamic raw,
    T Function(Map<String, dynamic>) fromJson,
    String tag,
  ) {
    if (raw is! Map<String, dynamic>) return null;
    try {
      return fromJson(raw);
    } catch (e) {
      debugPrint('CartRemoteMapper: $tag parse failed: $e');
      return null;
    }
  }

  static CartSummary? summaryFromServerBody(Map<String, dynamic> b) {
    final hasPricing =
        b.containsKey('cartFinalValue') || b.containsKey('deliveryCharge');
    if (!hasPricing) return null;
    return CartSummary.fromJson(b);
  }

  static Cart cartFromServerBody(Map<String, dynamic> b) {
    final items = b['items'] as List<dynamic>? ?? const [];
    final cartTests = <CartTest>[];
    for (final raw in items) {
      if (raw is! Map<String, dynamic>) continue;
      final testMap = raw['test'] as Map<String, dynamic>?;
      final test = _tryParse(testMap, TestPackageModel.fromJson, 'test');
      if (test == null) continue;
      final patientIds = (raw['patientIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const <int>[];
      cartTests.add(CartTest(test: test, patientIds: patientIds));
    }

    final coupon = _tryParse(b['coupon'], Coupon.fromJson, 'coupon');
    DateTime? collectionDate;
    final rawDate = b['collectionDate'];
    if (rawDate is String && rawDate.isNotEmpty) {
      collectionDate = DateTime.tryParse(rawDate);
    }
    final hardCopy = b['hardCopy'];
    final walletRedeemedAmount = b['walletRedeemedAmount'];
    final redeemCoins = b['redeemCoins'];

    var cart = Cart(
      cartTests: cartTests,
      selectedAddress: _tryParse(b['address'], Address.fromJson, 'address'),
      timeSlot: _tryParse(b['slot'], TimeSlot.fromJson, 'slot'),
      collectionDate: collectionDate,
      appliedCoupon: coupon,
      appliedCouponAmount: (b['appliedCouponAmount'] as num?)?.toDouble(),
    );
    if (hardCopy is bool) {
      cart = cart.copyWith(shouldGetHardCopy: hardCopy);
    }
    if (walletRedeemedAmount is num) {
      cart = cart.copyWith(walletRedeemedAmount: walletRedeemedAmount.toInt());
    }
    if (redeemCoins is bool) {
      cart = cart.copyWith(redeemCoins: redeemCoins);
    }
    return cart;
  }

  static List<Patient> patientsFromServerBody(Map<String, dynamic> b) {
    final items = b['items'] as List<dynamic>? ?? const [];
    final byId = <int, Patient>{};
    for (final raw in items) {
      if (raw is! Map<String, dynamic>) continue;
      final patients = raw['patients'];
      if (patients is! List) continue;
      for (final p in patients) {
        if (p is! Map<String, dynamic>) continue;
        try {
          final patient = Patient.fromJson(p);
          final pid = patient.id;
          if (pid != null) {
            byId[pid] = patient;
          }
        } catch (_) {}
      }
    }
    return byId.values.toList();
  }
}
