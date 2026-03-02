import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/shared/utils/wrappers/wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartService {
  static const String _localCartKey = 'qris_cart_data';

  /// Save cart to backend
  static Future<void> saveCartToBackend({
    required String userId,
    required String cartData,
  }) async {
    final url = '${AppConstants.baseUrl}/cart/$userId';

    try {
      await Wrapper.post(url, json.encode({'cartData': cartData}));
    } catch (e) {
      debugPrint('Error saving cart to backend: $e');
      rethrow;
    }
  }

  /// Get cart from backend
  static Future<Map<String, dynamic>?> getCartFromBackend({required String userId}) async {
    final url = '${AppConstants.baseUrl}/cart/$userId';

    try {
      final response = await Wrapper.get(url);
      final data = json.decode(response)['body'];
      
      if (data == null || data['cart_data'] == null) {
        return null;
      }

      return {
        'cart_data': data['cart_data'],
        'patients': data['patients'] ?? {}
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

  /// Save cart to both backend and local storage
  static Future<void> saveCart({
    required String userId,
    required String cartData,
  }) async {
    // Save locally first (instant)
    await saveCartLocally(cartData: cartData);

    // Then sync to backend (async)
    try {
      await saveCartToBackend(userId: userId, cartData: cartData);
    } catch (e) {
      debugPrint('Backend sync failed, cart saved locally only');
    }
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
}

