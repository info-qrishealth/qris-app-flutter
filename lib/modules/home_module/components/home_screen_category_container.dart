import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/all_scans_module/screens/all_scans_screen.dart';
import 'package:qris_health/modules/booking_module/screens/bookings_screen.dart';
import 'package:qris_health/modules/health_module/screens/men_health_screen.dart';
import 'package:qris_health/modules/health_module/screens/women_health_screen.dart';
import 'package:qris_health/modules/health_score_module/screens/health_score_intro_screen.dart';
import 'package:qris_health/modules/home_module/enum/test_category.dart';
import 'package:qris_health/modules/home_module/screens/popular_package_screen.dart';
import 'package:qris_health/modules/health_module/screens/mental_wellness_screen.dart';
import 'package:qris_health/modules/doctor_consultation_module/screens/doctor_consultation_screen.dart';
import 'package:qris_health/shared/components/common_category_container.dart';
import 'package:qris_health/styles/app_colors.dart';
import 'package:qris_health/styles/app_styles.dart';

class HomeScreenCategoryContainer extends StatelessWidget {
  final TestCategory testCategory;
  const HomeScreenCategoryContainer({super.key, required this.testCategory});

  @override
  Widget build(BuildContext context) {
    return CommonCategoryContainer(
        onTap: () {
          Navigator.of(context)
              .push(CupertinoPageRoute(builder: (context) => _getScreen()));
        },
        backgroundColor: testCategory.backgroundColor,
        imagePath: testCategory.svgPath,
        title: testCategory.formattedName);
  }

  Widget _getScreen() {
    switch (testCategory) {
      case TestCategory.bloodTest:
        return PopularPackageScreen();
      case TestCategory.mri:
        return AllScansScreen();
      case TestCategory.healthScore:
        return HealthScoreIntroScreen();
      case TestCategory.doctorConsultation:
        return DoctorConsultationScreen();
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
