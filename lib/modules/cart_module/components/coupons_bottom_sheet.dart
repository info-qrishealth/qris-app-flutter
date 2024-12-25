import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/modules/cart_module/components/coupon_applied_dialog.dart';
import 'package:qris_health/shared/components/common_bottom_sheet_template.dart';
import 'package:qris_health/shared/components/common_cross_icon.dart';
import 'package:qris_health/styles/app_colors.dart';

import 'coupon_list_tile.dart';

class CouponsBottomSheet extends StatefulWidget {
  const CouponsBottomSheet({super.key});

  @override
  State<CouponsBottomSheet> createState() => _CouponsBottomSheetState();
}

class _CouponsBottomSheetState extends State<CouponsBottomSheet> {
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return CommonBottomSheetTemplate(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      SizedBox(height: 24),
      Row(children: [
        Text('Coupons',
            style: _textTheme.headlineSmall!
                .copyWith(fontWeight: FontWeight.w700, color: AppColors.black)),
        Spacer(),
        CommonCrossIcon(),
      ]),
      SizedBox(height: 16),
      SizedBox(
          height: 35,
          child: Row(children: [
            Expanded(
                child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Enter coupon code',
                        hintStyle: _textTheme.bodySmall!.copyWith(
                            color: AppColors.lightSubTextColor,
                            fontWeight: FontWeight.w400),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide:
                                BorderSide(color: AppColors.borderColor)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide:
                                BorderSide(color: AppColors.borderColor)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide:
                                BorderSide(color: AppColors.borderColor))))),
            SizedBox(width: 8),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.5),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryPink,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6))),
                    child: Text('    Apply    ',
                        style: _textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600, color: Colors.white))))
          ])),
      SizedBox(height: 24),
      Expanded(
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CouponListTile(onTap: () async {
                  Navigator.of(context).pop();
                  await Future.delayed(Duration(milliseconds: 100));

                  showDialog(
                      context: context,
                      builder: (context) => CouponAppliedDialog());
                });
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 12);
              },
              itemCount: 10)),
      SizedBox(height: 16)
    ]));
  }
}
