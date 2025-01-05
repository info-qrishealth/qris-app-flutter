import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../styles/app_colors.dart';

class CommonOutlinedChip extends StatelessWidget {
  final bool isSelected;
  final String title;
  const CommonOutlinedChip(
      {super.key, required this.isSelected, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
            border: Border.all(
                color: isSelected
                    ? AppColors.primaryPink
                    : Colors.black.withOpacity(0.09)),
            color: isSelected
                ? AppColors.primaryPink.withOpacity(0.06)
                : Colors.black.withOpacity(0.04),
            borderRadius: BorderRadius.circular(16)),
        child: Text(title,
            style: Get.textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w500,
                color: isSelected
                    ? AppColors.primaryPink
                    : AppColors.lightSubTextColor)));
  }
}
