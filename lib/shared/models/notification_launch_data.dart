import 'package:flutter/material.dart';

class NotificationLaunchData {
  static String? tappedUrl;
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
}
