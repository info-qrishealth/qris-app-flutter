import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/shared/components/outlined_icon_button.dart';
import 'package:qris_health/styles/app_colors.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  const CommonAppBar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Padding(
        padding: EdgeInsets.only(
            left: AppConstants.scaffoldPadding,
            right: AppConstants.scaffoldPadding,
            top: 8),
        child: AppBar(
            actions: actions,
            centerTitle: false,
            leadingWidth: 44,
            leading: OutlinedIconButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios_new,
                    color: AppColors.lightText, size: 18)),
            title: Text(title,
                style: textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryBlue))));
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
