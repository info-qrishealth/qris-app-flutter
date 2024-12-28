import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/health_score_module/components/health_score_stepper.dart';
import 'package:qris_health/modules/health_score_module/components/select_patient_view.dart';
import 'package:qris_health/modules/health_score_module/components/tabs/basic_diagnosis_tab.dart';
import 'package:qris_health/modules/health_score_module/components/tabs/lifestyle_habit_tab.dart';
import 'package:qris_health/modules/health_score_module/screens/health_score_loading_screen.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/styles/app_colors.dart';

class HealthScoreScreen extends StatefulWidget {
  const HealthScoreScreen({super.key});

  @override
  State<HealthScoreScreen> createState() => _HealthScoreScreenState();
}

class _HealthScoreScreenState extends State<HealthScoreScreen> {
  final _pageController = PageController();
  int _selectedPage = 0;

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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child:
                          HealthScoreStepper(selectedStepIndex: _selectedPage)),
                  SizedBox(height: 60),
                  Expanded(
                      child: PageView(
                          controller: _pageController,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                        _buildSelectPatientView(),
                        BasicDiagnosisTab(onNext: () {
                          _animateToPage(pageIndex: 2);
                        }),
                        LifestyleHabitTab(onNext: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) =>
                                  HealthScoreLoadingScreen()));
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
      Expanded(child: SelectPatientView()),
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue),
              onPressed: () {
                _animateToPage(pageIndex: 1);
              },
              child: Text('Next')))
    ]);
  }
}
