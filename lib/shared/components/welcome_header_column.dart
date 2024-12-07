import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../styles/app_colors.dart';

class WelcomeHeaderColumn extends StatelessWidget {
  const WelcomeHeaderColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text('Hello!',
          style: textTheme.headlineLarge!.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.w400,
              color: Color(0xFF707B81))),
      SizedBox(height: 4),
      Text('Welcome to Qris Health',
          style: textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w400, color: AppColors.lightSubTextColor)),
    ]);
  }
}
