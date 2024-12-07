import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/shared/components/feature_row.dart';
import 'package:qris_health/styles/app_colors.dart';

class PackageTile extends StatelessWidget {
  PackageTile({super.key});
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 152,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border:
                Border.all(color: Colors.black.withOpacity(0.09), width: 0.9)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  child: Column(children: [
                    Text('Full Body Advance Checkup',
                        style: _textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontFamily: AppConstants.ubuntuFontFamily,
                            color: AppColors.primaryBlue)),
                    SizedBox(height: 6),
                    FeatureRow(
                        imagePath: 'assets/images/icons/test_tube.png',
                        title: '87 Parameters'),
                    SizedBox(height: 2),
                    FeatureRow(
                        imagePath: 'assets/images/icons/home.png',
                        title: 'Home collection'),
                  ])),
              Container(
                  decoration: BoxDecoration(
                      color: AppColors.primaryPink.withOpacity(0.06)),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 8),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: '₹ 1999',
                            style: _textTheme.labelSmall!.copyWith(
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.lineThrough,
                                fontSize: 9,
                                color: AppColors.primaryPink)),
                        WidgetSpan(child: SizedBox(width: 7)),
                        TextSpan(
                            text: '₹1099',
                            style: _textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryBlue)),
                      ])))),
              Expanded(
                  child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.primaryPink,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                      child: Text('Book Now',
                          textAlign: TextAlign.center,
                          style: _textTheme.bodySmall!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700))))
            ]));
  }
}
