import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/styles/app_colors.dart';

class CashbackContainer extends StatelessWidget {
  const CashbackContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Container(
        padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.09)),
            color: Color(0xffccffcc),
            borderRadius: BorderRadius.circular(8)),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text('Get 100% Cashback!',
              style: textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w700, color: AppColors.green)),
          SizedBox(height: 4),
          Text('Book and enjoy 100% cashback on every blood tests.',
              style: textTheme.labelSmall!.copyWith(
                  fontWeight: FontWeight.w300, color: AppColors.black))
        ]));
  }
}
