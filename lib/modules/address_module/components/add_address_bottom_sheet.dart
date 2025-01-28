import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/api_params.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';
import 'package:qris_health/modules/address_module/models/address/address.dart';
import 'package:qris_health/modules/address_module/services/address_service.dart';
import 'package:qris_health/shared/components/common_bottom_sheet_template.dart';
import 'package:qris_health/shared/components/common_cross_icon.dart';
import 'package:qris_health/shared/components/common_field_dropdown.dart';
import 'package:qris_health/shared/components/common_textfield.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';

import '../../../styles/app_colors.dart';

class AddAddressBottomSheet extends StatefulWidget {
  final Function(Address) onAddressAdded;
  const AddAddressBottomSheet({super.key, required this.onAddressAdded});

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
  final _formKey = GlobalKey<FormState>();
  String? _selectedState;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return CommonBottomSheetTemplate(
        child: Form(
      key: _formKey,
      child: ListView(
          physics: BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
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
                validator: (houseNumber) {
                  if (houseNumber.isNullOrEmpty) {
                    return 'This is a required field';
                  }

                  return null;
                },
                controller: _houseNumberController,
                textInputType: TextInputType.text,
                headingText: 'Flat/House no',
                autoFocus: true,
                isRequired: true),
            SizedBox(height: 16),
            CommonTextField(
                validator: (address) {
                  if (address.isNullOrEmpty) {
                    return 'This is a required field';
                  }

                  return null;
                },
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
                hintText: 'Provide your landmark',
                controller: _landmarkController,
                textInputType: TextInputType.streetAddress,
                isRequired: true,
                validator: (landmark) {
                  if (landmark.isNullOrEmpty) {
                    return 'This is a required field';
                  }

                  return null;
                },
                headingText: 'Landmark'),
            SizedBox(height: 16),
            CommonTextField(
                hintText: 'Enter your pincode',
                controller: _pincodeController,
                isRequired: true,
                maxLength: 6,
                validator: (pincode) {
                  if (pincode?.length != 6) {
                    return 'Invalid pincode';
                  }

                  return null;
                },
                textInputType: TextInputType.number,
                headingText: 'Pincode'),
            SizedBox(height: 16),
            CommonFieldDropdown(
                isRequired: true,
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
                onPressed: _loading ? null : _addAddress,
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue),
                child: Text('Save Address')),
            SizedBox(height: 16),
          ]),
    ));
  }

  Future<void> _addAddress() async {
    try {
      if (_selectedState == null) {
        AppConstants.showSnackbar(
            text: 'Please enter the state', type: SnackbarType.error);
      }

      if (_formKey.currentState?.validate() == true) {
        setState(() {
          _loading = true;
        });

        final addedAddress = await AddressService.addAddress(
            address: Address(
                id: null,
                house: _houseNumberController.text,
                address1: _addressLine1Controller.text,
                address2: _addressLine1Controller.text,
                landmark: _landmarkController.text,
                pincode: _pincodeController.text,
                state: _selectedState),
            userId: ApiParams.getInstance()!.userId!);

        widget.onAddressAdded(addedAddress);
        Navigator.of(context).pop();
        AppConstants.showSnackbar(
            text: 'Address added successfully', type: SnackbarType.success);
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
