import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/shared/components/common_bottom_sheet_template.dart';
import 'package:qris_health/shared/components/common_cross_icon.dart';
import 'package:qris_health/shared/components/common_field_dropdown.dart';
import 'package:qris_health/shared/components/common_textfield.dart';

import '../../../styles/app_colors.dart';

class AddAddressBottomSheet extends StatefulWidget {
  const AddAddressBottomSheet({super.key});

  @override
  State<AddAddressBottomSheet> createState() => _AddAddressBottomSheetState();
}

class _AddAddressBottomSheetState extends State<AddAddressBottomSheet> {
  final _textTheme = Get.textTheme;

  final _houseNumberController = TextEditingController();
  final _addressLine1Controller = TextEditingController();
  final _addressLine2Controller = TextEditingController();
  final _landmarkController = TextEditingController();
  final _pincodeController = TextEditingController();
  String? _selectedState;

  @override
  Widget build(BuildContext context) {
    return CommonBottomSheetTemplate(
        child: ListView(physics: BouncingScrollPhysics(), children: [
      SizedBox(height: 16),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('Add Address',
            style: _textTheme.headlineLarge!
                .copyWith(fontWeight: FontWeight.w700)),
        CommonCrossIcon(),
      ]),
      SizedBox(height: 18),
      CommonTextField(
          hintText: 'Enter your house number',
          controller: _houseNumberController,
          textInputType: TextInputType.text,
          headingText: 'Flat/House no',
          autoFocus: true,
          isRequired: true),
      SizedBox(height: 16),
      CommonTextField(
          hintText: 'Enter your complete address',
          controller: _addressLine1Controller,
          textInputType: TextInputType.streetAddress,
          headingText: 'Address Line 1',
          isRequired: true),
      SizedBox(height: 16),
      CommonTextField(
          hintText: 'Enter your complete address',
          controller: _addressLine2Controller,
          textInputType: TextInputType.streetAddress,
          headingText: 'Address Line 2'),
      SizedBox(height: 16),
      CommonTextField(
          hintText: 'Provide your landmark if any',
          controller: _landmarkController,
          textInputType: TextInputType.streetAddress,
          isRequired: true,
          headingText: 'Landmark'),
      SizedBox(height: 16),
      CommonTextField(
          hintText: 'Enter your pincode',
          controller: _pincodeController,
          isRequired: true,
          textInputType: TextInputType.streetAddress,
          headingText: 'Pincode'),
      SizedBox(height: 16),
      CommonFieldDropdown(
          labelText: null,
          items: AppConstants.stateList
              .map((state) => DropdownMenuItem(
                  value: state, child: Text(state.capitalizeFirst!)))
              .toList(),
          selectedValue: _selectedState,
          onChanged: (value) {
            setState(() {
              _selectedState = value;
            });
          },
          headingText: 'State'),
      SizedBox(height: 16),
      ElevatedButton(
          onPressed: () {},
          style:
              ElevatedButton.styleFrom(backgroundColor: AppColors.primaryBlue),
          child: Text('Save Address')),
      SizedBox(height: 16),
    ]));
  }
}
