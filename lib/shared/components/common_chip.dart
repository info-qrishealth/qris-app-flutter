import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/styles/app_colors.dart';

class CommonChip extends StatelessWidget {
  const CommonChip({super.key, required this.isSelected, required this.title});

  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryBlue),
            color: isSelected ? AppColors.primaryBlue : Colors.white,
            borderRadius: BorderRadius.circular(16)),
        child: Text(title,
            style: Get.textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : AppColors.primaryBlue)));
  }
}
