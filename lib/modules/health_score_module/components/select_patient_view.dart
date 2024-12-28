import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_constants.dart';
import '../../../shared/components/heading_text.dart';
import '../../../shared/components/underline_text.dart';
import '../../../styles/app_colors.dart';
import '../../cart_module/components/patient_list_tile.dart';
import '../../family_members_module/components/add_family_member_bottom_sheet.dart';

class SelectPatientView extends StatelessWidget {
  const SelectPatientView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
                style: Get.textTheme.bodySmall!
                    .copyWith(color: AppColors.primaryPink),
                underlineColor: AppColors.primaryPink)),
      ]),
      SizedBox(height: 18),
      ...List.generate(2, (index) {
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: PatientListTile(isSelected: index % 2 == 0));
      }),
    ]);
  }
}
