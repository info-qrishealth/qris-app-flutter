import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../styles/app_colors.dart';

class OfferedPriceContainer extends StatelessWidget {
  final EdgeInsets? padding;
  final Widget? suffix;
  const OfferedPriceContainer({super.key, this.padding, this.suffix});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Container(
        decoration:
            BoxDecoration(color: AppColors.primaryPink.withOpacity(0.06)),
        child: Padding(
            padding: padding ??
                const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
            child: Row(children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: '₹ 1999',
                    style: textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.lineThrough,
                        fontSize: 9,
                        color: AppColors.primaryPink)),
                WidgetSpan(child: SizedBox(width: 7)),
                TextSpan(
                    text: '₹1099',
                    style: textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryBlue)),
              ])),
              Spacer(),
              if (suffix != null) suffix!
            ])));
  }
}
