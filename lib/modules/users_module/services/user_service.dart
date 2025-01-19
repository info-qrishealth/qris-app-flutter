import 'dart:convert';

import 'package:http/http.dart';
import 'package:qris_health/constants/api_params.dart';
import 'package:qris_health/constants/app_constants.dart';

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
}
