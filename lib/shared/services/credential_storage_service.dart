import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CredentialStorageService {
  CredentialStorageService._();

  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static const String _phoneKey = 'qs_cred_phone';
  static const String _passwordKey = 'qs_cred_password';
  static const String _userIdKey = 'qs_cred_user_id';
  static const String _loginMethodKey = 'qs_cred_login_method';

  static Future<void> saveCredentials({
    String? phone,
    String? password,
    String? userId,
    required String loginMethod,
  }) async {
    if (phone != null && phone.isNotEmpty) {
      await _storage.write(key: _phoneKey, value: phone);
    } else {
      await _storage.delete(key: _phoneKey);
    }

    if (password != null && password.isNotEmpty) {
      await _storage.write(key: _passwordKey, value: password);
    } else {
      await _storage.delete(key: _passwordKey);
    }

    if (userId != null && userId.isNotEmpty) {
      await _storage.write(key: _userIdKey, value: userId);
    } else {
      await _storage.delete(key: _userIdKey);
    }

    await _storage.write(key: _loginMethodKey, value: loginMethod);
  }

  static Future<Map<String, String?>> getCredentials() async {
    final phone = await _storage.read(key: _phoneKey);
    final password = await _storage.read(key: _passwordKey);
    final userId = await _storage.read(key: _userIdKey);
    final loginMethod = await _storage.read(key: _loginMethodKey);

    return {
      'phone': phone,
      'password': password,
      'userId': userId,
      'loginMethod': loginMethod,
    };
  }

  static Future<bool> hasAnyCredentials() async {
    final credentials = await getCredentials();
    return (credentials['phone']?.isNotEmpty ?? false) ||
        (credentials['userId']?.isNotEmpty ?? false);
  }

  static Future<void> clearCredentials() async {
    await _storage.delete(key: _phoneKey);
    await _storage.delete(key: _passwordKey);
    await _storage.delete(key: _userIdKey);
    await _storage.delete(key: _loginMethodKey);
  }
}
