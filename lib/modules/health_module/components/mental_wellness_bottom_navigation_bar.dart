import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/components/discount_coupon_container.dart';
import '../../../shared/screens/questionaire_screen.dart';
import '../../../styles/app_colors.dart';

class MentalWellnessBottomNavigationBar extends StatelessWidget {
  const MentalWellnessBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      DiscountCouponContainer(),
      Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 14),
          decoration: BoxDecoration(color: AppColors.primaryBlue),
          child: IntrinsicHeight(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () {},
                        child: Text('Request Callback',
                            style: TextStyle(color: AppColors.primaryBlue)))),
                SizedBox(width: 8),
                Expanded(
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(35)),
                        child: Row(children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('₹ 2499 *',
                                    style: textTheme.titleMedium!.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primaryPink)),
                                SizedBox(height: 2),
                                Text('₹ 3999',
                                    style: textTheme.bodySmall!.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.primaryPink,
                                        decoration:
                                            TextDecoration.lineThrough)),
                              ]),
                          SizedBox(width: 4),
                          Expanded(
                              child: SizedBox(
                                  height: 45,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    QuestionnaireScreen()));
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppColors.primaryBlue),
                                      child:
                                          FittedBox(child: Text('Book Now')))))
                        ])))
              ])))
    ]));
  }
}
