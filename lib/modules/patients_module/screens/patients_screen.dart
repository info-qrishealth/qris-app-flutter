import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/patients_module/cubits/patients_cubit/patients_cubit.dart';
import 'package:qris_health/shared/components/common_action_app_bar_button.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/common_listview_shimmer.dart';

import '../components/add_patient_bottom_sheet.dart';
import '../components/patient_list_tile.dart';

class PatientsScreen extends StatefulWidget {
  const PatientsScreen({super.key});

  @override
  State<PatientsScreen> createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  @override
  void initState() {
    super.initState();
    final patientsCubit = BlocProvider.of<PatientsCubit>(context);

    if (patientsCubit.state is! PatientsLoaded) {
      patientsCubit.getAllPatientsForUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Patients', actions: [
          CommonActionAppBarButton(
              title: '+ Add New Member',
              onTap: () async {
                await showModalBottomSheet(
                    isScrollControlled: true,
                    constraints: AppConstants.bottomSheetConstraints,
                    context: context,
                    builder: (context) {
                      return AddPatientBottomSheet(getAddedPatient: (patient) {
                        BlocProvider.of<PatientsCubit>(context)
                            .addNewPatient(patient);
                      }, getUpdatedPatient: (patient) {
                        BlocProvider.of<PatientsCubit>(context)
                            .updatePatient(patient);
                      });
                    });
              })
        ]),
        body: SafeArea(child: BlocBuilder<PatientsCubit, PatientsState>(
            builder: (context, state) {
          if (state is PatientsLoaded) {
            final patients =
                BlocProvider.of<PatientsCubit>(context).validPatients;

            return ListView.separated(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.scaffoldPadding, vertical: 24),
                itemBuilder: (context, index) {
                  return PatientListTile(
                      index: index, patient: patients[index]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 18);
                },
                itemCount: patients.length);
          }

          return CommonListviewShimmer();
        })));
  }
}
