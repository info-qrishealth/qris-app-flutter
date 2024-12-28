import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/shared/components/underline_text.dart';
import 'package:qris_health/styles/app_colors.dart';

class HealthProblemListTile extends StatelessWidget {
  final String title;
  final String imagePath;
  final Function() onTap;
  final LinearGradient gradient;
  const HealthProblemListTile(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.onTap,
      required this.gradient});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            gradient: gradient, borderRadius: BorderRadius.circular(9)),
        child: Row(children: [
          Image.asset(imagePath, height: 40),
          SizedBox(width: 16),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(title,
                    style: textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontFamily: AppConstants.ubuntuFontFamily)),
                SizedBox(height: 6),
                Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  UnderlineText(
                      text: 'View Package',
                      style: textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryPink)),
                  SizedBox(width: 2),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 1),
                      child: Icon(Icons.arrow_forward_ios,
                          color: AppColors.primaryPink, size: 10))
                ])
              ])),
        ]));
  }
}
