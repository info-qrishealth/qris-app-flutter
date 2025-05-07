import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/shared/components/common_network_image.dart';

import '../../constants/app_constants.dart';
import '../../styles/app_colors.dart';
import '../../styles/app_styles.dart';

class CommonCategoryContainer extends StatelessWidget {
  final Function() onTap;
  final Color backgroundColor;
  final String? assetImagePath;
  final String? networkImagePath;
  final String title;
  const CommonCategoryContainer(
      {super.key,
      required this.onTap,
      required this.backgroundColor,
      this.assetImagePath,
      required this.title,
      this.networkImagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: assetImagePath != null
                      ? Image.asset(assetImagePath!, height: 30, width: 30)
                      : CommonNetworkImage(
                          name: '$networkImagePath', height: 30, width: 30)),
              Positioned(
                  top: 62,
                  child: Container(
                      width: 75,
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                      decoration: BoxDecoration(
                          boxShadow: AppStyles.cardShadow,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24)),
                      child: Text(title,
                          textAlign: TextAlign.center,
                          style: Get.textTheme.labelSmall!.copyWith(
                              fontSize: 10,
                              fontFamily: AppConstants.latoFontFamily,
                              fontWeight: FontWeight.w500,
                              color: AppColors.lightText))))
            ]));
  }
}
