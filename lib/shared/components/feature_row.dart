import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../styles/app_colors.dart';

class FeatureRow extends StatelessWidget {
  final String imagePath;
  final String title;
  const FeatureRow({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Row(children: [
      Image.asset(imagePath, height: 10, color: AppColors.primaryBlue),
      SizedBox(width: 4),
      Text(title,
          style: textTheme.labelSmall!.copyWith(
              fontWeight: FontWeight.w400, color: AppColors.primaryPink))
    ]);
  }
}
