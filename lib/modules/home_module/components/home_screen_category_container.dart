import 'dart:io';

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
        Navigator.of(context).push(
          CupertinoPageRoute(builder: (context) => _getScreen()),
        );
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Height of the image box (taller, like screenshot)
          final double boxHeight = constraints.maxWidth;

          // Icon size and padding
          final double iconSize = 38;
          final double padding = 12;

          // Text chip
          final double textFontSize = Platform.isAndroid ? 9 : 11;
          final double chipVerticalPadding = 6;
          final double chipHeight =
              textFontSize * 1.2 + (chipVerticalPadding * 2);

          // Overlap half
          final double overlap = chipHeight / 2;

          return SizedBox(
            height: boxHeight + overlap,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                // ================= IMAGE CARD =================
                Container(
                  height: boxHeight,
                  width: constraints.maxWidth,
                  decoration: BoxDecoration(
                    color: testCategory.backgroundColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.all(padding),
                  child: Center(
                    child: Image.asset(
                      testCategory.pngPath,
                      width: iconSize,
                      height: iconSize,
                    ),
                  ),
                ),

                // ================= TEXT CHIP =================
                Positioned(
                  top: boxHeight - overlap,
                  child: Container(
                    width: constraints.maxWidth,   // 100% width of container
                    padding: EdgeInsets.symmetric(
                      vertical: chipVerticalPadding,
                      horizontal: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: AppStyles.cardShadow,
                    ),
                    child: Text(
                      testCategory.formattedName,
                      textAlign: TextAlign.center,
                      style: Get.textTheme.labelSmall!.copyWith(
                        fontSize: textFontSize,
                        fontWeight: FontWeight.w700,
                        color: AppColors.lightText,
                      ),
                      softWrap: true,
                      maxLines: 2,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
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


