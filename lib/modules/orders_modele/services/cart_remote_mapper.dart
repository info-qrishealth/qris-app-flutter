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

  static TestPackageModel parseTest(Map<String, dynamic>? raw, {required int fallbackTestId}) {
    if (raw == null || raw.isEmpty) {
      return _minimalTest(fallbackTestId);
    }
    try {
      return TestPackageModel.fromJson(_normalizeTestRow(raw));
    } catch (e, st) {
      debugPrint('CartRemoteMapper: TestPackageModel.fromJson failed ($e)');
      debugPrint('$st');
      return _minimalTest((raw['id'] as num?)?.toInt() ?? fallbackTestId, raw: raw);
    }
  }

  static Map<String, dynamic> _normalizeTestRow(Map<String, dynamic> r) {
    final m = Map<String, dynamic>.from(r);
    String str(dynamic v) => v?.toString() ?? '';
    if (m['dis_order'] != null && m['dis_order'] is! String) {
      m['dis_order'] = str(m['dis_order']);
    }
    return m;
  }

  static TestPackageModel _minimalTest(int id, {Map<String, dynamic>? raw}) {
    final title = raw?['title']?.toString() ?? raw?['package']?.toString() ?? 'Test #$id';
    final price = (raw?['price'] as num?)?.toInt() ?? 0;
    return TestPackageModel(
      id: id,
      bookingTestId: null,
      parent: null,
      type: null,
      package: null,
      test: null,
      title: title,
      productH1: null,
      parameters: null,
      productH3: null,
      shortDesc: null,
      description: null,
      demoVideo: null,
      courseType: null,
      price: price,
      specialPrice: null,
      discount: null,
      disallowed: null,
      popular: null,
      relatedPro: null,
      riskArea: null,
      fastingTime: null,
      pic: null,
      customParameterCount: null,
      questions: null,
      metaTitle: null,
      metaKey: null,
      metaDesc: null,
      canonical: null,
      slug: null,
      sampleType: raw?['sample_type']?.toString(),
      tubeType: raw?['tube_type']?.toString(),
      wellness: null,
      teamIds: null,
      status: raw?['status']?.toString(),
      disOrder: null,
      scanType: null,
      rpDescription: null,
      reviewCount: null,
      includedPackages: const [],
      rating: null,
    );
  }

  static Address? parseAddress(dynamic raw) {
    if (raw is! Map<String, dynamic>) return null;
    try {
      return Address.fromJson(raw);
    } catch (e) {
      debugPrint('CartRemoteMapper: Address.fromJson failed: $e');
      return null;
    }
  }

  static TimeSlot? parseTimeSlot(dynamic raw) {
    if (raw is! Map<String, dynamic>) return null;
    try {
      return TimeSlot.fromJson(raw);
    } catch (e) {
      debugPrint('CartRemoteMapper: TimeSlot.fromJson failed: $e');
      return null;
    }
  }

  static Coupon? parseCoupon(dynamic raw) {
    if (raw is! Map<String, dynamic>) return null;
    try {
      return Coupon.fromJson(raw);
    } catch (e) {
      debugPrint('CartRemoteMapper: Coupon.fromJson failed: $e');
      return null;
    }
  }

  static DateTime? parseCollectionDate(dynamic raw) {
    if (raw is! String || raw.isEmpty) return null;
    try {
      return DateTime.parse(raw);
    } catch (_) {
      return null;
    }
  }

  static double _itemsSubtotal(List<dynamic>? items) {
    if (items == null) return 0;
    var sum = 0.0;
    for (final e in items) {
      if (e is! Map<String, dynamic>) continue;
      final test = e['test'] as Map<String, dynamic>?;
      final price = (test?['price'] as num?)?.toInt() ?? 0;
      final pids = e['patientIds'] as List<dynamic>? ?? const [];
      final n = pids.isEmpty ? 1 : pids.length;
      sum += price * n;
    }
    return sum;
  }

  static CartSummary? summaryFromServerBody(Map<String, dynamic> b) {
    final hasPricing = b.containsKey('totalCartValue') ||
        b.containsKey('cartFinalValue') ||
        b.containsKey('collectionCharge') ||
        b.containsKey('deliveryCharge');
    if (!hasPricing) return null;

    final items = b['items'] as List<dynamic>?;
    final subtotal = _itemsSubtotal(items);
    final collection =
        (b['collectionCharge'] as num?)?.toInt() ?? (b['deliveryCharge'] as num?)?.toInt() ?? 0;
    final finalValue =
        (b['totalCartValue'] as num?)?.toDouble() ?? (b['cartFinalValue'] as num?)?.toDouble() ?? 0;

    return CartSummary(
      cartTestPrices: (b['cartTestPrices'] as num?)?.toDouble() ?? subtotal,
      baseCartValue: (b['baseCartValue'] as num?)?.toDouble() ?? subtotal + collection,
      deliveryCharge: collection,
      hardCopyCharges: (b['hardCopyCharges'] as num?)?.toInt() ?? 0,
      cartFinalValue: finalValue,
      walletRedeemedAmount: (b['walletRedeemedAmount'] as num?)?.toInt() ?? 0,
      appliedCouponAmount: (b['appliedCouponAmount'] as num?)?.toDouble(),
      redeemedQrisCoins: (b['redeemedQrisCoins'] as num?)?.toInt() ?? 0,
      sampleType: b['sampleType'] as String? ?? '',
      tubeType: b['tubeType'] as String? ?? '',
      availableWalletBalance: (b['availableWalletBalance'] as num?)?.toDouble() ?? 0,
      availableQrisCoins: (b['availableQrisCoins'] as num?)?.toDouble() ?? 0,
    );
  }

  static Cart cartFromServerBody(Map<String, dynamic> b) {
    final items = b['items'] as List<dynamic>? ?? const [];
    final cartTests = <CartTest>[];
    for (final raw in items) {
      if (raw is! Map<String, dynamic>) continue;
      final testId = (raw['testId'] as num?)?.toInt() ?? 0;
      final testMap = raw['test'] as Map<String, dynamic>?;
      final test = parseTest(testMap, fallbackTestId: testId);
      final patientIds = (raw['patientIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const <int>[];
      cartTests.add(CartTest(test: test, patientIds: patientIds));
    }

    final coupon = parseCoupon(b['coupon']);
    return Cart(
      cartTests: cartTests,
      selectedAddress: parseAddress(b['address']),
      timeSlot: parseTimeSlot(b['slot']),
      collectionDate: parseCollectionDate(b['collectionDate']),
      appliedCoupon: coupon,
      appliedCouponAmount: (b['appliedCouponAmount'] as num?)?.toDouble(),
      shouldGetHardCopy: b['hardCopy'] == true,
      pincode: null,
      walletRedeemedAmount: (b['walletRedeemedAmount'] as num?)?.toInt() ?? 0,
      redeemedQrisCoins: (b['redeemedQrisCoins'] as num?)?.toInt() ?? 0,
      wellnessAnswers: null,
      redeemCoins: b['redeemCoins'] != false,
    );
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
