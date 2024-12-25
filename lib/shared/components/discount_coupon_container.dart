import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DiscountCouponContainer extends StatelessWidget {
  const DiscountCouponContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(color: Color(0xFF03B07A)),
        child: SafeArea(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset('assets/images/icons/coupon_icon.svg'),
          SizedBox(width: 8),
          Text.rich(
              TextSpan(
                  style: textTheme.bodyLarge!.copyWith(color: Colors.white),
                  children: [
                    TextSpan(
                        text: 'Get Flat ',
                        style: TextStyle(fontWeight: FontWeight.w400)),
                    TextSpan(
                        text: '20%',
                        style: TextStyle(fontWeight: FontWeight.w800)),
                    TextSpan(
                        text: ' off above ',
                        style: TextStyle(fontWeight: FontWeight.w400)),
                    TextSpan(
                        text: '₹849*',
                        style: TextStyle(fontWeight: FontWeight.w800)),
                    TextSpan(
                        text: ' | Use: ',
                        style: TextStyle(fontWeight: FontWeight.w400)),
                    TextSpan(
                        text: 'GET20',
                        style: TextStyle(fontWeight: FontWeight.w800))
                  ]),
              textAlign: TextAlign.center)
        ])));
  }
}
