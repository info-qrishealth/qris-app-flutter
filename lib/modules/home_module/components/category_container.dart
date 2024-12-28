import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/booking_module/screens/bookings_screen.dart';
import 'package:qris_health/modules/health_module/screens/men_health_screen.dart';
import 'package:qris_health/modules/health_module/screens/women_health_screen.dart';
import 'package:qris_health/modules/health_score_module/screens/health_score_intro_screen.dart';
import 'package:qris_health/modules/home_module/enum/test_category.dart';
import 'package:qris_health/modules/home_module/screens/popular_package_screen.dart';
import 'package:qris_health/modules/screens/mental_wellness_screen.dart';
import 'package:qris_health/styles/app_colors.dart';
import 'package:qris_health/styles/app_styles.dart';

class CategoryContainer extends StatelessWidget {
  final TestCategory testCategory;
  const CategoryContainer({super.key, required this.testCategory});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(CupertinoPageRoute(builder: (context) => _getScreen()));
      },
      child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: testCategory.backgroundColor,
                    borderRadius: BorderRadius.circular(12)),
                child:
                    Image.asset(testCategory.svgPath, height: 30, width: 30)),
            Positioned(
                top: 62,
                child: Container(
                    width: 75,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                    decoration: BoxDecoration(
                        boxShadow: AppStyles.cardShadow,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24)),
                    child: Text(testCategory.formattedName,
                        textAlign: TextAlign.center,
                        style: Get.textTheme.labelSmall!.copyWith(
                            fontSize: 10,
                            fontFamily: AppConstants.latoFontFamily,
                            fontWeight: FontWeight.w500,
                            color: AppColors.lightText))))
          ]),
    );
  }

  Widget _getScreen() {
    switch (testCategory) {
      case TestCategory.bloodTest:
        return PopularPackageScreen();
      case TestCategory.mri:
        return Container();
      case TestCategory.healthScore:
        return HealthScoreIntroScreen();
      case TestCategory.doctorConsultation:
        return Container();
      case TestCategory.mentalWellness:
        return MentalWellnessScreen();
      case TestCategory.menHealth:
        return MenHealthScreen();
      case TestCategory.womenHealth:
        return WomenHealthScreen();
      case TestCategory.viewReports:
        return BookingsScreen();
    }
  }
}
