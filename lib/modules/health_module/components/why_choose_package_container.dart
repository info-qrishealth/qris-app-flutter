import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/health_score_module/components/heath_score_info_tile.dart';
import 'package:qris_health/styles/app_colors.dart';

class WhyChoosePackageContainer extends StatelessWidget {
  const WhyChoosePackageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return DottedBorder(
        color: AppColors.primaryPink.withOpacity(0.7),
        borderType: BorderType.RRect,
        radius: Radius.circular(14),
        borderPadding: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                  color: AppColors.primaryPink,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(14),
                      topLeft: Radius.circular(14))),
              child: Text('Why Choose our Wellness Packages?',
                  style: textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontFamily: AppConstants.latoFontFamily))),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                HealthScoreInfoTile(
                    imagePath:
                        'assets/images/icons/package_icons/personalized_care_icon.png',
                    title: 'Personalized Care',
                    description:
                        'Tailored wellness plans based on your unique needs.'),
                SizedBox(height: 8),
                HealthScoreInfoTile(
                    imagePath:
                        'assets/images/icons/package_icons/expert_icon.png',
                    title: 'Expert Guidance',
                    description:
                        'Access to certified professionals and specialists.'),
                SizedBox(height: 8),
                HealthScoreInfoTile(
                    imagePath:
                        'assets/images/icons/package_icons/support_icon.png',
                    title: 'Comprehensive Support',
                    description:
                        'Solutions for mind and body under one platform.'),
                SizedBox(height: 8),
                HealthScoreInfoTile(
                    imagePath:
                        'assets/images/icons/package_icons/seamless_experience_icon.png',
                    title: 'Seamless Experience',
                    description:
                        'Easy booking, detailed insights, and real-time updates.'),
              ])),
        ]));
  }
}
