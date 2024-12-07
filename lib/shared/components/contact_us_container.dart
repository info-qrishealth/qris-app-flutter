import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/styles/app_colors.dart';

class ContactUsContainer extends StatelessWidget {
  ContactUsContainer({super.key});
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 4, right: 4, top: 4),
        decoration: BoxDecoration(
            color: AppColors.green.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12)),
        child: Row(children: [
          Image.asset('assets/images/illustrations/doctor_illustration.png',
              height: 98),
          SizedBox(width: 14),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text("Need Help? Let's Chat!",
                    style: _textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontFamily: AppConstants.ubuntuFontFamily)),
                SizedBox(height: 1),
                Text('Our Health Experts are here to help you',
                    style: _textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor)),
                SizedBox(height: 12),
                Row(children: [
                  _buildButton(
                      title: 'Call Now',
                      onTap: () {},
                      svgPath: 'assets/images/icons/call_icon.svg'),
                  SizedBox(width: 6),
                  _buildButton(
                      title: 'Chat with us',
                      onTap: () {},
                      svgPath: 'assets/images/icons/whatsapp_icon.svg'),
                ])
              ]))
        ]));
  }

  Widget _buildButton(
      {required String title,
      required Function() onTap,
      required String svgPath}) {
    return SizedBox(
        height: 24,
        child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.green),
            child: Row(children: [
              SvgPicture.asset(svgPath, height: 16),
              SizedBox(width: 4),
              Text(title,
                  style: _textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w700, color: Colors.white))
            ])));
  }
}
