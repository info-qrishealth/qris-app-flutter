import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../styles/app_colors.dart';

class InfoRow extends StatelessWidget {
  const InfoRow(
      {super.key,
      required this.svgPath,
      required this.title,
      required this.description,
      this.mainAxisAlignment});

  final String svgPath;
  final String title;
  final String description;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        children: [
          SvgPicture.asset(svgPath, height: 16),
          SizedBox(width: 4),
          Flexible(
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: title,
                  style: Get.textTheme.bodySmall!.copyWith(
                      color: AppColors.primaryPink,
                      fontWeight: FontWeight.w400)),
              TextSpan(
                  text: description,
                  style: TextStyle(
                      color: AppColors.primaryPink,
                      fontWeight: FontWeight.w700)),
            ])),
          ),
        ]);
  }
}
