import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qris_health/modules/patients_module/cubits/patients_cubit/patients_cubit.dart';
import 'package:qris_health/modules/patients_module/extensions/patient_extension.dart';
import 'package:qris_health/modules/patients_module/models/patient/patient.dart';
import 'package:qris_health/shared/components/common_listview_shimmer.dart';

import '../../../constants/app_constants.dart';
import '../../../shared/components/heading_text.dart';
import '../../../shared/components/underline_text.dart';
import '../../../styles/app_colors.dart';
import '../../cart_module/components/patient_list_tile.dart';
import '../../patients_module/components/add_patient_bottom_sheet.dart';

class SelectPatientView extends StatefulWidget {
  final Function(Patient) getSelectedPatient;
  final Patient? selectedPatient;
  final bool onlyAdults;
  final bool expanded;
  const SelectPatientView(
      {super.key,
      required this.getSelectedPatient,
      this.selectedPatient,
      this.onlyAdults = false,
      this.expanded = false});

  @override
  State<SelectPatientView> createState() => _SelectPatientViewState();
}

class _SelectPatientViewState extends State<SelectPatientView> {
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
                  builder: (context) =>
                      AddPatientBottomSheet(getAddedPatient: (addedPatient) {
                        BlocProvider.of<PatientsCubit>(context)
                            .addNewPatient(addedPatient);
                      }, getUpdatedPatient: (updatedPatient) {
                        BlocProvider.of<PatientsCubit>(context)
                            .updatePatient(updatedPatient);
                      }));
            },
            child: UnderlineText(
                text: '+ Add New Patient',
                style: Get.textTheme.bodySmall!
                    .copyWith(color: AppColors.primaryPink),
                underlineColor: AppColors.primaryPink)),
      ]),
      SizedBox(height: 18),
      if (widget.expanded)
        Expanded(child: _buildListView())
      else
        _buildListView(),
    ]);
  }

  Widget _buildListView() {
    return BlocBuilder<PatientsCubit, PatientsState>(builder: (context, state) {
      if (state is PatientsLoaded) {
        final patients = BlocProvider.of<PatientsCubit>(context)
            .validPatients
            .where((patient) => widget.onlyAdults ? !patient.isUnderAge : true)
            .toList();

        return ListView.separated(
            physics: widget.expanded
                ? BouncingScrollPhysics()
                : NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final patient = patients[index];

              return InkWell(
                  onTap: () => widget.getSelectedPatient(patient),
                  child: PatientListTile(
                      patient: patient,
                      isSelected: widget.selectedPatient?.id == patient.id));
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 10);
            },
            itemCount: patients.length);
      }

      return CommonListviewShimmer();
    });
  }
}
