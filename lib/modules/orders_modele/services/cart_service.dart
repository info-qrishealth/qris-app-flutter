import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/shared/utils/wrappers/wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartService {
  CartService._();
  static const String _localCartKey = 'qris_cart_data';
  static String get _root => '${AppConstants.baseUrl}/cart';

  static Map<String, dynamic>? _decodeBody(String response) {
    final decoded = json.decode(response) as Map<String, dynamic>?;
    final body = decoded?['body'];
    if (body is Map<String, dynamic>) return body;
    return null;
  }

  /// Full cart payload (items, address, slot, coupon, pricing fields).
  static Future<Map<String, dynamic>?> fetchFullCart() async {
    try {
      final response = await Wrapper.get(_root);
      return _decodeBody(response);
    } catch (e) {
      debugPrint('CartService.fetchFullCart: $e');
      rethrow;
    }
  }

  static Future<Map<String, dynamic>?> _post(String path, Map<String, dynamic> body) async {
    final response = await Wrapper.post('$_root$path', json.encode(body));
    return _decodeBody(response);
  }

  static Future<Map<String, dynamic>?> _put(String path, Map<String, dynamic> body) async {
    final response = await Wrapper.put('$_root$path', json.encode(body));
    return _decodeBody(response);
  }

  static Future<Map<String, dynamic>?> _delete(String path) async {
    final response = await Wrapper.delete('$_root$path');
    return _decodeBody(response);
  }

  // Coupon

  static Future<Map<String, dynamic>?> applyCoupon({
    required String couponCode,
    String platform = 'app',
  }) =>
      _post('/coupon/apply', {
        'couponCode': couponCode.trim(),
        'platform': platform,
      });

  static Future<Map<String, dynamic>?> removeCoupon() => _post('/coupon/remove', {});

  // Address 

  static Future<Map<String, dynamic>?> attachAddress({required int addressId}) =>
      _put('/address', {'addressId': addressId});

  static Future<Map<String, dynamic>?> removeAddress() => _delete('/address');

  // Hard copy 

  static Future<Map<String, dynamic>?> applyHardCopy() => _put('/hard-copy', {});

  static Future<Map<String, dynamic>?> removeHardCopy() => _delete('/hard-copy');

  // Redeem coins  

  static Future<Map<String, dynamic>?> applyRedeemCoins() => _put('/redeem-coins', {});

  static Future<Map<String, dynamic>?> removeRedeemCoins() => _delete('/redeem-coins');

  // Slot

  static Future<Map<String, dynamic>?> updateSlot({
    required int slotId,
    String? collectionDate,
  }) =>
      _put('/slot', {
        'slotId': slotId,
        if (collectionDate != null) 'collectionDate': collectionDate,
      });

  // Items / patients 

  static Future<Map<String, dynamic>?> addCartItem({
    required int testId,
    String? type,
  }) =>
      _post('/items', {
        'testId': testId,
        if (type != null && type.isNotEmpty) 'type': type,
      });

  static Future<Map<String, dynamic>?> removeCartItem({required int testId}) =>
      _delete('/items/$testId');

  static Future<Map<String, dynamic>?> addPatientToCartItem({
    required int testId,
    required int patientId,
  }) =>
      _post('/items/$testId/patients', {'patientId': patientId});

  static Future<Map<String, dynamic>?> removePatientFromCartItem({
    required int testId,
    required int patientId,
  }) =>
      _delete('/items/$testId/patients/$patientId');


  static Future<void> saveCartLocally({required String cartData}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_localCartKey, cartData);
    } catch (e) {
      debugPrint('CartService.saveCartLocally: $e');
    }
  }

  static Future<String?> getCartLocally() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_localCartKey);
    } catch (e) {
      debugPrint('CartService.getCartLocally: $e');
      return null;
    }
  }

  static Future<void> clearCartLocally() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_localCartKey);
    } catch (e) {
      debugPrint('CartService.clearCartLocally: $e');
    }
  }

  static Future<void> clearCartForUser() async {
    await clearCartLocally();
  }
}

