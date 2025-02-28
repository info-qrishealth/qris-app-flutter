import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/app_constants.dart';
import '../../../styles/app_colors.dart';

class PrivacyPolicyText extends StatelessWidget {
  const PrivacyPolicyText({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Text.rich(
        textAlign: TextAlign.center,
        TextSpan(children: [
          TextSpan(
              text: 'By clicking on Login, you agree with our ',
              style: textTheme.labelSmall!.copyWith(
                  color: AppColors.black,
                  fontSize: 10.5,
                  fontFamily: AppConstants.metropolisFontFamily,
                  fontWeight: FontWeight.w400)),
          TextSpan(
              text: 'Privacy Policy',
              style: textTheme.labelSmall!.copyWith(
                  color: AppColors.primaryBlue,
                  fontFamily: AppConstants.metropolisFontFamily,
                  fontWeight: FontWeight.w400),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  await launch(AppConstants.privacyPolicyUrl);
                }),
          TextSpan(
              text: ' and ',
              style: textTheme.labelSmall!.copyWith(
                  color: AppColors.black,
                  fontFamily: AppConstants.metropolisFontFamily,
                  fontWeight: FontWeight.w400)),
          TextSpan(
              text: 'T&C ',
              style: textTheme.labelSmall!.copyWith(
                  color: AppColors.primaryBlue,
                  fontFamily: AppConstants.metropolisFontFamily,
                  fontWeight: FontWeight.w400),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  await launch(AppConstants.termsAndConditionsUrl);
                }),
        ]));
  }
}
