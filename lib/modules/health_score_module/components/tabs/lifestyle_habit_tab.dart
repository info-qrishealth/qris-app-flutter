import 'package:flutter/material.dart';
import 'package:qris_health/modules/health_score_module/models/health_score_question_model/health_score_question_model.dart';
import 'package:qris_health/modules/health_score_module/utils/health_score_questions_util.dart';
import 'package:qris_health/shared/components/common_field_dropdown.dart';
import 'package:qris_health/styles/app_colors.dart';

class LifestyleHabitTab extends StatefulWidget {
  final Function(
      HealthScoreQuestionModel dietOption,
      HealthScoreQuestionModel waterOption,
      HealthScoreQuestionModel alcholOption,
      HealthScoreQuestionModel ciggerateOption,
      HealthScoreQuestionModel exerciseOption) onSubmit;
  const LifestyleHabitTab({super.key, required this.onSubmit});

  @override
  State<LifestyleHabitTab> createState() => _LifestyleHabitTabState();
}

class _LifestyleHabitTabState extends State<LifestyleHabitTab> {
  HealthScoreQuestionModel? _dietOption;
  HealthScoreQuestionModel? _waterOption;
  HealthScoreQuestionModel? _alcoholOption;
  HealthScoreQuestionModel? _cigaretteOption;
  HealthScoreQuestionModel? _exerciseOption;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Expanded(
          child: ListView(physics: BouncingScrollPhysics(), children: [
        CommonFieldDropdown(
            labelText: null,
            items: HealthScoreQuestionsUtil.fruitVegScores
                .map((diet) =>
                    DropdownMenuItem(value: diet, child: Text(diet.option)))
                .toList(),
            selectedValue: _dietOption,
            onChanged: (diet) {
              setState(() {
                _dietOption = diet;
              });
            },
            headingText: 'How healthy is your diet?'),
        SizedBox(height: 16),
        CommonFieldDropdown(
            labelText: null,
            items: HealthScoreQuestionsUtil.waterIntakeScores
                .map((water) =>
                    DropdownMenuItem(value: water, child: Text(water.option)))
                .toList(),
            selectedValue: _waterOption,
            onChanged: (diet) {
              setState(() {
                _waterOption = diet;
              });
            },
            headingText: 'How many glasses of water do you drink per day?'),
        SizedBox(height: 16),
        CommonFieldDropdown(
            labelText: null,
            items: HealthScoreQuestionsUtil.alcoholConsumptionScores
                .map((alcohol) => DropdownMenuItem(
                    value: alcohol, child: Text(alcohol.option)))
                .toList(),
            selectedValue: _alcoholOption,
            onChanged: (alcohol) {
              setState(() {
                _alcoholOption = alcohol;
              });
            },
            headingText: 'How much alcohol do you consume per day?'),
        SizedBox(height: 16),
        CommonFieldDropdown(
            labelText: null,
            items: HealthScoreQuestionsUtil.smokingScores
                .map((cigarette) => DropdownMenuItem(
                    value: cigarette, child: Text(cigarette.option)))
                .toList(),
            selectedValue: _cigaretteOption,
            onChanged: (cigarette) {
              setState(() {
                _cigaretteOption = cigarette;
              });
            },
            headingText: 'How many cigarettes do you smoke per day?'),
        SizedBox(height: 16),
        CommonFieldDropdown(
            labelText: null,
            items: HealthScoreQuestionsUtil.exerciseScores
                .map((exercise) => DropdownMenuItem(
                    value: exercise, child: Text(exercise.option)))
                .toList(),
            selectedValue: _exerciseOption,
            onChanged: (exercise) {
              setState(() {
                _exerciseOption = exercise;
              });
            },
            headingText:
                'How much do you spend on physical activity in a week (Cycling, Jogging, Swimming, etc)?'),
      ])),
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue),
              onPressed: _alcoholOption == null ||
                      _cigaretteOption == null ||
                      _dietOption == null ||
                      _exerciseOption == null ||
                      _waterOption == null
                  ? null
                  : () => widget.onSubmit(_dietOption!, _waterOption!,
                      _alcoholOption!, _cigaretteOption!, _exerciseOption!),
              child: Text('Submit')))
    ]);
  }
}
