import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qris_health/modules/intro_module/screens/onboarding_screen.dart';

import '../../../constants/app_constants.dart';
import '../../../constants/enums/snackbar_type.dart';

class CustomSplashScreen extends StatefulWidget {
  const CustomSplashScreen({super.key});

  @override
  State<CustomSplashScreen> createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((_) async {
      try {
        Navigator.of(context).pushAndRemoveUntil(
            CupertinoPageRoute(builder: (context) => OnboardingScreen()),
            (route) => false);
      } catch (e) {
        AppConstants.showSnackbar(
            text:
                'There is some problem in opening app. Please try again after some time or contact Musclify Support',
            type: SnackbarType.error);
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
