import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../models/app_info.dart';

class FirebaseService {
  static Future<AppInfo> getCurrentAppInfo() async {
    try {
      final response = await FirebaseDatabase.instance
          .ref()
          .child(GetPlatform.isIOS ? 'ios-app-data' : 'android-app-data')
          .once();

      final appInfo =
          AppInfo.fromJson(Map.from(response.snapshot.value as Map));

      return appInfo;
    } catch (e) {
      rethrow;
    }
  }
}
