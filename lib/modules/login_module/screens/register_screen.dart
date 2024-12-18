import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/gender.dart';
import 'package:qris_health/modules/login_module/components/privacy_policy_text.dart';
import 'package:qris_health/shared/components/common_field_dropdown.dart';
import 'package:qris_health/shared/components/common_textfield.dart';
import 'package:qris_health/shared/components/dob_dropdown.dart';
import 'package:qris_health/shared/components/gender_input_container_row.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';
import 'package:qris_health/shared/utils/search_pattern.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../components/create_account_text.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  final _textTheme = Get.textTheme;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Form(
                key: _formKey,
                child: ListView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.scaffoldPadding),
                    children: [
                      SizedBox(height: 20),
                      Text('Create your account',
                          style: _textTheme.headlineLarge!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor),
                          textAlign: TextAlign.center),
                      SizedBox(height: 10),
                      Text(
                          'Create Account to Access - Quick test booking, online reports, notifications, Qris Wallet and much more',
                          style: _textTheme.bodyLarge!.copyWith(
                              height: 1.3,
                              color: AppColors.lightSubTextColor,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center),
                      SizedBox(height: 50),
                      CommonFieldDropdown(
                          labelText: null,
                          items: List.generate(
                              5,
                              (index) => DropdownMenuItem(
                                  value: index,
                                  child: Text('Title ${index + 1}'))),
                          selectedValue: null,
                          onChanged: (value) {},
                          headingText: 'Title'),
                      SizedBox(height: 16),
                      CommonTextField(
                          validator: (name) {
                            if (name.isNullOrEmpty) {
                              return 'Please enter the name';
                            }

                            return null;
                          },
                          hintText: 'Enter your full name',
                          controller: _nameController,
                          textInputType: TextInputType.name,
                          headingText: 'Full Name'),
                      SizedBox(height: 16),
                      CommonTextField(
                          validator: (email) {
                            if (email.isNullOrEmpty) {
                              return 'Please enter your email address';
                            } else if (!SearchPattern.isValidEmail(email)) {
                              return 'Email address should contain @ and .';
                            }

                            return null;
                          },
                          hintText: 'Enter your email Id',
                          controller: _emailController,
                          textInputType: TextInputType.emailAddress,
                          headingText: 'Email'),
                      SizedBox(height: 16),
                      CommonTextField(
                          validator: (phone) {
                            if (!SearchPattern.isValidPhoneNumber(phone)) {
                              return 'Invalid phone number';
                            }

                            return null;
                          },
                          hintText: 'Enter your 10 digit mobile number',
                          controller: _phoneNumberController,
                          textInputType: TextInputType.phone,
                          headingText: 'Mobile Number'),
                      SizedBox(height: 16),
                      DobDropdown(),
                      SizedBox(height: 16),
                      GenderInputContainerRow(
                          onTap: (selectedGender) {}, gender: Gender.MALE),
                      SizedBox(height: 32),
                      ElevatedButton(
                          onPressed: () {
                            // todo:

                            if (_formKey.currentState?.validate() == true) {}
                          },
                          child: Text('Create Account')),
                      SizedBox(height: 28),
                      PrivacyPolicyText(),
                      SizedBox(height: 16),
                      CreateAccountText(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          primaryText: 'Already have an account?',
                          secondaryText: ' Login Now'),
                      SizedBox(height: 16),
                    ]))));
  }
}
