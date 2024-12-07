import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/home_module/enum/test_category.dart';
import 'package:qris_health/styles/app_colors.dart';
import 'package:qris_health/styles/app_styles.dart';

class CategoryContainer extends StatelessWidget {
  final TestCategory testCategory;
  const CategoryContainer({super.key, required this.testCategory});

  @override
  Widget build(BuildContext context) {
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: testCategory.backgroundColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Image.asset(testCategory.svgPath, height: 30, width: 30)),
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
        ]);
  }
}
