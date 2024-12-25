import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/shared/components/feature_row.dart';
import 'package:qris_health/shared/components/offered_price_container.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../screens/blood_test_detail_screen.dart';

class PackageListTile extends StatelessWidget {
  final String? description;
  final Function()? onSeeDetailsTap;
  final Function()? onBookNowTap;
  final Widget? actions;

  PackageListTile(
      {super.key,
      this.description,
      required this.onSeeDetailsTap,
      required this.onBookNowTap,
      this.actions});
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black.withOpacity(0.09))),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 9, vertical: 9),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Full Body advance checkup',
                        style: _textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryBlue,
                            fontFamily: AppConstants.ubuntuFontFamily)),
                    SizedBox(height: 4),
                    FeatureRow(
                        imagePath: 'assets/images/icons/test_tube.png',
                        title: '87 Parameters'),
                    if (description != null)
                      Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(description!,
                              style: _textTheme.labelSmall!.copyWith(
                                  fontWeight: FontWeight.w400, fontSize: 10))),
                  ])),
          SizedBox(height: 2),
          OfferedPriceContainer(
              padding: EdgeInsets.symmetric(vertical: 7, horizontal: 9)),
          IntrinsicHeight(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                if (onSeeDetailsTap != null)
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(CupertinoPageRoute(
                                builder: (context) => BloodTestDetailScreen()));
                          },
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: onBookNowTap == null
                                          ? Radius.circular(10)
                                          : Radius.zero,
                                      bottomLeft: Radius.circular(10)),
                                  color:
                                      AppColors.primaryPink.withOpacity(0.14)),
                              child: Text('See Details',
                                  textAlign: TextAlign.center,
                                  style: _textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.lightSubTextColor))))),
                if (onBookNowTap != null)
                  Expanded(
                      child: InkWell(
                          onTap: () {},
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AppColors.primaryPink,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: onSeeDetailsTap == null
                                          ? Radius.circular(10)
                                          : Radius.zero,
                                      bottomRight: Radius.circular(10))),
                              child: Text('Book Now',
                                  style: _textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                  textAlign: TextAlign.center))))
              ]))
        ]));
  }
}
