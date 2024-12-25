import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/styles/app_colors.dart';

class CouponAppliedDialog extends StatelessWidget {
  const CouponAppliedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Dialog(
        insetPadding:
            EdgeInsets.symmetric(horizontal: AppConstants.scaffoldPadding),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/icons/party_popper.png',
                      height: 100),
                  SizedBox(height: 16),
                  Text('Yay!!',
                      style: textTheme.headlineSmall!
                          .copyWith(fontWeight: FontWeight.w800)),
                  SizedBox(height: 12),
                  Text('Coupon Applied.',
                      style: textTheme.titleLarge!
                          .copyWith(fontWeight: FontWeight.w400)),
                  SizedBox(height: 10),
                  Text('You saved ₹1099!',
                      style: textTheme.titleLarge!.copyWith(
                          color: AppColors.green, fontWeight: FontWeight.w400))
                ])));
  }
}
