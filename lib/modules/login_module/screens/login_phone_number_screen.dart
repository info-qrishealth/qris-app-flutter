import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';
import 'package:qris_health/modules/login_module/components/privacy_policy_text.dart';
import 'package:qris_health/modules/login_module/screens/login_username_and_password_screen.dart';
import 'package:qris_health/modules/login_module/screens/otp_screen.dart';
import 'package:qris_health/modules/login_module/services/otp_service.dart';
import 'package:qris_health/shared/components/common_textfield.dart';
import 'package:qris_health/shared/components/underline_text.dart';
import 'package:qris_health/shared/components/welcome_header_column.dart';
import 'package:qris_health/shared/utils/search_pattern.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../components/create_account_text.dart';

class LoginPhoneNumberScreen extends StatefulWidget {
  const LoginPhoneNumberScreen({super.key});

  @override
  State<LoginPhoneNumberScreen> createState() => _LoginPhoneNumberScreenState();
}

class _LoginPhoneNumberScreenState extends State<LoginPhoneNumberScreen> {
  final _phoneNumberController = TextEditingController();
  final _textTheme = Get.textTheme;
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: CreateAccountText()),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.scaffoldPadding),
                child: ListView(physics: BouncingScrollPhysics(), children: [
                  SizedBox(height: 20),
                  WelcomeHeaderColumn(),
                  SizedBox(height: 58),
                  Form(
                      key: _formKey,
                      child: CommonTextField(
                          autoFocus: true,
                          validator: (phoneNumber) {
                            if (!SearchPattern.isValidPhoneNumber(
                                phoneNumber)) {
                              return 'Please enter valid phone number';
                            }

                            return null;
                          },
                          controller: _phoneNumberController,
                          textInputType: TextInputType.phone,
                          prefix:
                              Row(mainAxisSize: MainAxisSize.min, children: [
                            Text('+91',
                                style: _textTheme.bodyMedium!.copyWith(
                                    fontFamily:
                                        AppConstants.metropolisFontFamily,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.lightSubTextColor)),
                            SizedBox(width: 4),
                            Icon(Icons.keyboard_arrow_down,
                                color: AppColors.lightSubTextColor, size: 16),
                            SizedBox(width: 8),
                          ]),
                          hintText: 'Enter your 10 digit mobile number',
                          headingText: 'Registered Mobile Number')),
                  SizedBox(height: 21),
                  ElevatedButton(
                      onPressed: _loading
                          ? null
                          : () async {
                              try {
                                if (_formKey.currentState?.validate() == true) {
                                  setState(() {
                                    _loading = true;
                                  });

                                  final otp = await OtpService.sendOtp(
                                      phoneNumber: _phoneNumberController.text);

                                  Navigator.of(context).push(CupertinoPageRoute(
                                      builder: (context) => OtpScreen(
                                          userToAdd: null, otp: otp)));
                                }
                              } catch (e) {
                                AppConstants.showSnackbar(
                                    text: e.toString(),
                                    type: SnackbarType.error);
                              } finally {
                                setState(() {
                                  _loading = false;
                                });
                              }
                            },
                      child: Text('Get OTP')),
                  SizedBox(height: 21),
                  PrivacyPolicyText(),
                  SizedBox(height: 38),
                  Text('-OR-',
                      style: _textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightSubTextColor),
                      textAlign: TextAlign.center),
                  SizedBox(height: 38),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) =>
                                LoginUsernameAndPasswordScreen()));
                      },
                      child: UnconstrainedBox(
                          child: UnderlineText(
                              text: 'Login with User Id & Password'))),
                ]))));
  }
}
