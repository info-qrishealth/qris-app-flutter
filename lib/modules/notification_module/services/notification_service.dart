import 'dart:convert';

import '../../../constants/app_constants.dart';
import '../../../shared/utils/wrappers/wrapper.dart';
import '../models/notification_token.dart';

class NotificationService {
  static Future<void> setNotificationToken(
      {required NotificationToken notificationToken}) async {
    final url = '${AppConstants.baseUrl}/notification/token';
    await Wrapper.post(url, json.encode(notificationToken.toJson()));
  }
}
