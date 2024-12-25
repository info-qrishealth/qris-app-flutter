import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../styles/app_colors.dart';

class UnderlineText extends StatelessWidget {
  final Color? underlineColor;
  final String text;
  final TextStyle? style;
  final Function()? onTap;
  const UnderlineText(
      {super.key,
      required this.text,
      this.style,
      this.underlineColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 0.5),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: underlineColor ?? AppColors.textColor, width: 0.5))),
        child: Text(text,
            textAlign: TextAlign.center,
            style: style ??
                Get.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w400, color: AppColors.textColor)));
  }
}
