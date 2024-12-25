import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/modules/cart_module/components/step_indicator/step_circle.dart';

import '../../../../styles/app_colors.dart';

class StepIndicator extends StatelessWidget {
  final int selectedStepIndex;
  const StepIndicator(this.selectedStepIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      StepCircle(step: 0, selectedStep: selectedStepIndex),
      _divider(
          selectedStepIndex > 0 ? AppColors.primaryBlue : Color(0x0C411E75)),
      StepCircle(step: 1, selectedStep: selectedStepIndex),
      _divider(
          selectedStepIndex > 1 ? AppColors.primaryBlue : Color(0x0C411E75)),
      StepCircle(step: 2, selectedStep: selectedStepIndex),
      _divider(
          selectedStepIndex > 2 ? AppColors.primaryBlue : Color(0x0C411E75)),
      StepCircle(step: 3, selectedStep: selectedStepIndex),
    ]);
  }

  Widget _divider(Color color) {
    return Expanded(child: Container(height: 1, color: color));
  }
}
