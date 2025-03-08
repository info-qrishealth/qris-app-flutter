import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/generated/assets.dart';
import 'package:qris_health/styles/app_colors.dart';

class NoItemFoundContainer extends StatelessWidget {
  final String title;
  final double? imageSize;
  const NoItemFoundContainer({super.key, required this.title, this.imageSize});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Assets.illustrationsNoItemFoundIllustration,
              height: imageSize ?? 160),
          SizedBox(height: 32),
          Text(title,
              style: Get.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w400, color: AppColors.lightText)),
          SizedBox(height: 16),
        ]);
  }
}
