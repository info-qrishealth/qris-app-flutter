import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/orders_modele/models/cart/cart.dart';
import 'package:qris_health/shared/utils/wrappers/wrapper.dart';

class CartService {
  CartService._();
  static String get _root => '${AppConstants.baseUrl}/cart';

  /// Full cart payload (items, address, slot, coupon, pricing fields).
  static Future<Cart> fetchFullCart() async {
    try {
      final response = await Wrapper.get(_root);
      return Cart.fromJson(json.decode(response)['body']);
    } catch (e) {
      debugPrint('CartService.fetchFullCart: $e');
      rethrow;
    }
  }

  // Coupon

  static Future<Cart?> applyCoupon({
    required String couponCode,
    String platform = 'app',
  }) =>
      _post('/coupon/apply', {
        'couponCode': couponCode.trim(),
        'platform': platform,
      });

  static Future<Cart?> removeCoupon() => _post('/coupon/remove', {});

  // Address

  static Future<Cart?> attachAddress({required int addressId}) =>
      _put('/address', {'addressId': addressId});

  static Future<Cart?> removeAddress() => _delete('/address');

  // Hard copy

  static Future<Cart?> applyHardCopy() => _put('/hard-copy', {});

  static Future<Cart?> removeHardCopy() => _delete('/hard-copy');

  // Redeem coins

  static Future<Cart?> applyRedeemCoins() => _put('/redeem-coins', {});

  static Future<Cart?> removeRedeemCoins() => _delete('/redeem-coins');

  // Slot

  static Future<Cart?> updateSlot({
    required int slotId,
    String? collectionDate,
  }) =>
      _put('/slot', {
        'slotId': slotId,
        if (collectionDate != null) 'collectionDate': collectionDate,
      });

  // Items / patients

  static Future<Cart?> addCartItem({
    required int testId,
    String? type,
  }) =>
      _post('/items', {
        'testId': testId,
        if (type != null && type.isNotEmpty) 'type': type,
      });

  static Future<Cart?> removeCartItem({required int testId}) =>
      _delete('/items/$testId');

  static Future<Cart?> addPatientToCartItem({
    required int testId,
    required int patientId,
  }) =>
      _post('/items/$testId/patients', {'patientId': patientId});

  static Future<Cart?> removePatientFromCartItem({
    required int testId,
    required int patientId,
  }) =>
      _delete('/items/$testId/patients/$patientId');

  static Future<Cart?> _post(String path, Map<String, dynamic> body) async {
    final response = await Wrapper.post('$_root$path', json.encode(body));
    final resBody = json.decode(response)['body'];
    if (resBody == null) return null;
    return Cart.fromJson(resBody);
  }

  static Future<Cart?> _put(String path, Map<String, dynamic> body) async {
    final response = await Wrapper.put('$_root$path', json.encode(body));
    final resBody = json.decode(response)['body'];
    if (resBody == null) return null;
    return Cart.fromJson(resBody);
  }

  static Future<Cart?> _delete(String path) async {
    final response = await Wrapper.delete('$_root$path');
    final resBody = json.decode(response)['body'];
    if (resBody == null) return null;
    return Cart.fromJson(resBody);
  }
}
