import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qris_health/constants/api_params.dart';
import 'package:qris_health/constants/pref_constants.dart';
import 'package:qris_health/modules/intro_module/screens/onboarding_screen.dart';
import 'package:qris_health/modules/login_module/mixins/login_helper_mixin.dart';
import 'package:qris_health/modules/login_module/screens/login_phone_number_screen.dart';
import 'package:qris_health/modules/users_module/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomSplashScreen extends StatefulWidget {
  const CustomSplashScreen({super.key});

  @override
  State<CustomSplashScreen> createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen>
    with LoginHelperMixin {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((_) async {
      try {
        final prefs = await SharedPreferences.getInstance();
        final auth = prefs.getString(PrefConstants.authToken);
        final phoneNumber = prefs.getString(PrefConstants.phoneNumber);

        if (auth == null || phoneNumber == null) {
          final isOpeningForFirstTime =
              prefs.getBool(PrefConstants.isOpeningForTheFirstTime);

          Navigator.of(context).pushAndRemoveUntil(
              CupertinoPageRoute(
                  builder: (context) => isOpeningForFirstTime != false
                      ? OnboardingScreen()
                      : LoginPhoneNumberScreen()),
              (route) => false);
        } else {
          final user =
              await UserService.getUserByPhoneNumber(phoneNumber: phoneNumber);
          ApiParams.getInstance()!.authorization = auth;
          await operationsForLogin(context: context, user: user);
        }
      } catch (e) {
        Navigator.of(context).pushAndRemoveUntil(
            CupertinoPageRoute(builder: (context) => LoginPhoneNumberScreen()),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          Image.asset('assets/images/logos/full_logo.png', height: 135),
          const SizedBox(height: 32),
          const SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator.adaptive(strokeWidth: 2))
        ])));
  }
}
