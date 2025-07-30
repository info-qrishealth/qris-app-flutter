import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';
import '../../styles/app_colors.dart';

class VerifiedTickRow extends StatelessWidget {
  final String title;
  const VerifiedTickRow({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SvgPicture.asset(Assets.testBenefitIconsVerifiedBenefitIcon,
          color: AppColors.primaryBlue,
          fit: BoxFit.fill,
          height: 24,
          width: 24),
      SizedBox(width: 4),
      Expanded(
          child: Text(title,
              style: Get.textTheme.bodySmall!.copyWith(
                  color: AppColors.primaryPink, fontWeight: FontWeight.w400)))
    ]);
  }
}
