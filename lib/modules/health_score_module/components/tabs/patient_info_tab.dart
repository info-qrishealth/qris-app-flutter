import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';
import 'package:qris_health/modules/patients_module/cubits/patients_cubit/patients_cubit.dart';
import 'package:qris_health/modules/patients_module/models/patient/patient.dart';
import 'package:qris_health/modules/patients_module/services/patient_service.dart';
import 'package:qris_health/shared/components/common_textfield.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';

import '../../../../styles/app_colors.dart';

class PatientInfoTab extends StatefulWidget {
  final Function(Patient) onNext;
  final Patient patient;
  const PatientInfoTab(
      {super.key, required this.patient, required this.onNext});

  @override
  State<PatientInfoTab> createState() => _PatientInfoTabState();
}

class _PatientInfoTabState extends State<PatientInfoTab> {
  final _nameController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.patient.name ?? '';
    _heightController.text = widget.patient.height?.toString() ?? '';
    _weightController.text = widget.patient.weight?.toString() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
              child: ListView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  children: [
                CommonTextField(
                    controller: _nameController,
                    isRequired: true,
                    textInputType: TextInputType.name,
                    readOnly: true,
                    headingText: 'Patient Name'),
                SizedBox(height: 16),
                CommonTextField(
                    hintText: 'Enter patient height in centimeters',
                    controller: _heightController,
                    textInputType: TextInputType.number,
                    validator: (value) {
                      if (value.isNullOrEmpty ||
                          double.tryParse(value!) == null) {
                        return 'Field is required';
                      }

                      return null;
                    },
                    headingText: 'Height (in cm)',
                    isRequired: true),
                SizedBox(height: 16),
                CommonTextField(
                    validator: (value) {
                      if (value.isNullOrEmpty ||
                          double.tryParse(value!) == null) {
                        return 'Field is required';
                      }

                      return null;
                    },
                    isRequired: true,
                    controller: _weightController,
                    textInputType: TextInputType.number,
                    hintText: 'Enter patient weight in kilograms',
                    headingText: 'Weight (in kg)'),
              ])),
          SizedBox(height: 16),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue),
                  onPressed: _loading
                      ? null
                      : () async {
                          if (_formKey.currentState?.validate() == true) {
                            try {
                              setState(() {
                                _loading = true;
                              });

                              final updatedPatient = await PatientService
                                  .updatePatient(widget.patient.copyWith.call(
                                      height: int.parse(_heightController.text),
                                      weight:
                                          int.parse(_weightController.text)));
                              print(updatedPatient);

                              BlocProvider.of<PatientsCubit>(context)
                                  .updatePatient(updatedPatient);
                              FocusScope.of(context).unfocus();
                              widget.onNext(updatedPatient);
                            } catch (e) {
                              AppConstants.showSnackbar(
                                  text: e.toString(), type: SnackbarType.error);
                            } finally {
                              setState(() {
                                _loading = false;
                              });
                            }
                          }
                        },
                  child: Text('Next')))
        ]));
  }
}
