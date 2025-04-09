import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/gender.dart';
import 'package:qris_health/constants/enums/married_title.dart';
import 'package:qris_health/constants/enums/month.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';
import 'package:qris_health/modules/login_module/components/privacy_policy_text.dart';
import 'package:qris_health/modules/login_module/models/user/user.dart';
import 'package:qris_health/modules/login_module/screens/otp_screen.dart';
import 'package:qris_health/modules/login_module/services/otp_service.dart';
import 'package:qris_health/shared/components/common_field_dropdown.dart';
import 'package:qris_health/shared/components/common_textfield.dart';
import 'package:qris_health/shared/components/dob_dropdown.dart';
import 'package:qris_health/shared/components/gender_input_container_row.dart';
import 'package:qris_health/shared/extensions/date_time_extension.dart';
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
  final _referCodeController = TextEditingController();

  final _textTheme = Get.textTheme;
  final _formKey = GlobalKey<FormState>();

  MarriedTitle? _selectedTitle;
  Gender? _selectedGender;
  DateTime? _selectedDate;

  bool _loading = false;

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
                          items: MarriedTitle.values
                              .map((title) => DropdownMenuItem(
                                  value: title,
                                  child: Text(title.name.formattedEnumName!)))
                              .toList(),
                          selectedValue: _selectedTitle,
                          onChanged: (value) {
                            setState(() {
                              _selectedTitle = value;
                            });
                          },
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
                      DobDropdown(
                          selectedDate: _selectedDate,
                          getSelectedDate: (selectedDate) {
                            setState(() {
                              _selectedDate = selectedDate;
                            });
                          }),
                      SizedBox(height: 16),
                      CommonTextField(
                          controller: _referCodeController,
                          textInputType: TextInputType.text,
                          headingText: 'Refer code (If any)',
                          hintText: 'Enter your refer code if any'),
                      SizedBox(height: 16),
                      GenderInputContainerRow(
                          onTap: (selectedGender) {
                            setState(() {
                              _selectedGender = selectedGender;
                            });
                          },
                          selectedGender: _selectedGender),
                      SizedBox(height: 32),
                      ElevatedButton(
                          onPressed: _loading ? null : _sendOtp,
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

  Future<void> _sendOtp() async {
    try {
      setState(() {
        _loading = true;
      });

      if (_selectedTitle == null) {
        return AppConstants.showSnackbar(
            text: 'Please enter your title first', type: SnackbarType.warning);
      }

      if (_selectedDate == null) {
        return AppConstants.showSnackbar(
            text: 'Please enter DOB first', type: SnackbarType.warning);
      }

      if (_selectedGender == null) {
        return AppConstants.showSnackbar(
            text: 'Please enter your gender first', type: SnackbarType.warning);
      }

      if (_referCodeController.text.isNotEmpty &&
          _referCodeController.text.length != 8) {
        AppConstants.showSnackbar(
            text: 'Please enter valid referral code',
            type: SnackbarType.warning);
      }

      if (_formKey.currentState?.validate() == true) {
        final isUserAlreadyExists = await OtpService.isUserExists(
            phoneNumber: _phoneNumberController.text,
            email: _emailController.text);

        if (isUserAlreadyExists) {
          return AppConstants.showSnackbar(
              text:
                  'User already exists. Please try to login instead of creating an account',
              type: SnackbarType.error);
        }

        final userToCreate = User(
            title: _selectedTitle!.number,
            name: _nameController.text,
            phone: _phoneNumberController.text,
            userId: _emailController.text,
            email: _emailController.text,
            dob: _selectedDate.toTimestampForServer!,
            gender: _selectedGender!.number.toString(),
            referralCode: _referCodeController.text);

        final otp = await OtpService.sendOtp(
            phoneNumber: _phoneNumberController.text,
            email: userToCreate.email);

        Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) =>
                OtpScreen(userToAdd: userToCreate, otp: otp)));
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
