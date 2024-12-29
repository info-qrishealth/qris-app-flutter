import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/enums/questionnaire_type.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../constants/app_constants.dart';

class QuestionnaireScreen extends StatefulWidget {
  const QuestionnaireScreen({super.key});

  @override
  State<QuestionnaireScreen> createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  final _textTheme = Get.textTheme;
  final _pageController = PageController();
  QuestionnaireType _questionnaireType = QuestionnaireType.TEXTAREA;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Questionnaire'),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.scaffoldPadding),
              child: Column(children: [
                SizedBox(height: 24),
                Row(children: [
                  Expanded(
                      child: SliderTheme(
                          data: SliderThemeData(
                              overlayShape: SliderComponentShape.noOverlay,
                              thumbShape: SliderComponentShape.noOverlay,
                              trackHeight: 7,
                              activeTrackColor: AppColors.primaryBlue,
                              inactiveTrackColor:
                                  AppColors.primaryBlue.withOpacity(0.05)),
                          child: Slider(
                              value: 1, onChanged: (value) {}, max: 12))),
                  SizedBox(width: 12),
                  Text('1/12',
                      style: _textTheme.labelSmall!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryPink))
                ]),
                Expanded(
                    child: PageView.builder(
                        controller: _pageController,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 12,
                        itemBuilder: (context, index) {
                          return Center(child: Text('data'));
                        })),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(children: [
                      Expanded(
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  side:
                                      BorderSide(color: AppColors.primaryBlue)),
                              onPressed: () {
                                _pageController.previousPage(
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeIn);
                              },
                              child: Text('Previous',
                                  style: TextStyle(
                                      color: AppColors.primaryBlue)))),
                      SizedBox(width: 12),
                      Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryBlue),
                              onPressed: () {
                                _pageController.nextPage(
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeIn);
                              },
                              child: Text('Next'))),
                    ]))
              ])),
        ));
  }
}
