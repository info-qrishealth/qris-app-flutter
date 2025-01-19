import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';
import 'package:qris_health/modules/login_module/components/privacy_policy_text.dart';
import 'package:qris_health/modules/login_module/models/user/user.dart';
import 'package:qris_health/modules/login_module/services/otp_service.dart';
import 'package:qris_health/modules/users_module/services/user_service.dart';
import 'package:qris_health/shared/components/welcome_header_column.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../components/create_account_text.dart';
import '../models/otp/otp.dart';

class OtpScreen extends StatefulWidget {
  final User? userToAdd;
  final Otp otp;
  const OtpScreen({super.key, required this.userToAdd, required this.otp});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _textTheme = Get.textTheme;
  final _otpController = TextEditingController();
  int _seconds = 59;
  late Otp _otp;

  @override
  void initState() {
    super.initState();
    _otp = widget.otp;

    Timer.periodic(const Duration(seconds: 1), (_) {
      if (_seconds > 0) {
        _seconds--;
        if (mounted) setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: CreateAccountText()),
        body: SafeArea(
            child: ListView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.scaffoldPadding),
                children: [
              SizedBox(height: 20),
              WelcomeHeaderColumn(),
              SizedBox(height: 48),
              Text('Verify your mobile number',
                  style: _textTheme.titleMedium!.copyWith(
                      color: AppColors.lightSubTextColor,
                      fontWeight: FontWeight.w700)),
              SizedBox(height: 8),
              Row(children: [
                Text('OTP sent on +91 ${_otp.phoneNumber}',
                    style: _textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightText)),
              ]),
              SizedBox(height: 28),
              PinCodeTextField(
                  autoDisposeControllers: false,
                  backgroundColor: Colors.white,
                  enablePinAutofill: true,
                  separatorBuilder: (context, _) {
                    return const SizedBox(width: 12);
                  },
                  autoFocus: true,
                  hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: _otpController,
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 20),
                  hintCharacter: '',
                  pinTheme: PinTheme.defaults(
                      disabledBorderWidth: 1,
                      inactiveBorderWidth: 1,
                      selectedBorderWidth: 1,
                      activeBorderWidth: 1,
                      fieldHeight: Get.width / 5,
                      fieldWidth: Get.width / 5.2,
                      selectedColor: AppColors.primaryBlue,
                      activeColor: AppColors.primaryBlue,
                      inactiveColor: Colors.black.withOpacity(0.09),
                      shape: PinCodeFieldShape.circle),
                  cursorColor: AppColors.primaryBlue,
                  mainAxisAlignment: MainAxisAlignment.start,
                  keyboardType: TextInputType.number,
                  appContext: context,
                  length: 4,
                  onChanged: (otp) async {
                    setState(() {});
                  }),
              SizedBox(height: 21),
              ElevatedButton(
                  onPressed: _otpController.text.length == 4 ? _login : null,
                  child: Text('Login')),
              SizedBox(height: 21),
              PrivacyPolicyText(),
              SizedBox(height: 40),
              GestureDetector(
                  onTap: _seconds == 0
                      ? () {
                          setState(() {
                            _seconds = 59;
                          });
                        }
                      : null,
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Didn't get an otp? ",
                            style: _textTheme.bodyLarge!
                                .copyWith(fontWeight: FontWeight.w400)),
                        WidgetSpan(
                            child: GestureDetector(
                                onTap: _resendOtp,
                                child: Text("Resend SMS",
                                    style: _textTheme.bodyLarge!.copyWith(
                                        color: _seconds > 0
                                            ? AppColors.lightSubTextColor
                                            : AppColors.primaryPink,
                                        fontWeight: FontWeight.w600)))),
                      ]))),
              const SizedBox(height: 15),
              if (_seconds > 0)
                Text('$_seconds seconds',
                    style: _textTheme.titleMedium!.copyWith(
                        color: AppColors.red, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center),
            ])));
  }

  Future<void> _resendOtp() async {
    try {
      _otp = await OtpService.sendOtp(phoneNumber: _otp.phoneNumber!);
    } catch (e) {
      AppConstants.showSnackbar(text: e.toString(), type: SnackbarType.error);
    }
  }

  Future<void> _login() async {
    try {
      _otp = _otp.copyWith.call(token: int.tryParse(_otpController.text));
      await OtpService.verifyOtp(otp: _otp);

      if (widget.userToAdd != null) {
        final createdUser =
            await UserService.createUser(user: widget.userToAdd!);

        print(createdUser);
      } else {}

      // Navigator.of(context).pushAndRemoveUntil(
      //     CupertinoPageRoute(builder: (context) => HomeScreen()), (_) => false);
    } catch (e) {
      AppConstants.showSnackbar(text: e.toString(), type: SnackbarType.error);
    }
  }
}
