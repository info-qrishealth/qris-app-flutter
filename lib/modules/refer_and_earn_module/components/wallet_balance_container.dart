import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WalletBalanceContainer extends StatelessWidget {
  final String title;
  final String value;
  final String svgPath;
  const WalletBalanceContainer(
      {super.key,
      required this.title,
      required this.value,
      required this.svgPath});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: ShapeDecoration(
            gradient: LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [Color(0xF4411E75), Color(0xFFB23C97)]),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(svgPath, color: Colors.white, height: 24),
              SizedBox(height: 12),
              Text(title,
                  style: textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w400, color: Colors.white)),
              SizedBox(height: 14),
              Text(value,
                  style: textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.w400, color: Colors.white))
            ]));
  }
}
