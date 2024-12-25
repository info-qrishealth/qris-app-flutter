import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../styles/app_colors.dart';

class PatientTileLayout extends StatelessWidget {
  final List<Widget>? actions;
  const PatientTileLayout({super.key, this.actions});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return IntrinsicHeight(
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Image.asset('assets/images/placeholders/male_placeholder.png',
          height: 24),
      SizedBox(width: 12),
      Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text('Puneet Bajaj',
            style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600)),
        SizedBox(height: 4),
        Row(children: [
          Text('Male',
              style: textTheme.labelSmall!.copyWith(
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
              style: textTheme.labelSmall!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightSubTextColor)),
        ]),
      ])),
      if (actions != null) Row(children: actions!)
    ]));
  }
}
