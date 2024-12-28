import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/shared/models/blood_test_info_model.dart';

import '../../styles/app_colors.dart';

class WhatItIncludesContainer extends StatelessWidget {
  final List<BloodTestInfoModel> testInfos;
  const WhatItIncludesContainer({super.key, required this.testInfos});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryBlue, width: 0.7),
            color: AppColors.primaryBlue.withOpacity(0.02),
            borderRadius: BorderRadius.circular(10)),
        child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final info = testInfos[index];

              return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: '${info.title}\n',
                          style: textTheme.bodySmall!.copyWith(
                              color: AppColors.primaryBlue,
                              fontWeight: FontWeight.w400)),
                      TextSpan(text: '\n', style: TextStyle(fontSize: 2)),
                      TextSpan(
                          text: info.description,
                          style: textTheme.bodySmall!.copyWith(
                              color: AppColors.primaryBlue,
                              fontWeight: FontWeight.w600)),
                    ]))),
                  ]);
            },
            separatorBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: DottedLine(lineThickness: 0.8));
            },
            itemCount: testInfos.length));
  }
}
