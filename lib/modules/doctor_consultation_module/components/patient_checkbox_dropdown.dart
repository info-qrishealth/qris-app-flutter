import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/modules/orders_modele/models/order_status/order_status.dart';
import 'package:qris_health/styles/app_colors.dart';

class PatientCheckboxDropdown extends StatefulWidget {
  final List<PatientStatus> patients;
  final Function(List<String> selectedPatientIds) onSelectionChanged;
  final List<String> bookedPatientIds;

  const PatientCheckboxDropdown({
    super.key,
    required this.patients,
    required this.onSelectionChanged,
    this.bookedPatientIds = const [],
  });

  @override
  State<PatientCheckboxDropdown> createState() => _PatientCheckboxDropdownState();
}

class _PatientCheckboxDropdownState extends State<PatientCheckboxDropdown> {
  final _textTheme = Get.textTheme;
  final Set<String> _selectedPatientIds = {};
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    // Only auto-select first patient if it's not already booked AND all reports are generated
    if (widget.patients.isNotEmpty) {
      final firstPatient = widget.patients.first;
      final allReportsGenerated = _checkAllReportsGenerated(firstPatient);
      
      if (!widget.bookedPatientIds.contains(firstPatient.patientId) && allReportsGenerated) {
        _selectedPatientIds.add(firstPatient.patientId);
        widget.onSelectionChanged(_selectedPatientIds.toList());
      }
    }
    
    // Remove any selected patients that don't have all reports generated or are booked
    _selectedPatientIds.removeWhere((patientId) {
      final patient = widget.patients.firstWhere(
        (p) => p.patientId == patientId,
        orElse: () => widget.patients.first,
      );
      final allReportsGenerated = _checkAllReportsGenerated(patient);
      return widget.bookedPatientIds.contains(patientId) || !allReportsGenerated;
    });
    
    if (_selectedPatientIds.isNotEmpty) {
      widget.onSelectionChanged(_selectedPatientIds.toList());
    }
  }
  
  bool _checkAllReportsGenerated(PatientStatus patient) {
    // Check if all reports are generated (either from backend flag or calculate from tests)
    if (patient.allReportsGenerated != null) {
      return patient.allReportsGenerated!;
    }
    // Fallback: calculate from tests - ALL tests must have reportStatus = 'complete'
    if (patient.tests.isEmpty) {
      return false;
    }
    return patient.tests.every((test) => test.reportStatus == 'complete');
  }

  void _togglePatient(String patientId) {
    final patient = widget.patients.firstWhere(
      (p) => p.patientId == patientId,
      orElse: () => widget.patients.first,
    );
    
    // Don't allow toggling if patient is already booked
    if (widget.bookedPatientIds.contains(patientId)) {
      return;
    }
    
    // Don't allow toggling if all reports are not generated
    final allReportsGenerated = _checkAllReportsGenerated(patient);
    if (!allReportsGenerated) {
      return;
    }

    setState(() {
      if (_selectedPatientIds.contains(patientId)) {
        _selectedPatientIds.remove(patientId);
      } else {
        _selectedPatientIds.add(patientId);
      }
      widget.onSelectionChanged(_selectedPatientIds.toList());
    });
  }

  String _getSelectedPatientsText() {
    if (_selectedPatientIds.isEmpty) {
      return 'Select patients';
    }
    if (_selectedPatientIds.length == 1) {
      final patient = widget.patients.firstWhere(
        (p) => p.patientId == _selectedPatientIds.first,
        orElse: () => widget.patients.first,
      );
      return patient.patientName;
    }
    return '${_selectedPatientIds.length} patients selected';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _getSelectedPatientsText(),
                      style: _textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Icon(
                    _isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: AppColors.lightGrey,
                  ),
                ],
              ),
            ),
          ),
          if (_isExpanded)
            Divider(height: 1, color: AppColors.borderColor),
          if (_isExpanded)
            Container(
              constraints: BoxConstraints(maxHeight: 200),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: widget.patients.length,
                separatorBuilder: (context, index) => Divider(
                  height: 1,
                  color: AppColors.borderColor,
                ),
                itemBuilder: (context, index) {
                  final patient = widget.patients[index];
                  final isBooked = widget.bookedPatientIds.contains(patient.patientId);
                  // Check if all reports are generated (either from backend flag or calculate from tests)
                  final allReportsGenerated = _checkAllReportsGenerated(patient);
                  final isDisabled = isBooked || !allReportsGenerated;
                  
                  // Remove from selection if disabled - do this immediately
                  if (isDisabled && _selectedPatientIds.contains(patient.patientId)) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (mounted) {
                        setState(() {
                          _selectedPatientIds.remove(patient.patientId);
                          widget.onSelectionChanged(_selectedPatientIds.toList());
                        });
                      }
                    });
                  }
                  
                  final isSelected = !isDisabled && _selectedPatientIds.contains(patient.patientId);

                  return InkWell(
                    onTap: isDisabled ? null : () => _togglePatient(patient.patientId),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 24,
                                width: 24,
                                child: Checkbox(
                                  value: isSelected,
                                  onChanged: isDisabled ? null : (_) => _togglePatient(patient.patientId),
                                  activeColor: AppColors.primaryBlue,
                                  checkColor: Colors.white,
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        patient.patientName,
                                        style: _textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: isDisabled ? AppColors.lightGrey : Colors.black,
                                        ),
                                      ),
                                    ),
                                    if (isBooked)
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: AppColors.lightGrey.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          'Booked',
                                          style: _textTheme.labelSmall?.copyWith(
                                            color: AppColors.lightGrey,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          if (!allReportsGenerated && !isBooked)
                            Padding(
                              padding: const EdgeInsets.only(left: 36, top: 4),
                              child: Text(
                                '(Report not generated yet)',
                                style: _textTheme.labelSmall?.copyWith(
                                  color: AppColors.lightGrey,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}


