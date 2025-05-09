import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../styles/app_colors.dart';

class FeatureRow extends StatelessWidget {
  final String? svgPath;
  final String? imagePath;
  final String title;
  final Color? fontColor;
  final Color? imageColor;
  final bool applyImageColor;
  final double? fontSize;
  final double? iconSize;

  const FeatureRow(
      {super.key,
      this.imagePath,
      required this.title,
      this.svgPath,
      this.fontColor,
      this.imageColor,
      this.applyImageColor = true,
      this.fontSize,
      this.iconSize});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(top: 1.5),
          child: imagePath != null
              ? Image.asset(imagePath!,
                  height: iconSize ?? 12,
                  color: !applyImageColor
                      ? null
                      : imageColor ?? AppColors.primaryBlue)
              : SvgPicture.asset(svgPath!,
                  height: iconSize ?? 12,
                  color: !applyImageColor
                      ? null
                      : imageColor ?? AppColors.primaryBlue)),
      SizedBox(width: 4),
      Flexible(
          child: Text(title,
              style: textTheme.labelSmall!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: fontSize ?? 11,
                  color: fontColor ?? AppColors.primaryPink)))
    ]);
  }
}
