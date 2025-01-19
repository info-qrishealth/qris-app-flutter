import 'dart:convert';

import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/shared/utils/wrappers/wrapper.dart';

import '../../login_module/models/user/user.dart';

class UserService {
  static Future<User> createUser({required User user}) async {
    final url = '${AppConstants.baseUrl}/users';

    try {
      final response = await Wrapper.post(url, json.encode(user.toJson()));
      return User.fromJson(json.decode(response)['body']);
    } catch (e) {
      rethrow;
    }
  }
}
