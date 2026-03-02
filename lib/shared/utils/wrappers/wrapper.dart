import 'dart:io';
import 'package:http/http.dart' as http;

import '../../../constants/api_params.dart';
import '../../../constants/app_constants.dart';
import '../../services/token_manager.dart';

class Wrapper {
  static Future<void> _handleUnauthorized() async {
    await TokenManager.clearAllCredentials();
  }

  static Future<String?> _ensureToken(bool requireAuth) async {
    if (!requireAuth) return null;

    final token = await TokenManager.ensureValidToken();
    if (token == null || token.isEmpty) {
      await _handleUnauthorized();
      throw 'Session expired. Please login again';
    }

    ApiParams.getInstance()!.authorization = token;
    return token;
  }

  static Map<String, String> _buildHeaders({
    Map<String, String>? customHeaders,
    bool requireAuth = true,
    String? token,
  }) {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (requireAuth) {
      final authToken = token ?? ApiParams.getInstance()?.authorization;
      if (authToken != null) {
        headers['Authorization'] = authToken;
      }
    }

    if (customHeaders != null) {
      headers.addAll(customHeaders);
    }

    return headers;
  }

  static Future<http.Response> _retryWithFreshToken(
      Future<http.Response> Function(Map<String, String>) requestFn,
      Map<String, String> headers) async {
    final refreshedToken = await TokenManager.ensureValidToken();
    if (refreshedToken == null || refreshedToken.isEmpty) {
      await _handleUnauthorized();
      throw 'Session expired. Please login again';
    }

    ApiParams.getInstance()!.authorization = refreshedToken;
    headers['Authorization'] = refreshedToken;

    final retryResponse = await requestFn(headers);
    return retryResponse;
  }

  static Future<String> post(String url, String? body,
      {Map<String, String>? customHeaders, bool requireAuth = true}) async {
    try {
      final token = await _ensureToken(requireAuth);
      var headers = _buildHeaders(
          customHeaders: customHeaders,
          requireAuth: requireAuth,
          token: token);

      Future<http.Response> makeRequest(Map<String, String> h) => http.post(
            Uri.tryParse(url)!,
            body: body,
            headers: h,
          );

      var response = await makeRequest(headers);

      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 204) {
        throw 'No Item Found';
      } else if ((response.statusCode == 401 || response.statusCode == 403) &&
          requireAuth) {
        response = await _retryWithFreshToken(makeRequest, headers);

        if (response.statusCode == 200) {
          return response.body;
        } else if (response.statusCode == 204) {
          throw 'No Item Found';
        } else if (response.statusCode == 401 ||
            response.statusCode == 403) {
          await _handleUnauthorized();
          throw 'Session expired. Please login again';
        }
      }

      throw AppConstants.getErrorMessage(response.body);
    } on SocketException {
      throw _handleSocketException();
    } catch (e) {
      rethrow;
    }
  }

  static Future<String> get(String url,
      {Map<String, String>? customHeaders, bool requireAuth = true}) async {
    try {
      final token = await _ensureToken(requireAuth);
      var headers = _buildHeaders(
          customHeaders: customHeaders,
          requireAuth: requireAuth,
          token: token);

      Future<http.Response> makeRequest(Map<String, String> h) => http.get(
            Uri.tryParse(url)!,
            headers: h,
          );

      var response = await makeRequest(headers);

      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 204) {
        throw 'No Item Found';
      } else if ((response.statusCode == 401 || response.statusCode == 403) &&
          requireAuth) {
        response = await _retryWithFreshToken(makeRequest, headers);

        if (response.statusCode == 200) {
          return response.body;
        } else if (response.statusCode == 204) {
          throw 'No Item Found';
        } else if (response.statusCode == 401 ||
            response.statusCode == 403) {
          await _handleUnauthorized();
          throw 'Session expired. Please login again';
        }
      }

      throw AppConstants.getErrorMessage(response.body);
    } on SocketException {
      throw _handleSocketException();
    } catch (e) {
      rethrow;
    }
  }

  static Future<String> put(String url, String? body,
      {Map<String, String>? customHeaders, bool requireAuth = true}) async {
    try {
      final token = await _ensureToken(requireAuth);
      var headers = _buildHeaders(
          customHeaders: customHeaders,
          requireAuth: requireAuth,
          token: token);

      Future<http.Response> makeRequest(Map<String, String> h) => http.put(
            Uri.tryParse(url)!,
            body: body,
            headers: h,
          );

      var response = await makeRequest(headers);

      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 204) {
        throw 'No Item Found';
      } else if ((response.statusCode == 401 || response.statusCode == 403) &&
          requireAuth) {
        response = await _retryWithFreshToken(makeRequest, headers);

        if (response.statusCode == 200) {
          return response.body;
        } else if (response.statusCode == 204) {
          throw 'No Item Found';
        } else if (response.statusCode == 401 ||
            response.statusCode == 403) {
          await _handleUnauthorized();
          throw 'Session expired. Please login again';
        }
      }

      throw AppConstants.getErrorMessage(response.body);
    } on SocketException {
      throw _handleSocketException();
    } catch (e) {
      rethrow;
    }
  }

  static Future<String> delete(String url,
      {String? body, Map<String, String>? customHeaders, bool requireAuth = true}) async {
    try {
      final token = await _ensureToken(requireAuth);
      var headers = _buildHeaders(
          customHeaders: customHeaders,
          requireAuth: requireAuth,
          token: token);

      Future<http.Response> makeRequest(Map<String, String> h) => http.delete(
            Uri.tryParse(url)!,
            body: body,
            headers: h,
          );

      var response = await makeRequest(headers);

      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 204) {
        throw 'No Item Found';
      } else if ((response.statusCode == 401 || response.statusCode == 403) &&
          requireAuth) {
        response = await _retryWithFreshToken(makeRequest, headers);

        if (response.statusCode == 200) {
          return response.body;
        } else if (response.statusCode == 204) {
          throw 'No Item Found';
        } else if (response.statusCode == 401 ||
            response.statusCode == 403) {
          await _handleUnauthorized();
          throw 'Session expired. Please login again';
        }
      }

      throw AppConstants.getErrorMessage(response.body);
    } on SocketException {
      throw _handleSocketException();
    } catch (e) {
      rethrow;
    }
  }

  static SocketException _handleSocketException() {
    return const SocketException(
        'No internet. Please check your internet connection');
  }
}
