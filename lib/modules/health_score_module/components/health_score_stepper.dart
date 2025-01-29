import 'package:flutter/material.dart';

import '../../../styles/app_colors.dart';
import '../../cart_module/components/step_indicator/step_circle.dart';

class HealthScoreStepper extends StatelessWidget {
  final int selectedStepIndex;
  const HealthScoreStepper({super.key, required this.selectedStepIndex});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      StepCircle(
          step: 0, selectedStep: selectedStepIndex, title: 'Select Patient'),
      _divider(
          selectedStepIndex > 0 ? AppColors.primaryBlue : Color(0x0C411E75)),
      StepCircle(
          step: 1, selectedStep: selectedStepIndex, title: 'Patient Info'),
      _divider(
          selectedStepIndex > 1 ? AppColors.primaryBlue : Color(0x0C411E75)),
      StepCircle(
          step: 2, selectedStep: selectedStepIndex, title: 'Basic Diagnosis'),
      _divider(
          selectedStepIndex > 2 ? AppColors.primaryBlue : Color(0x0C411E75)),
      StepCircle(
          step: 3, selectedStep: selectedStepIndex, title: 'Lifestyle Habits'),
    ]);
  }

  Widget _divider(Color color) {
    return Expanded(child: Container(height: 1, color: color));
  }
}
