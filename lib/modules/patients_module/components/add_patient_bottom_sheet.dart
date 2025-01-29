import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/api_params.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/gender.dart';
import 'package:qris_health/constants/enums/married_title.dart';
import 'package:qris_health/constants/enums/month.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';
import 'package:qris_health/modules/patients_module/models/patient/patient.dart';
import 'package:qris_health/modules/patients_module/services/patient_service.dart';
import 'package:qris_health/shared/components/common_bottom_sheet_template.dart';
import 'package:qris_health/shared/components/common_cross_icon.dart';
import 'package:qris_health/shared/components/common_field_dropdown.dart';
import 'package:qris_health/shared/components/common_textfield.dart';
import 'package:qris_health/shared/components/dob_dropdown.dart';
import 'package:qris_health/shared/components/gender_input_container_row.dart';
import 'package:qris_health/shared/extensions/date_time_extension.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';
import 'package:qris_health/shared/utils/enum_utils.dart';
import 'package:qris_health/styles/app_colors.dart';

class AddPatientBottomSheet extends StatefulWidget {
  final Patient? patient;
  final Function(Patient)? getAddedPatient;
  final Function(Patient)? getUpdatedPatient;

  const AddPatientBottomSheet(
      {super.key,
      this.patient,
      required this.getAddedPatient,
      required this.getUpdatedPatient});

  @override
  State<AddPatientBottomSheet> createState() => _AddPatientBottomSheetState();
}

class _AddPatientBottomSheetState extends State<AddPatientBottomSheet> {
  final _nameController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _textTheme = Get.textTheme;
  late Patient _patient;

  int? _selectedDay;
  Month? _selectedMonth;
  int? _selectedYear;

  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _patient = widget.patient ?? Patient();
    _nameController.text = _patient.name ?? '';
    _heightController.text = '${_patient.height ?? ''}';
    _weightController.text = '${_patient.weight ?? ''}';
    final dob = _patient.dob?.toDateTime;

    if (dob != null) {
      _selectedDay = dob.day;
      _selectedMonth = Month.values[dob.month - 1];
      _selectedYear = dob.year;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonBottomSheetTemplate(
        isExtendedWidget: false,
        child: Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
              Expanded(
                  child: Form(
                      key: _formKey,
                      child:
                          ListView(physics: BouncingScrollPhysics(), children: [
                        SizedBox(height: 32),
                        Row(children: [
                          Text('Add Member details',
                              style: _textTheme.headlineLarge!
                                  .copyWith(fontWeight: FontWeight.w700)),
                          Spacer(),
                          CommonCrossIcon(),
                        ]),
                        SizedBox(height: 32),
                        CommonFieldDropdown(
                            labelText: null,
                            items: MarriedTitle.values
                                .map((title) => DropdownMenuItem(
                                    value: title,
                                    child: Text(title.name.formattedEnumName!)))
                                .toList(),
                            selectedValue: _patient.title == null
                                ? null
                                : MarriedTitle.values[_patient.title! - 1 < 0
                                    ? 0
                                    : _patient.title! - 1],
                            hintText: 'Select your title',
                            isRequired: true,
                            onChanged: (selectedTitle) {
                              setState(() {
                                _patient = _patient.copyWith
                                    .call(title: selectedTitle!.number);
                              });
                            },
                            headingText: 'Title'),
                        SizedBox(height: 18),
                        CommonTextField(
                            controller: _nameController,
                            textInputType: TextInputType.name,
                            headingText: 'Name',
                            isRequired: true,
                            validator: (name) {
                              if (name.isNullOrEmpty) {
                                return 'Please enter member name';
                              }

                              return null;
                            },
                            hintText: 'Enter your full Name'),
                        SizedBox(height: 18),
                        DobDropdown(
                            isRequired: true,
                            selectedDay: _selectedDay,
                            selectedMonth: _selectedMonth,
                            selectedYear: _selectedYear,
                            getSelectedDay: (day) {
                              setState(() {
                                _selectedDay = day;
                              });
                            },
                            getSelectedMonth: (month) {
                              setState(() {
                                _selectedMonth = month;
                              });
                            },
                            getSelectedYear: (year) {
                              setState(() {
                                _selectedYear = year;
                              });
                            }),
                        SizedBox(height: 18),
                        GenderInputContainerRow(
                            onTap: (selectedGender) {
                              setState(() {
                                _patient = _patient.copyWith.call(
                                    gender: selectedGender == Gender.OTHERS
                                        ? '0'
                                        : selectedGender == Gender.MALE
                                            ? '2'
                                            : '1');
                              });
                            },
                            selectedGender: _patient.gender == null
                                ? null
                                : _patient.gender == '0'
                                    ? Gender.OTHERS
                                    : _patient.gender == '1'
                                        ? Gender.FEMALE
                                        : Gender.MALE,
                            isRequired: true),
                        SizedBox(height: 18),
                        CommonTextField(
                            hintText: 'Enter your body weight',
                            controller: _weightController,
                            textInputType: TextInputType.number,
                            headingText: 'Weight (in kg)'),
                        SizedBox(height: 18),
                        CommonTextField(
                            hintText: 'Enter your height',
                            controller: _heightController,
                            textInputType: TextInputType.number,
                            headingText: 'Height (in cm)'),
                      ]))),
              SizedBox(height: 16),
              ElevatedButton(
                  onPressed: _loading ? null : _addPatient,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue),
                  child: Text(widget.patient == null
                      ? 'Save Member'
                      : 'Update Member')),
              SizedBox(height: 16),
            ])));
  }

  Future<void> _addPatient() async {
    try {
      if (_patient.title == null) {
        return AppConstants.showSnackbar(
            text: 'Please enter title first', type: SnackbarType.error);
      }

      if (_patient.gender == null) {
        return AppConstants.showSnackbar(
            text: 'Please select gender', type: SnackbarType.error);
      }

      if (_selectedDay == null ||
          _selectedMonth == null ||
          _selectedYear == null) {
        return AppConstants.showSnackbar(
            text: 'Please enter date of birth of family member',
            type: SnackbarType.error);
      }

      if (_formKey.currentState?.validate() == true) {
        setState(() {
          _loading = true;
        });

        final dob =
            DateTime(_selectedYear!, _selectedMonth!.number, _selectedDay!);
        _patient = _patient.copyWith.call(
            dob: dob.toTimestampForServer,
            name: _nameController.text,
            weight: int.tryParse(_weightController.text),
            height: int.tryParse(_heightController.text));

        if (widget.patient == null) {
          final patient = await PatientService.addNewPatientForUser(
              userId: ApiParams.getInstance()!.userId!.toString(),
              patient: _patient);
          if (widget.getAddedPatient != null) widget.getAddedPatient!(patient);
        } else {
          final patient = await PatientService.updatePatient(_patient);
          if (widget.getUpdatedPatient != null) {
            widget.getUpdatedPatient!(patient);
          }
        }

        Navigator.of(context).pop();
        AppConstants.showSnackbar(
            text: 'Action performed successfully', type: SnackbarType.success);
      }
    } catch (e) {
      AppConstants.showSnackbar(text: e.toString(), type: SnackbarType.error);
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }
}
