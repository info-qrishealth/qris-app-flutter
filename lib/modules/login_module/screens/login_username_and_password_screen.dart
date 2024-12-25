import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/home_module/screens/home_screen.dart';
import 'package:qris_health/modules/login_module/components/privacy_policy_text.dart';
import 'package:qris_health/shared/components/common_textfield.dart';
import 'package:qris_health/shared/components/underline_text.dart';
import 'package:qris_health/shared/components/welcome_header_column.dart';
import 'package:qris_health/shared/utils/search_pattern.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../components/create_account_text.dart';

class LoginUsernameAndPasswordScreen extends StatefulWidget {
  const LoginUsernameAndPasswordScreen({super.key});

  @override
  State<LoginUsernameAndPasswordScreen> createState() =>
      _LoginUsernameAndPasswordScreenState();
}

class _LoginUsernameAndPasswordScreenState
    extends State<LoginUsernameAndPasswordScreen> {
  final _userIdController = TextEditingController();
  final _passwordController = TextEditingController();
  final _textTheme = Get.textTheme;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: CreateAccountText()),
        body: SafeArea(
            child: ListView(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.scaffoldPadding),
                children: [
              SizedBox(height: 20),
              WelcomeHeaderColumn(),
              SizedBox(height: 50),
              Form(
                  key: _formKey,
                  child: Column(children: [
                    CommonTextField(
                        validator: (userId) {
                          if (userId == null || userId.isEmpty) {
                            return 'Please enter your userId';
                          }

                          return null;
                        },
                        autoFocus: true,
                        hintText: 'Enter your user id',
                        controller: _userIdController,
                        textInputType: TextInputType.text,
                        headingText: 'User ID'),
                    SizedBox(height: 20),
                    CommonTextField(
                        validator: (password) {
                          if (!SearchPattern.isValidPassword(password)) {
                            return 'Please enter valid password';
                          }

                          return null;
                        },
                        hintText: 'Enter your password',
                        controller: _passwordController,
                        textInputType: TextInputType.visiblePassword,
                        headingText: 'Password'),
                  ])),
              SizedBox(height: 18),
              ElevatedButton(
                  onPressed: () {
                    // todo:

                    if (_formKey.currentState?.validate() == true) {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => HomeScreen()));
                    }
                  },
                  child: Text('Login')),
              SizedBox(height: 20),
              PrivacyPolicyText(),
              SizedBox(height: 35),
              Text('-OR-',
                  style: _textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightSubTextColor),
                  textAlign: TextAlign.center),
              SizedBox(height: 35),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: UnconstrainedBox(
                      child: UnderlineText(text: 'Login with Mobile Number'))),
            ])));
  }
}
