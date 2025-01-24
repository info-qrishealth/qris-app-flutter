import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qris_health/constants/api_params.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/patients_module/services/patient_service.dart';
import 'package:qris_health/modules/users_module/cubits/user_cubit.dart';
import 'package:qris_health/shared/components/common_action_app_bar_button.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/common_listview_shimmer.dart';

import '../components/add_patient_bottom_sheet.dart';
import '../components/patient_list_tile.dart';
import '../models/patient/patient.dart';

class PatientsScreen extends StatefulWidget {
  const PatientsScreen({super.key});

  @override
  State<PatientsScreen> createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  late Future<List<Patient>> _patientsFuture;
  List<Patient>? _patients;

  @override
  void initState() {
    super.initState();
    _patientsFuture = PatientService.getPatientsOfUser(
        userId: ApiParams.getInstance()!.userId!.toString());
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
                        _patients = [..._patients ?? [], patient];
                        setState(() {});
                      }, getUpdatedPatient: (patient) {
                        final index = _patients
                            ?.indexWhere((element) => patient.id == element.id);
                        if (index != -1 && index != null) {
                          _patients![index] = patient;
                          setState(() {});
                        }
                      });
                    });
              })
        ]),
        body: SafeArea(
            child: FutureBuilder<List<Patient>>(
                future: _patientsFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    _patients ??= snapshot.data!
                        .where((element) => element.status == '1')
                        .toList();

                    return ListView.separated(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                            horizontal: AppConstants.scaffoldPadding,
                            vertical: 24),
                        itemBuilder: (context, index) {
                          return PatientListTile(
                              index: index, patient: _patients![index]);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 18);
                        },
                        itemCount: _patients!.length);
                  }

                  return CommonListviewShimmer();
                })));
  }
}
