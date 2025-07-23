import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/api_params.dart';
import 'package:qris_health/constants/pref_constants.dart';
import 'package:qris_health/modules/health_module/cubits/qris_doctors_cubit/qris_doctors_cubit.dart';
import 'package:qris_health/modules/home_module/popular_packages_cubit/popular_packages_cubit.dart';
import 'package:qris_health/modules/notification_module/models/notification_token.dart';
import 'package:qris_health/modules/notification_module/services/notification_service.dart';
import 'package:qris_health/modules/refer_and_earn_module/cubits/qris_coin_cubit/qris_coins_cubit.dart';
import 'package:qris_health/shared/cubits/qris_config_cubit/qris_config_cubit.dart';
import 'package:qris_health/shared/models/notification_launch_data.dart';
import 'package:qris_health/shared/utils/navigator_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home_module/screens/home_screen.dart';
import '../../refer_and_earn_module/cubits/qris_wallet_cubit/qris_wallet_cubit.dart';
import '../../users_module/cubits/user_cubit.dart';
import '../models/user/user.dart';

mixin LoginHelperMixin {
  Future<void> operationsForLogin(
      {required BuildContext context, required User user}) async {
    try {
      BlocProvider.of<UserCubit>(context).updateUser(user: user);
      BlocProvider.of<PopularPackagesCubit>(context).getPopularPackages();
      BlocProvider.of<QrisDoctorsCubit>(context).getTeamDoctors();
      await BlocProvider.of<QrisConfigCubit>(context).getConfig();

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          PrefConstants.authToken, ApiParams.getInstance()!.authorization!);
      await prefs.setString(PrefConstants.phoneNumber, user.phone!);
      ApiParams.getInstance()!.userId = user.id;
      ApiParams.getInstance()!.phoneNumber = user.phone;

      BlocProvider.of<QrisCoinsCubit>(context).getQrisCoins();
      BlocProvider.of<QrisWalletCubit>(context).getWalletEntries();

      try {
        final token = await FirebaseMessaging.instance.getToken();
        if (token != null) {
          await NotificationService.setNotificationToken(
              notificationToken: NotificationToken(
                  token: token,
                  platform: GetPlatform.isAndroid
                      ? 1
                      : GetPlatform.isIOS
                          ? 2
                          : 3,
                  deviceIdentifier: await FlutterUdid.udid,
                  userId: user.id));
        }
      } catch (e) {
        print(e.toString());
      }

      if (NotificationLaunchData.tappedUrl != null) {
        Navigator.of(context).pushAndRemoveUntil(
            CupertinoPageRoute(builder: (context) => HomeScreen()),
            (_) => false);

        NavigatorUtils.handleUrl(
            url: NotificationLaunchData.tappedUrl,
            navigatorKey: NotificationLaunchData.navigatorKey);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            CupertinoPageRoute(builder: (context) => HomeScreen()),
            (_) => false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
