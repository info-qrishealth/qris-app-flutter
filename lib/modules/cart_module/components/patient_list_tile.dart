import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../styles/app_colors.dart';

class PatientListTile extends StatelessWidget {
  final bool isSelected;
  const PatientListTile({super.key, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Container(
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isSelected
                ? AppColors.primaryBlue.withOpacity(0.05)
                : Colors.white,
            border: Border.all(
                width: 0.6,
                color: isSelected
                    ? AppColors.primaryBlue
                    : Colors.black.withOpacity(0.09))),
        child: IntrinsicHeight(
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Image.asset('assets/images/placeholders/male_placeholder.png',
              height: 35),
          SizedBox(width: 12),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                Text('Puneet Bajaj',
                    style: textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.w600)),
                SizedBox(height: 4),
                Row(children: [
                  Text('Male',
                      style: textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightSubTextColor)),
                  SizedBox(width: 8),
                  Container(
                      margin: EdgeInsets.only(top: 2),
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                          color: AppColors.black, shape: BoxShape.circle)),
                  SizedBox(width: 8),
                  Text('37Y 5M 10D',
                      style: textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightSubTextColor)),
                ]),
              ])),
        ])));
  }
}
