import 'dart:convert';

import '../../../constants/app_constants.dart';
import '../../../shared/utils/wrappers/wrapper.dart';
import '../models/otp/otp.dart';

class OtpService {
  static Future<Otp> sendOtp(
      {required String phoneNumber, String? email}) async {
    final url =
        '${AppConstants.baseUrl}/otp/send?phoneNumber=$phoneNumber${email != null ? '&email=$email' : ''}';

    try {
      final response = await Wrapper.post(url, null);
      return Otp.fromJson(json.decode(response)['body']);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> verifyOtp({required Otp otp}) async {
    const url = '${AppConstants.baseUrl}/otp/verify';

    try {
      await Wrapper.post(url, json.encode(otp.toJson()));
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> isUserExists({String? phoneNumber, String? email}) async {
    if (phoneNumber == null && email == null) return false;

    final queryParams = <String, String>{};
    if (phoneNumber != null) queryParams['phoneNumber'] = phoneNumber;
    if (email != null) queryParams['email'] = email;

    final url =
        '${AppConstants.baseUrl}/otp/is-exists?${Uri(queryParameters: queryParams).query}';

    try {
      final response = await Wrapper.get(url);
      return json.decode(response)['body'];
    } catch (e) {
      rethrow;
    }
  }
}
