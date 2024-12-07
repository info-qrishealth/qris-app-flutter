import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/login_module/screens/login_phone_number_screen.dart';
import 'package:qris_health/styles/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.scaffoldPadding),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 16),
                      Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                              'assets/images/logos/horizontal_logo.png',
                              height: 46)),
                      Spacer(),
                      SvgPicture.asset(
                          'assets/images/illustrations/intro-illustration.svg',
                          height: 214),
                      SizedBox(height: 52),
                      Text('Your Health, Simplified',
                          style: textTheme.headlineLarge!
                              .copyWith(fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center),
                      SizedBox(height: 8),
                      Text(
                          'Find trusted doctors, book lab tests, schedule scans, and discover your wellness—all in one place\nwith Qris Health.',
                          style: textTheme.bodyLarge!.copyWith(
                              height: 1.4,
                              fontWeight: FontWeight.w300,
                              color: AppColors.lightText),
                          textAlign: TextAlign.center),
                      Spacer(),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(CupertinoPageRoute(
                                builder: (context) => LoginPhoneNumberScreen()));
                          },
                          child: Text('Get Started')),
                      SizedBox(height: 16),
                    ]))));
  }
}
