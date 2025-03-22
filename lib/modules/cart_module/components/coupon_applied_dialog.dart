import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/generated/assets.dart';
import 'package:qris_health/modules/orders_modele/models/coupon/coupon.dart';
import 'package:qris_health/styles/app_colors.dart';

class CouponAppliedDialog extends StatefulWidget {
  final Coupon appliedCoupon;
  const CouponAppliedDialog({super.key, required this.appliedCoupon});

  @override
  State<CouponAppliedDialog> createState() => _CouponAppliedDialogState();
}

class _CouponAppliedDialogState extends State<CouponAppliedDialog> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Stack(alignment: Alignment.center, children: [
      Dialog(
          insetPadding:
              EdgeInsets.symmetric(horizontal: AppConstants.scaffoldPadding),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(Assets.iconsPartyPopper, height: 100),
                    SizedBox(height: 16),
                    Text('Yay!',
                        style: textTheme.headlineSmall!
                            .copyWith(fontWeight: FontWeight.w800)),
                    SizedBox(height: 12),
                    Text(
                        '${widget.appliedCoupon.couponCode} Applied Successfully!',
                        style: textTheme.titleLarge!.copyWith(
                            color: AppColors.green,
                            fontWeight: FontWeight.w400))
                  ]))),
      Lottie.asset(Assets.jsonsConfetti),
    ]);
  }
}
