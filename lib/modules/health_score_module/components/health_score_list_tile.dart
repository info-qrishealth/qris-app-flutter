import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/styles/app_colors.dart';

class HealthScoreListTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final double? imageSize;
  final TextStyle? style;
  const HealthScoreListTile(
      {super.key,
      required this.imagePath,
      required this.title,
      this.imageSize,
      this.style});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Row(children: [
      Image.asset(imagePath, height: imageSize ?? 40),
      SizedBox(width: 10),
      Text(title,
          style: style ??
              textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w400, color: AppColors.primaryPink)),
    ]);
  }
}
