import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/styles/app_colors.dart';

class CouponListTile extends StatelessWidget {
  final Function() onTap;
  CouponListTile({super.key, required this.onTap});
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Row(children: [
        Stack(alignment: Alignment.center, children: [
          SvgPicture.asset('assets/images/icons/coupon_image.svg'),
          Text('QRIS24',
              style: _textTheme.bodyMedium!
                  .copyWith(fontWeight: FontWeight.w700, color: Colors.white))
        ]),
        Spacer(),
        SizedBox(
            height: 32,
            child: OutlinedButton(
                onPressed: onTap,
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6))),
                child: Text('Apply',
                    style: _textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryPink))))
      ]),
      SizedBox(height: 12),
      Text('Get Rs.999 Off by applying this coupon',
          style: _textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w400, color: AppColors.textColor))
    ]);
  }
}
