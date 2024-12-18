import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_constants.dart';

class CommonActionAppBarButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  const CommonActionAppBarButton(
      {super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
        child: SizedBox(
            height: 36,
            child: ElevatedButton(
                onPressed: onTap,
                child: Text(title,
                    style: Get.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontFamily: AppConstants.ubuntuFontFamily,
                        color: Colors.white)))));
  }
}
