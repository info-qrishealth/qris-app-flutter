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
    const padding = 8.0;

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: textTheme.labelSmall!.copyWith(
          color: AppColors.black,
          fontFamily: AppConstants.metropolisFontFamily,
          fontSize: 10.5,
          fontWeight: FontWeight.w400,
        ),
        children: [
          const TextSpan(text: 'By clicking on Login, you agree with our '),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: InkWell(
              onTap: () async {
                await launchUrl(Uri.parse(AppConstants.privacyPolicyUrl));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: padding),
                child: Text(
                  'Privacy Policy',
                  style: textTheme.labelSmall!.copyWith(
                    color: AppColors.primaryBlue,
                    decoration: TextDecoration.underline,
                    fontFamily: AppConstants.metropolisFontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          const TextSpan(text: ' and '),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: InkWell(
              onTap: () async {
                await launchUrl(Uri.parse(AppConstants.termsAndConditionsUrl));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: padding),
                child: Text(
                  'T&C',
                  style: textTheme.labelSmall!.copyWith(
                    color: AppColors.primaryBlue,
                    decoration: TextDecoration.underline,
                    fontFamily: AppConstants.metropolisFontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
