import 'package:flutter/material.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/shared/components/common_field_dropdown.dart';
import 'package:qris_health/shared/components/common_textfield.dart';
import 'package:qris_health/styles/app_colors.dart';

class BasicDiagnosisTab extends StatefulWidget {
  final Function() onNext;
  const BasicDiagnosisTab({super.key, required this.onNext});

  @override
  State<BasicDiagnosisTab> createState() => _BasicDiagnosisTabState();
}

class _BasicDiagnosisTabState extends State<BasicDiagnosisTab> {
  String? _bp;
  String? _pulseOption;
  String? _sleepPattern;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      CommonFieldDropdown(
          labelText: null,
          hintText: 'Select your Blood pressure',
          items: AppConstants.bpOptions
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
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
          items: AppConstants.pulseOptions
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
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
          items: AppConstants.pulseOptions
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
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
              onPressed: widget.onNext,
              child: Text('Next')))
    ]);
  }
}
