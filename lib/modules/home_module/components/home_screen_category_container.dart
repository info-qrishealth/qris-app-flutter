import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qris_health/modules/all_scans_module/screens/all_scans_screen.dart';
import 'package:qris_health/modules/home_module/enum/test_category.dart';
import 'package:qris_health/modules/home_module/screens/icu_care_screen.dart';
import 'package:qris_health/modules/home_module/screens/upload_prescription_screen.dart';
import 'package:qris_health/modules/home_module/screens/popular_package_screen.dart';
import 'package:qris_health/modules/health_module/screens/mental_wellness_screen.dart';
import 'package:qris_health/modules/doctor_consultation_module/screens/doctor_consultation_screen.dart';
import 'package:qris_health/shared/components/common_category_container.dart';

class HomeScreenCategoryContainer extends StatelessWidget {
  final TestCategory testCategory;
  const HomeScreenCategoryContainer({super.key, required this.testCategory});

  @override
  Widget build(BuildContext context) {
    return CommonCategoryContainer(
        imageSize: 35,
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        onTap: () {
          Navigator.of(context)
              .push(CupertinoPageRoute(builder: (context) => _getScreen()));
        },
        backgroundColor: testCategory.backgroundColor,
        assetImagePath: testCategory.svgPath,
        title: testCategory.formattedName);
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
        return UploadPrescriptionScreen();
      case TestCategory.icuCare:
        return IcuCareScreen();
    }
  }
}
