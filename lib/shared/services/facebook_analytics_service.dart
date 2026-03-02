import 'dart:io';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class FacebookAnalyticsService {
  static final FacebookAppEvents _facebookAppEvents = FacebookAppEvents();
  static bool _isInitialized = false;

  static Future<void> initialize() async {
    if (_isInitialized) return;
    
    try {
      await _facebookAppEvents.setAdvertiserTracking(enabled: true);
      _isInitialized = true;
    } catch (_) {
    }
  }

  static Future<void> requestTrackingPermission() async {
    if (!Platform.isIOS) return;
    
    try {
      const platform = MethodChannel('com.qris.app/att_status');
      
      final nativeStatus = await platform.invokeMethod<String>('getATTStatus');
      
      if (nativeStatus == 'authorized') {
        await _facebookAppEvents.setAdvertiserTracking(enabled: true);
        return;
      }
      
      if (nativeStatus == 'restricted') {
        await _facebookAppEvents.setAdvertiserTracking(enabled: false);
        return;
      }
      
      if (nativeStatus == 'denied') {
        await _facebookAppEvents.setAdvertiserTracking(enabled: false);
        return;
      }
      
      if (nativeStatus == 'notDetermined') {
        final requestResult = await platform.invokeMethod<String>('requestATT');
        
        if (requestResult == 'authorized') {
          await _facebookAppEvents.setAdvertiserTracking(enabled: true);
        } else {
          await _facebookAppEvents.setAdvertiserTracking(enabled: false);
        }
      }
    } catch (e) {
      debugPrint('ATT permission error: $e');
      await _facebookAppEvents.setAdvertiserTracking(enabled: false);
    }
  }

  static Future<void> logAppInstall() async {
    try {
      await _facebookAppEvents.logEvent(
        name: 'fb_mobile_activate_app',
      );
    } catch (_) {
    }
  }
}

