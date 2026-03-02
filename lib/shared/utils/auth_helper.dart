import 'package:flutter/cupertino.dart';
import 'package:qris_health/modules/login_module/screens/login_phone_number_screen.dart';
import 'package:qris_health/shared/models/notification_launch_data.dart';
import 'package:qris_health/shared/services/token_manager.dart';
import 'package:qris_health/shared/services/token_storage_service.dart';

class AuthHelper {
  static bool isAuthError(String error) {
    final errorLower = error.toLowerCase();
    return errorLower.contains('session expired') ||
        errorLower.contains('please login again') ||
        errorLower.contains('unauthorized') ||
        errorLower.contains('token') ||
        errorLower.contains('401') ||
        errorLower.contains('403');
  }

  static Future<bool> checkAndRedirectIfUnauthorized() async {
    final hasToken = await TokenStorageService.hasValidToken();
    if (!hasToken) {
      await redirectToLogin();
      return false;
    }
    return true;
  }

  static Future<void> handleAuthError(String error) async {
    if (isAuthError(error)) {
      await TokenManager.clearAllCredentials();
      await redirectToLogin();
    }
  }

  static Future<void> redirectToLogin() async {
    final navigatorKey = NotificationLaunchData.navigatorKey;
    final context = navigatorKey.currentContext;
    
    if (context != null) {
      await Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(builder: (context) => const LoginPhoneNumberScreen()),
        (route) => false,
      );
    }
  }
}

