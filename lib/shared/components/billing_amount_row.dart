import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../styles/app_colors.dart';

class SummaryInfoRow extends StatelessWidget {
  const SummaryInfoRow(
      {super.key, required this.title, required this.value, this.color});

  final String title;
  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: Text(title,
              style: Get.textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: color ?? AppColors.textColor))),
      Text(value,
          style: Get.textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w700,
              color: color ?? AppColors.lightSubTextColor))
    ]);
  }
}
