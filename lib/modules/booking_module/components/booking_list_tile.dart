import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/cart_module/components/patient_tile_layout.dart';
import 'package:qris_health/shared/components/billing_amount_row.dart';
import 'package:qris_health/shared/components/common_divider.dart';
import 'package:qris_health/shared/components/feature_row.dart';
import 'package:qris_health/styles/app_colors.dart';

class BookingListTile extends StatelessWidget {
  BookingListTile({super.key});
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    final isCancelled = Random().nextBool();

    return Container(
        decoration: BoxDecoration(
            color: isCancelled
                ? Color(0xffff726D).withOpacity(0.08)
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderColor)),
        child: ExpansionTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            minTileHeight: 55,
            tilePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            iconColor: AppColors.primaryBlue,
            childrenPadding: EdgeInsets.symmetric(horizontal: 10),
            title: Row(children: [
              _buildRichText(key: 'Order ID:', value: 'QRS12055'),
              if (isCancelled)
                Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text('(Cancelled)',
                        style: _textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w500, color: AppColors.red)))
            ]),
            subtitle: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: _buildRichText(
                    key: 'Order Date:',
                    value: '12-12-2024 (10:50:00pm)',
                    valueColor: AppColors.black)),
            children: [
              CommonDivider(),
              SizedBox(height: 10),
              Row(children: [
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                      Text('Transaction id',
                          style: _textTheme.labelSmall!
                              .copyWith(fontWeight: FontWeight.w300)),
                      SizedBox(height: 4),
                      Text('T2303151234319715267136',
                          style: _textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.lightText))
                    ])),
                SizedBox(
                    height: 35,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryBlue),
                        onPressed: () {},
                        child: Row(children: [
                          Icon(Icons.save_alt, color: Colors.white, size: 18),
                          SizedBox(width: 4),
                          Text('Invoice',
                              style: _textTheme.bodySmall!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white))
                        ])))
              ]),
              SizedBox(height: 5),
              CommonDivider(),
              SizedBox(height: 5),
              Row(children: [
                Text('Booking Details',
                    style: _textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontFamily: AppConstants.ubuntuFontFamily)),
              ]),
              SizedBox(height: 8),
              FeatureRow(
                  svgPath: 'assets/images/icons/drawer_icons/location_icon.svg',
                  title:
                      '321, GF, Rajdhani Enclave, Pitampura, Near Rani Bagh, Delhi-110034',
                  fontColor: AppColors.textColor),
              SizedBox(height: 6),
              FeatureRow(
                  svgPath: 'assets/images/icons/clock_icon.svg',
                  title: '06 Dec 2024 (7:00-8:00am)',
                  fontColor: AppColors.textColor),
              SizedBox(height: 18),
              _buildPatientLayout(),
              SizedBox(height: 16),
              _buildPatientLayout(),
              SizedBox(height: 12),
              CommonDivider(),
              SizedBox(height: 5),
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                Text('Billing Details',
                    style: _textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontFamily: AppConstants.ubuntuFontFamily)),
                SizedBox(height: 8),
                SummaryInfoRow(title: 'Base amount', value: '₹1099'),
                SizedBox(height: 4),
                SummaryInfoRow(title: 'Total amount ', value: '₹1099'),
                SizedBox(height: 4),
                Row(children: [
                  Expanded(
                      child: Text('Amount paid (UPI)',
                          style: _textTheme.bodySmall!
                              .copyWith(fontWeight: FontWeight.w700))),
                  Text('₹1198',
                      style: _textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryPink))
                ])
              ]),
              SizedBox(height: 12),
              CommonDivider(),
              SizedBox(height: 6),
              SizedBox(
                  height: 36,
                  child: Row(children: [
                    Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryBlue),
                            onPressed: () {},
                            child: Text('Request Cancellation',
                                style: _textTheme.bodySmall!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400)))),
                    SizedBox(width: 8),
                    Expanded(
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(color: AppColors.primaryBlue)),
                            onPressed: () {},
                            child: Text('Read cancellation policy',
                                style: _textTheme.bodySmall!.copyWith(
                                    color: AppColors.primaryBlue,
                                    fontWeight: FontWeight.w400))))
                  ])),
              SizedBox(height: 16),
            ]));
  }

  Widget _buildRichText(
      {required String key, required String value, Color? valueColor}) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: '$key  ',
          style: _textTheme.bodySmall!.copyWith(
              color: AppColors.textColor,
              fontWeight: FontWeight.w300,
              fontFamily: AppConstants.ubuntuFontFamily)),
      TextSpan(
          text: value,
          style: _textTheme.bodySmall!.copyWith(
              color: valueColor ?? AppColors.primaryBlue,
              fontWeight: FontWeight.w700)),
    ]));
  }

  Widget _buildPatientLayout() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      PatientTileLayout(actions: [
        SizedBox(
            height: 28,
            child: ElevatedButton(
                onPressed: () {},
                child: Row(children: [
                  Icon(Icons.save_alt, size: 18),
                  SizedBox(width: 4),
                  Text('Download',
                      style: _textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.white)),
                ]))),
      ]),
      SizedBox(height: 10),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(12)),
          child: Text('Full Body advance checkup, Lipid Profile',
              style: _textTheme.labelSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryBlue,
                  fontFamily: AppConstants.ubuntuFontFamily)))
    ]);
  }
}
