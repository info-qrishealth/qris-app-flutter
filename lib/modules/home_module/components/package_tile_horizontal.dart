import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/screens/blood_test_detail_screen.dart';
import 'package:qris_health/shared/components/feature_row.dart';
import 'package:qris_health/shared/components/offered_price_container.dart';
import 'package:qris_health/styles/app_colors.dart';

class PackageTileHorizontal extends StatelessWidget {
  final Function()? onBookNowTap;
  PackageTileHorizontal({super.key, required this.onBookNowTap});
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => BloodTestDetailScreen()));
        },
        child: Container(
            width: 152,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Colors.black.withOpacity(0.09), width: 0.9)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                  OfferedPriceContainer(),
                  if (onBookNowTap != null)
                    Expanded(
                        child: InkWell(
                            onTap: onBookNowTap,
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
                                        fontWeight: FontWeight.w700)))))
                ])));
  }
}
