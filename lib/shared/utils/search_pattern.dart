import 'package:qris_health/shared/extensions/string_extension.dart';

class SearchPattern {
  static bool isValidPhoneNumber(String? phoneNumber) {
    return phoneNumber != null &&
        phoneNumber.length == 10 &&
        phoneNumber.isNumeric;
  }

  static bool isValidPassword(String? password) {
    return password != null && password.length >= 8;
  }

  static bool isValidEmail(String? email) {
    return email != null &&
        email.isNotEmpty &&
        email.contains('@') &&
        email.contains('.');
  }
}
