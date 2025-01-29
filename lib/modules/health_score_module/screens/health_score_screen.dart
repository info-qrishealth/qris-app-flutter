import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';
import 'package:qris_health/modules/health_score_module/components/health_score_stepper.dart';
import 'package:qris_health/modules/health_score_module/components/select_patient_view.dart';
import 'package:qris_health/modules/health_score_module/components/tabs/basic_diagnosis_tab.dart';
import 'package:qris_health/modules/health_score_module/components/tabs/lifestyle_habit_tab.dart';
import 'package:qris_health/modules/health_score_module/models/health_score_req_body/health_score_req_body.dart';
import 'package:qris_health/modules/health_score_module/screens/health_score_loading_screen.dart';
import 'package:qris_health/modules/patients_module/models/patient/patient.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../patients_module/cubits/patients_cubit/patients_cubit.dart';
import '../components/tabs/patient_info_tab.dart';

class HealthScoreScreen extends StatefulWidget {
  const HealthScoreScreen({super.key});

  @override
  State<HealthScoreScreen> createState() => _HealthScoreScreenState();
}

class _HealthScoreScreenState extends State<HealthScoreScreen> {
  final _pageController = PageController();

  Patient? _selectedPatient;
  int _selectedPage = 0;
  final _healthScoreReqModel = HealthScoreReqBody();

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
        appBar: CommonAppBar(title: 'Health Score'),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.scaffoldPadding),
                child: Column(children: [
                  SizedBox(height: 24),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child:
                          HealthScoreStepper(selectedStepIndex: _selectedPage)),
                  SizedBox(height: 60),
                  Expanded(
                      child: PageView(
                          controller: _pageController,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                        _buildSelectPatientView(),
                        if (_selectedPatient != null)
                          PatientInfoTab(
                              patient: _selectedPatient!,
                              onNext: (updatedPatient) {
                                setState(() {
                                  _selectedPatient = updatedPatient;
                                  _healthScoreReqModel.weight =
                                      updatedPatient.weight?.toString();
                                  _healthScoreReqModel.height =
                                      updatedPatient.height?.toString();
                                });

                                _animateToPage(pageIndex: 2);
                              }),
                        BasicDiagnosisTab(onNext: (bp, pulse, sleep) {
                          _healthScoreReqModel.bloodPressure =
                              bp.marks.toString();
                          _healthScoreReqModel.pulseRate =
                              pulse.marks.toString();
                          _healthScoreReqModel.sleepPattern =
                              sleep.marks.toString();

                          _animateToPage(pageIndex: 3);
                        }),
                        LifestyleHabitTab(onSubmit: (dietOption, waterOption,
                            alcholOption, ciggerateOption, exerciseOption) {
                          _healthScoreReqModel.diet =
                              dietOption.marks.toString();
                          _healthScoreReqModel.water =
                              waterOption.marks.toString();
                          _healthScoreReqModel.alcohol =
                              alcholOption.marks.toString();
                          _healthScoreReqModel.cigarettes =
                              ciggerateOption.marks.toString();
                          _healthScoreReqModel.physicalActivity =
                              exerciseOption.marks.toString();

                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => HealthScoreLoadingScreen(
                                  healthScoreReqBody: _healthScoreReqModel)));
                        })
                      ])),
                ]))));
  }

  void _animateToPage({required int pageIndex}) {
    _pageController.animateToPage(pageIndex,
        duration: Duration(milliseconds: 250), curve: Curves.easeIn);
    _selectedPage = pageIndex;
    setState(() {});
  }

  Widget _buildSelectPatientView() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Expanded(
          child: SelectPatientView(
              selectedPatient: _selectedPatient,
              getSelectedPatient: (patient) {
                setState(() {
                  _selectedPatient = patient;
                });
              })),
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue),
              onPressed: _selectedPatient == null
                  ? null
                  : () async {
                      try {
                        _healthScoreReqModel.height =
                            _selectedPatient?.height?.toString();
                        _healthScoreReqModel.weight =
                            _selectedPatient?.weight?.toString();
                        _healthScoreReqModel.name = _selectedPatient!.name;
                        _healthScoreReqModel.mobile = _selectedPatient!.mobile;
                        _healthScoreReqModel.gender = _selectedPatient!.gender;
                        _healthScoreReqModel.patientId =
                            _selectedPatient!.id.toString();

                        _animateToPage(pageIndex: 1);
                      } catch (e) {
                        AppConstants.showSnackbar(
                            text: e.toString(), type: SnackbarType.error);
                      }
                    },
              child: Text('Next')))
    ]);
  }
}
