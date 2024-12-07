import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../styles/app_colors.dart';

class CommonCrossIcon extends StatelessWidget {
  final Function()? onTap;
  final Widget? customIcon;
  const CommonCrossIcon({super.key, this.onTap, this.customIcon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap ?? Get.back,
        child: Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryBlue.withOpacity(0.04)),
            child: customIcon ??
                const Icon(Icons.close, color: Colors.black, size: 20)));
  }
}
