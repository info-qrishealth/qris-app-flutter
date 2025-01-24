import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/enums/gender.dart';
import 'package:qris_health/constants/enums/married_title.dart';
import 'package:qris_health/shared/components/common_bottom_sheet_template.dart';
import 'package:qris_health/shared/components/common_cross_icon.dart';
import 'package:qris_health/shared/components/common_field_dropdown.dart';
import 'package:qris_health/shared/components/common_textfield.dart';
import 'package:qris_health/shared/components/dob_dropdown.dart';
import 'package:qris_health/shared/components/gender_input_container_row.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';
import 'package:qris_health/styles/app_colors.dart';

class AddPatientListTile extends StatefulWidget {
  const AddPatientListTile({super.key});

  @override
  State<AddPatientListTile> createState() => _AddPatientListTileState();
}

class _AddPatientListTileState extends State<AddPatientListTile> {
  final _nameController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  MarriedTitle? _selectedTitle;

  final _textTheme = Get.textTheme;

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
                  child: ListView(physics: BouncingScrollPhysics(), children: [
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
                    selectedValue: null,
                    hintText: 'Select your title',
                    isRequired: true,
                    onChanged: (selectedTitle) {
                      setState(() {
                        _selectedTitle = selectedTitle;
                      });
                    },
                    headingText: 'Title'),
                SizedBox(height: 18),
                CommonTextField(
                    controller: _nameController,
                    textInputType: TextInputType.name,
                    headingText: 'Name',
                    isRequired: true,
                    hintText: 'Enter your full Name'),
                SizedBox(height: 18),
                DobDropdown(
                    isRequired: true,
                    getSelectedDay: (day) {},
                    getSelectedMonth: (month) {},
                    getSelectedYear: (year) {}),
                SizedBox(height: 18),
                GenderInputContainerRow(
                    onTap: (selectedGender) {},
                    selectedGender: Gender.MALE,
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
              ])),
              SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue),
                  child: Text('Save Member')),
              SizedBox(height: 16),
            ])));
  }
}
