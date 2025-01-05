import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/styles/app_colors.dart';

class BulletPoint extends StatelessWidget {
  final String text;
  const BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Container(
              height: 4,
              width: 4,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.black))),
      SizedBox(width: 8),
      Expanded(
          child: Text(text,
              style: textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w400, color: AppColors.lightText)))
    ]);
  }
}
