import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qris_health/modules/all_scans_module/models/test_package_model/test_package_model.dart';
import 'package:qris_health/modules/health_score_module/components/select_patient_view.dart';
import 'package:qris_health/modules/home_module/components/package_list_tile.dart';
import 'package:qris_health/modules/patients_module/models/patient/patient.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../../../constants/app_constants.dart';
import '../../../../constants/enums/snackbar_type.dart';
import '../../../../shared/components/heading_text.dart';
import '../../../orders_modele/cart_cubit/cart_cubit.dart';
import '../../../patients_module/cubits/patients_cubit/patients_cubit.dart';

class SelectPatientTab extends StatefulWidget {
  final Future<void> Function(Patient) onContinue;
  final TestPackageModel? testPackageModel;
  const SelectPatientTab(
      {super.key, required this.onContinue, this.testPackageModel});

  @override
  State<SelectPatientTab> createState() => _SelectPatientTabState();
}

class _SelectPatientTabState extends State<SelectPatientTab> {
  Patient? _selectedPatient;

  @override
  void initState() {
    super.initState();
    final patientCubit = BlocProvider.of<PatientsCubit>(context);
    if (patientCubit.state is! PatientsLoaded) {
      patientCubit.getAllPatientsForUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Expanded(
          child: ListView(physics: BouncingScrollPhysics(), children: [
        HeadingText(text: 'Package Details'),
        SizedBox(height: 18),
        PackageListTile(
            customDescription: Container(),
            testPackage: widget.testPackageModel,
            onSeeDetailsTap: null,
            onBookNowTap: null),
        SizedBox(height: 32),
        SelectPatientView(
            getSelectedPatient: (patient) {
              if (BlocProvider.of<CartCubit>(context)
                  .isPatientAlreadyAddedToThisTest(
                      testId: widget.testPackageModel!.id,
                      patientId: patient.id!)) {
                AppConstants.showSnackbar(
                    text: '${patient.name} is already added in the same test',
                    type: SnackbarType.error);
                return;
              }

              setState(() {
                _selectedPatient = patient;
              });
            },
            selectedPatient: _selectedPatient),
      ])),
      Padding(
          padding: const EdgeInsets.only(top: 16),
          child: ElevatedButton(
              onPressed: _selectedPatient == null
                  ? null
                  : () async => widget.onContinue(_selectedPatient!),
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue),
              child: Text('Continue'))),
      SizedBox(height: 16)
    ]);
  }
}
