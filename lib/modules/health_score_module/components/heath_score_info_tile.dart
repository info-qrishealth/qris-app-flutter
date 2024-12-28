import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/styles/app_colors.dart';

class HealthScoreInfoTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  const HealthScoreInfoTile(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Row(children: [
      Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.borderColor)),
          child: Image.asset(imagePath, height: 24)),
      SizedBox(width: 10),
      Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(title,
            style: textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w500, color: AppColors.primaryPink)),
        SizedBox(height: 2),
        Text(description,
            style: textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.lightSubTextColor)),
      ]))
    ]);
  }
}
