import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../constants/api_params.dart';
import '../../constants/app_constants.dart';
import 'credential_storage_service.dart';
import 'token_storage_service.dart';

class TokenManager {
  TokenManager._();

  static const String phonePasswordLoginMethod = 'phone_password';
  static const String userIdPasswordLoginMethod = 'user_id_password';
  static const String otpLoginMethod = 'otp';

  static bool _isBearer(String token) => token.startsWith('Bearer ');

  static String _stripBearer(String token) =>
      _isBearer(token) ? token.substring(7) : token;

  static Future<String?> _getCurrentToken() async {
    final currentToken = ApiParams.getInstance()?.authorization;
    if (currentToken != null && currentToken.isNotEmpty) {
      return currentToken;
    }

    final storedToken = await TokenStorageService.getToken();
    return storedToken;
  }

  static bool _isTokenExpired(String token) {
    try {
      final cleanToken = _stripBearer(token);
      return JwtDecoder.isExpired(cleanToken);
    } catch (_) {
      return true;
    }
  }

  static bool _isTokenExpiringSoon(String token, {int hours = 24}) {
    try {
      final cleanToken = _stripBearer(token);
      if (JwtDecoder.isExpired(cleanToken)) {
        return true;
      }

      final expirationDate = JwtDecoder.getExpirationDate(cleanToken);
      final now = DateTime.now();
      final hoursUntilExpiry = expirationDate.difference(now).inHours;
      return hoursUntilExpiry <= hours;
    } catch (_) {
      return true;
    }
  }

  static Future<String?> _refreshToken(String token) async {
    try {
      final response = await http.post(
        Uri.parse('${AppConstants.baseUrl}/users/refresh-token'),
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200 &&
          response.headers.containsKey('authorization')) {
        final newToken = response.headers['authorization']!;
        await TokenStorageService.saveToken(newToken);
        return newToken;
      }
    } catch (e) {
      debugPrint('Token refresh error: $e');
    }

    return null;
  }

  static Future<String?> _refreshExpiredToken(String token) async {
    try {
      final response = await http.post(
        Uri.parse('${AppConstants.baseUrl}/users/refresh-expired-token'),
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200 &&
          response.headers.containsKey('authorization')) {
        final newToken = response.headers['authorization']!;
        await TokenStorageService.saveToken(newToken);
        return newToken;
      }
    } catch (e) {
      debugPrint('Expired token refresh error: $e');
    }

    return null;
  }

  static Future<String?> _autoReAuthenticate() async {
    try {
      final credentials = await CredentialStorageService.getCredentials();
      final loginMethod = credentials['loginMethod'];
      final phone = credentials['phone'];
      final password = credentials['password'];
      final userId = credentials['userId'];

      if (loginMethod == phonePasswordLoginMethod &&
          phone != null &&
          password != null &&
          phone.isNotEmpty &&
          password.isNotEmpty) {
        final response = await http.post(
          Uri.parse('${AppConstants.baseUrl}/users/login-by-password'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: json.encode({
            'phoneNumber': phone,
            'password': password,
          }),
        );

        if (response.statusCode == 200 &&
            response.headers.containsKey('authorization')) {
          final newToken = response.headers['authorization']!;
          await TokenStorageService.saveToken(newToken);
          return newToken;
        }
      } else if (loginMethod == userIdPasswordLoginMethod &&
          userId != null &&
          password != null &&
          userId.isNotEmpty &&
          password.isNotEmpty) {
        final response = await http.post(
          Uri.parse('${AppConstants.baseUrl}/users/login-by-id-password'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: json.encode({
            'userId': userId,
            'password': password,
          }),
        );

        if (response.statusCode == 200 &&
            response.headers.containsKey('authorization')) {
          final newToken = response.headers['authorization']!;
          await TokenStorageService.saveToken(newToken);
          return newToken;
        }
      }
    } catch (e) {
      debugPrint('Auto re-authentication error: $e');
    }

    return null;
  }

  static Future<String?> ensureValidToken() async {
    String? token = await _getCurrentToken();

    if (token == null || token.isEmpty) {
      token = await _autoReAuthenticate();
      return token;
    }

    if (_isTokenExpired(token)) {
      final refreshedToken = await _refreshExpiredToken(token);
      if (refreshedToken != null) {
        return refreshedToken;
      }

      token = await _autoReAuthenticate();
      return token;
    }

    if (_isTokenExpiringSoon(token)) {
      final refreshedToken = await _refreshToken(token);
      if (refreshedToken != null) {
        return refreshedToken;
      }
    }

    if (token != null && token.isNotEmpty) {
      ApiParams.getInstance()!.authorization = token;
    }

    return token;
  }

  static Future<void> saveCredentialsOnLogin({
    required String loginMethod,
    String? phone,
    String? password,
    String? userId,
  }) async {
    await CredentialStorageService.saveCredentials(
      loginMethod: loginMethod,
      phone: phone,
      password: password,
      userId: userId,
    );
  }

  static Future<void> clearAllCredentials() async {
    await TokenStorageService.clearAllAuthData();
    await CredentialStorageService.clearCredentials();
  }

  static Future<bool> hasStoredCredentials() async {
    return CredentialStorageService.hasAnyCredentials();
  }
}
