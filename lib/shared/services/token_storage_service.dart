import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/pref_constants.dart';
import '../../constants/api_params.dart';

class TokenStorageService {
  static Future<void> saveToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      
      if (token.startsWith('Bearer ')) {
        await prefs.setString(PrefConstants.authToken, token);
        ApiParams.getInstance()!.authorization = token;
      } else {
        final bearerToken = 'Bearer $token';
        await prefs.setString(PrefConstants.authToken, bearerToken);
        ApiParams.getInstance()!.authorization = bearerToken;
      }
      
    } catch (e) {
      rethrow;
    }
  }

  static Future<String?> getToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(PrefConstants.authToken);
      
      if (token != null && token.isNotEmpty) {
        ApiParams.getInstance()!.authorization = token;
      }
      
      return token;
    } catch (e) {
      debugPrint('Error getting token: $e');
      return null;
    }
  }

  static Future<void> deleteToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(PrefConstants.authToken);
      ApiParams.getInstance()!.authorization = null;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> hasValidToken() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  static String? getCurrentToken() {
    return ApiParams.getInstance()?.authorization;
  }

  static bool isTokenValid(String? token) {
    if (token == null || token.isEmpty) return false;
    
    if (token.startsWith('Bearer ')) {
      final actualToken = token.substring(7);
      return actualToken.isNotEmpty;
    }
    
    return token.isNotEmpty;
  }

  static Future<void> clearAllAuthData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(PrefConstants.authToken);
      await prefs.remove(PrefConstants.phoneNumber);
      
      ApiParams.getInstance()!.authorization = null;
      ApiParams.getInstance()!.phoneNumber = null;
      ApiParams.getInstance()!.userId = null;
      
    } catch (e) {
      rethrow;
    }
  }
}

