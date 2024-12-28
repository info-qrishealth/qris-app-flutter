import 'package:flutter/material.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/shared/components/common_field_dropdown.dart';
import 'package:qris_health/styles/app_colors.dart';

class LifestyleHabitTab extends StatefulWidget {
  final Function() onNext;
  const LifestyleHabitTab({super.key, required this.onNext});

  @override
  State<LifestyleHabitTab> createState() => _LifestyleHabitTabState();
}

class _LifestyleHabitTabState extends State<LifestyleHabitTab> {
  String? _dietOption;
  String? _waterOption;
  String? _alcoholOption;
  String? _cigaretteOption;
  String? _exerciseOption;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Expanded(
          child: ListView(children: [
        CommonFieldDropdown(
            labelText: null,
            items: AppConstants.dietOptions
                .map((diet) => DropdownMenuItem(value: diet, child: Text(diet)))
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
            items: AppConstants.waterOptions
                .map((water) =>
                    DropdownMenuItem(value: water, child: Text(water)))
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
            items: AppConstants.alcoholOptions
                .map((alcohol) =>
                    DropdownMenuItem(value: alcohol, child: Text(alcohol)))
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
            items: AppConstants.cigarettesOptions
                .map((cigarette) =>
                    DropdownMenuItem(value: cigarette, child: Text(cigarette)))
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
            items: AppConstants.exerciseOptions
                .map((exercise) =>
                    DropdownMenuItem(value: exercise, child: Text(exercise)))
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
              onPressed: widget.onNext,
              child: Text('Submit')))
    ]);
  }
}
