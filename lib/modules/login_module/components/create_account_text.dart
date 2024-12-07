import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/modules/login_module/screens/register_screen.dart';

import '../../../styles/app_colors.dart';

class CreateAccountText extends StatelessWidget {
  final String? primaryText;
  final String? secondaryText;
  final Function()? onTap;
  const CreateAccountText(
      {super.key, this.primaryText, this.secondaryText, this.onTap});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return GestureDetector(
        onTap: onTap ??
            () {
              Navigator.of(context).push(
                  CupertinoPageRoute(builder: (context) => RegisterScreen()));
            },
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: SafeArea(
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text: primaryText ?? 'Don’t have an account? ',
                          style: textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.lightSubTextColor)),
                      TextSpan(
                          text: secondaryText ?? 'Create Account',
                          style: textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryBlue))
                    ])))));
  }
}
