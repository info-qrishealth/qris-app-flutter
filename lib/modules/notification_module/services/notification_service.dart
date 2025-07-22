import 'dart:convert';

import 'package:flutter_udid/flutter_udid.dart';

import '../../../constants/app_constants.dart';
import '../../../shared/utils/wrappers/wrapper.dart';
import '../models/notification_token.dart';

class NotificationService {
  static Future<void> setNotificationToken(
      {required NotificationToken notificationToken}) async {
    final url = '${AppConstants.baseUrl}/notification/token';
    await Wrapper.post(url, json.encode(notificationToken.toJson()));
  }

  static Future<void> removeNotificationToken() async {
    final uuid = await FlutterUdid.udid;
    final url = '${AppConstants.baseUrl}/notification/remove-token';

    await Wrapper.delete(url, body: json.encode({'device_identifier': uuid}));
  }
}
