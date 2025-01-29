import 'package:flutter/material.dart';
import 'package:qris_health/modules/health_score_module/models/health_score_question_model/health_score_question_model.dart';
import 'package:qris_health/modules/health_score_module/utils/health_score_questions_util.dart';
import 'package:qris_health/shared/components/common_field_dropdown.dart';
import 'package:qris_health/styles/app_colors.dart';

class BasicDiagnosisTab extends StatefulWidget {
  final Function(HealthScoreQuestionModel bp, HealthScoreQuestionModel pulse,
      HealthScoreQuestionModel sleep) onNext;

  const BasicDiagnosisTab({super.key, required this.onNext});

  @override
  State<BasicDiagnosisTab> createState() => _BasicDiagnosisTabState();
}

class _BasicDiagnosisTabState extends State<BasicDiagnosisTab> {
  HealthScoreQuestionModel? _bp;
  HealthScoreQuestionModel? _pulseOption;
  HealthScoreQuestionModel? _sleepPattern;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      CommonFieldDropdown<HealthScoreQuestionModel>(
          labelText: null,
          hintText: 'Select your Blood pressure',
          items: HealthScoreQuestionsUtil.bloodPressureScores
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option.option)))
              .toList(),
          selectedValue: _bp,
          onChanged: (bp) {
            setState(() {
              _bp = bp;
            });
          },
          isRequired: true,
          headingText: 'Blood pressure'),
      SizedBox(height: 16),
      CommonFieldDropdown(
          labelText: null,
          hintText: 'Select your Pulse rate',
          items: HealthScoreQuestionsUtil.heartRateScores
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option.option)))
              .toList(),
          isExpanded: true,
          selectedValue: _pulseOption,
          onChanged: (pulse) {
            setState(() {
              _pulseOption = pulse;
            });
          },
          isRequired: true,
          headingText: 'Pulse Rate'),
      SizedBox(height: 16),
      CommonFieldDropdown(
          labelText: null,
          hintText: 'Select your Sleep pattern',
          isExpanded: true,
          items: HealthScoreQuestionsUtil.sleepScores
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option.option)))
              .toList(),
          selectedValue: _sleepPattern,
          onChanged: (sleepPattern) {
            setState(() {
              _sleepPattern = sleepPattern;
            });
          },
          isRequired: true,
          headingText: 'Sleep Pattern'),
      Spacer(),
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue),
              onPressed: _bp == null ||
                      _pulseOption == null ||
                      _sleepPattern == null
                  ? null
                  : () => widget.onNext(_bp!, _sleepPattern!, _pulseOption!),
              child: Text('Next')))
    ]);
  }
}
