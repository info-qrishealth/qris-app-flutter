import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../styles/app_colors.dart';

class DoubleTickRow extends StatelessWidget {
  final String text;
  const DoubleTickRow({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.asset('assets/images/icons/double_tick_icon.png', height: 24),
      SizedBox(width: 10),
      Text(text,
          style: Get.textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w500, color: AppColors.primaryPink)),
    ]);
  }
}
