import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/family_members_module/components/add_family_member_bottom_sheet.dart';
import 'package:qris_health/modules/home_module/components/package_list_tile.dart';
import 'package:qris_health/shared/components/underline_text.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../../../shared/components/heading_text.dart';
import '../../components/patient_list_tile.dart';

class SelectPatientTab extends StatefulWidget {
  final Function() onContinue;
  const SelectPatientTab({super.key, required this.onContinue});

  @override
  State<SelectPatientTab> createState() => _SelectPatientTabState();
}

class _SelectPatientTabState extends State<SelectPatientTab> {
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Expanded(
          child: ListView(children: [
        HeadingText(text: 'Package Details'),
        SizedBox(height: 18),
        PackageListTile(
            onSeeDetailsTap: null,
            onBookNowTap: null,
            description:
                'Included : Liver Test, Kidney Test, Blood glucose fasting, Lipid profile, Thyroid Profile, HBA1C, Urine Test....'),
        SizedBox(height: 32),
        Row(children: [
          Expanded(child: HeadingText(text: 'Select Patient')),
          GestureDetector(
              onTap: () async {
                await showModalBottomSheet(
                    constraints: AppConstants.bottomSheetConstraints,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => AddFamilyMemberBottomSheet());
              },
              child: UnderlineText(
                  text: '+ Add New Patient',
                  style: _textTheme.bodySmall!
                      .copyWith(color: AppColors.primaryPink),
                  underlineColor: AppColors.primaryPink)),
        ]),
        SizedBox(height: 18),
        ...List.generate(2, (index) {
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: PatientListTile(isSelected: index % 2 == 0));
        }),
      ])),
      ElevatedButton(
          onPressed: widget.onContinue,
          style:
              ElevatedButton.styleFrom(backgroundColor: AppColors.primaryBlue),
          child: Text('Continue')),
      SizedBox(height: 16)
    ]);
  }
}
