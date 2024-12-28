import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/styles/app_colors.dart';

class StepCircle extends StatelessWidget {
  final int selectedStep;
  final int step;
  final String title;
  const StepCircle(
      {super.key,
      required this.step,
      required this.selectedStep,
      required this.title});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;
    final isSelected = selectedStep >= step;

    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
              height: 34,
              width: 34,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryBlue : Color(0x0C411E75),
                  shape: BoxShape.circle),
              child: selectedStep > step
                  ? Icon(Icons.done, color: Colors.white)
                  : Text('${step + 1}',
                      style: textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isSelected
                              ? Colors.white
                              : AppColors.primaryBlue))),
          Positioned(
              top: 45,
              child: Text(title,
                  style: Get.textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryBlue)))
        ]);
  }
}
