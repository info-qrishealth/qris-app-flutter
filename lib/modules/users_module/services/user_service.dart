import 'dart:convert';

import 'package:http/http.dart';
import 'package:qris_health/constants/api_params.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/shared/utils/wrappers/wrapper.dart';

import '../../login_module/models/otp/otp.dart';
import '../../login_module/models/user/user.dart';

class UserService {
  static Future<User> createUser({required User user}) async {
    final url = '${AppConstants.baseUrl}/users';

    try {
      final response = await post(Uri.parse(url),
          body: json.encode(user.toJson()),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          });

      if (response.statusCode == 200 &&
          response.headers.containsKey('authorization')) {
        final auth = response.headers['authorization'].toString();
        ApiParams.getInstance()!.authorization = auth;
        return User.fromJson(json.decode(response.body)['body']);
      }

      throw AppConstants.getErrorMessage(response.body);
    } catch (e) {
      rethrow;
    }
  }

  static Future<User> loginWithOtp({required Otp otp}) async {
    final url = '${AppConstants.baseUrl}/users/login-by-otp';

    try {
      final response = await post(Uri.parse(url),
          body: json.encode(otp.toJson()),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          });

      if (response.statusCode == 200 &&
          response.headers.containsKey('authorization')) {
        final auth = response.headers['authorization'].toString();
        ApiParams.getInstance()!.authorization = auth;
        return User.fromJson(json.decode(response.body)['body']);
      }

      throw AppConstants.getErrorMessage(response.body);
    } catch (e) {
      rethrow;
    }
  }

  static Future<User> loginWithUserIdAndPassword(
      {required String userId, required String password}) async {
    final url = '${AppConstants.baseUrl}/users/login-by-id-password';

    try {
      final response = await post(Uri.parse(url),
          body: json.encode({"userId": userId, "password": password}),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          });

      if (response.statusCode == 200 &&
          response.headers.containsKey('authorization')) {
        final auth = response.headers['authorization'].toString();
        ApiParams.getInstance()!.authorization = auth;
        return User.fromJson(json.decode(response.body)['body']);
      }

      throw AppConstants.getErrorMessage(response.body);
    } catch (e) {
      rethrow;
    }
  }

  static Future<User> getUserByPhoneNumber(
      {required String phoneNumber}) async {
    final url = '${AppConstants.baseUrl}/users/$phoneNumber';

    try {
      final response = await Wrapper.get(url);
      return User.fromJson(json.decode(response)['body']);
    } catch (e) {
      rethrow;
    }
  }}
