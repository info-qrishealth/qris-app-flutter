import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/styles/app_colors.dart';

class HealthScoreInfoTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String? description;
  final TextStyle? titleStyle;
  final Color? titleColor;
  final double? imagePadding;
  final double? imageSize;
  const HealthScoreInfoTile(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.description,
      this.titleStyle,
      this.titleColor,
      this.imagePadding,
      this.imageSize});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Row(children: [
      Container(
          padding: EdgeInsets.all(imagePadding ?? 10),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.borderColor)),
          child: Image.asset(imagePath, height: imageSize ?? 24)),
      SizedBox(width: 10),
      Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(title,
            style: titleStyle ??
                textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: titleColor ?? AppColors.primaryPink)),
        if (description != null) SizedBox(height: 2),
        if (description != null)
          Text(description!,
              style: textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightSubTextColor)),
      ]))
    ]);
  }
}
