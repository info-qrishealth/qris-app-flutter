import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qris_health/modules/patients_module/extensions/patient_extension.dart';
import 'package:qris_health/modules/patients_module/models/patient/patient.dart';
import 'package:qris_health/shared/extensions/date_time_extension.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';

import '../../../constants/enums/gender.dart';
import '../../../styles/app_colors.dart';
import '../../patients_module/cubits/patients_cubit/patients_cubit.dart';

class PatientTileLayout extends StatelessWidget {
  final Patient? patient;
  final List<Widget>? actions;
  const PatientTileLayout({super.key, this.actions, this.patient});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;
    final gender = patient.genderEnum;

    return IntrinsicHeight(
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Image.asset(
          gender == Gender.MALE
              ? 'assets/images/placeholders/male_placeholder.png'
              : 'assets/images/placeholders/female_placeholder.png',
          height: 24),
      SizedBox(width: 12),
      Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text('${patient?.name}',
            style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600)),
        SizedBox(height: 4),
        Row(children: [
          Text('${gender?.name.formattedEnumName}',
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
          Text(patient?.dob?.toDateTime.formattedAge ?? 'N/A',
              style: textTheme.labelSmall!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightSubTextColor)),
        ]),
      ])),
      if (actions != null) Row(children: actions!)
    ]));
  }
}
