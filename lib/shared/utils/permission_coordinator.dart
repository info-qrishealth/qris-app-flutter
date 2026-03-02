import 'dart:async';

class PermissionCoordinator {
  static bool _notificationPermissionComplete = false;
  static final Completer<void> _notificationPermissionCompleter = Completer<void>();
  
  static Future<void> waitForNotificationPermission() async {
    if (!_notificationPermissionComplete) {
      await _notificationPermissionCompleter.future;
    }
  }
  
  static void markNotificationPermissionComplete() {
    _notificationPermissionComplete = true;
    if (!_notificationPermissionCompleter.isCompleted) {
      _notificationPermissionCompleter.complete();
    }
  }
}

