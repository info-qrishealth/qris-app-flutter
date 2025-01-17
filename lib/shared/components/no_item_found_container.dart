import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/styles/app_colors.dart';

class NoItemFoundContainer extends StatelessWidget {
  final String title;
  const NoItemFoundContainer({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
              'assets/images/illustrations/no_item_found_illustration.png',
              height: 160),
          SizedBox(height: 32),
          Text(title,
              style: Get.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w400, color: AppColors.lightText)),
          SizedBox(height: 16),
        ]);
  }
}
