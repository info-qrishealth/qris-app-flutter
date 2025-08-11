import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/enums/prescription_type.dart';
import 'package:qris_health/modules/all_scans_module/screens/all_scans_screen.dart';
import 'package:qris_health/modules/home_module/enum/test_category.dart';
import 'package:qris_health/modules/home_module/screens/icu_care_screen.dart';
import 'package:qris_health/modules/home_module/screens/upload_prescription_screen.dart';
import 'package:qris_health/modules/home_module/screens/popular_package_screen.dart';
import 'package:qris_health/modules/health_module/screens/mental_wellness_screen.dart';
import 'package:qris_health/modules/doctor_consultation_module/screens/doctor_consultation_screen.dart';

import '../../../styles/app_colors.dart';
import '../../../styles/app_styles.dart';

class HomeScreenCategoryContainer extends StatelessWidget {
  final TestCategory testCategory;
  const HomeScreenCategoryContainer({super.key, required this.testCategory});

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
            fit: StackFit.expand,
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: testCategory.backgroundColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: UnconstrainedBox(
                      child: Image.asset(testCategory.pngPath,
                          height: 38, width: 38))),
              Positioned(
                  top: 92,
                  child: Container(
                      width: 100,
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                      decoration: BoxDecoration(
                          boxShadow: AppStyles.cardShadow,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24)),
                      child: Text(testCategory.formattedName,
                          textAlign: TextAlign.center,
                          style: Get.textTheme.labelSmall!.copyWith(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w700,
                              color: AppColors.lightText))))
            ]));
  }

  Widget _getScreen() {
    switch (testCategory) {
      case TestCategory.bloodTest:
        return PopularPackageScreen();
      case TestCategory.mri:
        return AllScansScreen();
      case TestCategory.doctorConsultation:
        return DoctorConsultationScreen();
      case TestCategory.mentalWellness:
        return MentalWellnessScreen();
      case TestCategory.pharmacy:
        return UploadPrescriptionScreen(type: PrescriptionType.pharmacy);
      case TestCategory.icuCare:
        return IcuCareScreen();
    }
  }
}
