import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/shared/utils/wrappers/wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartService {
  static const String _localCartKey = 'qris_cart_data';

  /// Save cart to backend; returns response `body` (includes cart row id).
  static Future<Map<String, dynamic>?> saveCartToBackendWithResponse({
    required String userId,
    required String cartData,
  }) async {
    final url = '${AppConstants.baseUrl}/cart/$userId';

    try {
      final response = await Wrapper.post(url, json.encode({'cartData': cartData}));
      final decoded = json.decode(response) as Map<String, dynamic>?;
      return decoded?['body'] as Map<String, dynamic>?;
    } catch (e) {
      debugPrint('Error saving cart to backend: $e');
      rethrow;
    }
  }

  /// Save cart to backend
  static Future<void> saveCartToBackend({
    required String userId,
    required String cartData,
  }) async {
    await saveCartToBackendWithResponse(userId: userId, cartData: cartData);
  }

  /// Get cart from backend
  static Future<Map<String, dynamic>?> getCartFromBackend({required String userId}) async {
    final url = '${AppConstants.baseUrl}/cart/$userId';

    try {
      final response = await Wrapper.get(url);
      final data = json.decode(response)['body'] as Map<String, dynamic>?;
      
      if (data == null || data['cart_data'] == null) {
        return null;
      }

      return {
        'cart_data': data['cart_data'],
        'patients': data['patients'] ?? {},
        if (data['id'] != null) 'id': data['id'],
      };
    } catch (e) {
      debugPrint('Error getting cart from backend: $e');
      return null;
    }
  }

  /// Clear cart from backend
  static Future<void> clearCartFromBackend({required String userId}) async {
    final url = '${AppConstants.baseUrl}/cart/$userId';

    try {
      await Wrapper.delete(url);
    } catch (e) {
      debugPrint('Error clearing cart from backend: $e');
    }
  }

  /// Save cart to local storage (fallback)
  static Future<void> saveCartLocally({required String cartData}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_localCartKey, cartData);
    } catch (e) {
      debugPrint('Error saving cart locally: $e');
    }
  }

  /// Get cart from local storage
  static Future<String?> getCartLocally() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_localCartKey);
    } catch (e) {
      debugPrint('Error getting cart locally: $e');
      return null;
    }
  }

  /// Clear cart from local storage
  static Future<void> clearCartLocally() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_localCartKey);
    } catch (e) {
      debugPrint('Error clearing cart locally: $e');
    }
  }

  /// Save cart to both backend and local storage. Returns backend cart id when sync succeeds.
  static Future<int?> saveCart({
    required String userId,
    required String cartData,
  }) async {
    await saveCartLocally(cartData: cartData);

    try {
      final body = await saveCartToBackendWithResponse(userId: userId, cartData: cartData);
      if (body != null && body['id'] != null) {
        return (body['id'] as num).toInt();
      }
    } catch (e) {
      debugPrint('Backend sync failed, cart saved locally only');
    }
    return null;
  }

  /// Load cart from backend, fallback to local
  static Future<Map<String, dynamic>?> loadCart({required String userId}) async {
    try {
      // Try backend first
      final backendData = await getCartFromBackend(userId: userId);
      
      if (backendData != null && backendData['cart_data'] != null) {
        // Sync to local as well
        await saveCartLocally(cartData: backendData['cart_data']);
        return backendData;
      }
    } catch (e) {
      debugPrint('Failed to load from backend, trying local storage');
    }

    // Fallback to local storage
    final localCart = await getCartLocally();
    if (localCart != null) {
      return {
        'cart_data': localCart,
        'patients': {}
      };
    }
    
    return null;
  }

  /// Clear cart from both backend and local
  static Future<void> clearCart({required String userId}) async {
    await clearCartLocally();
    
    try {
      await clearCartFromBackend(userId: userId);
    } catch (e) {
      debugPrint('Failed to clear backend cart');
    }
  }

  /// Calculate cart summary (prices, discounts, delivery, wallet/coins) on the backend.
  /// Wallet and Qris coin balances are read from the server — not send from the app.
  static Future<Map<String, dynamic>?> calculateCart({
    required String userId,
    required String cartData,
  }) async {
    final url = '${AppConstants.baseUrl}/cart/$userId/calculate';

    try {
      final response = await Wrapper.post(url, json.encode({
        'cartData': cartData,
      }));
      final data = json.decode(response);
      final body = data['body'] as Map<String, dynamic>?;
      return body;
    } catch (e) {
      debugPrint('Error calculating cart: $e');
      return null;
    }
  }

  /// Server validates coupon and merges into saved cart
  static Future<Map<String, dynamic>?> applyCoupon({
    required String userId,
    required int cartId,
    required String couponCode,
    String platform = 'app',
  }) async {
    final url = '${AppConstants.baseUrl}/cart/$userId/coupon/apply';
    try {
      final response = await Wrapper.post(
        url,
        json.encode({
          'cartId': cartId,
          'couponCode': couponCode.trim(),
          'platform': platform,
        }),
      );
      final decoded = json.decode(response) as Map<String, dynamic>?;
      return decoded?['body'] as Map<String, dynamic>?;
    } catch (e) {
      debugPrint('Error applying coupon: $e');
      rethrow;
    }
  }

  /// Clears coupon on saved cart.
  static Future<Map<String, dynamic>?> removeCoupon({
    required String userId,
    required int cartId,
  }) async {
    final url = '${AppConstants.baseUrl}/cart/$userId/coupon/remove';
    try {
      final response = await Wrapper.post(
        url,
        json.encode({'cartId': cartId}),
      );
      final decoded = json.decode(response) as Map<String, dynamic>?;
      return decoded?['body'] as Map<String, dynamic>?;
    } catch (e) {
      debugPrint('Error removing coupon: $e');
      rethrow;
    }
  }
}

