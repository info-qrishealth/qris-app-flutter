import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/modules/health_score_module/components/select_patient_view.dart';
import 'package:qris_health/modules/home_module/components/package_list_tile.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../../../shared/components/heading_text.dart';

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
        SelectPatientView(getSelectedPatient: (patient) {}),
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
