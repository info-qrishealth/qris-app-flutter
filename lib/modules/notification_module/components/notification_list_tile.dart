import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/styles/app_colors.dart';

class NotificationListTile extends StatelessWidget {
  NotificationListTile({super.key});
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(14)),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppColors.primaryPink.withOpacity(0.2),
                  shape: BoxShape.circle),
              child: SvgPicture.asset(
                  'assets/images/icons/home_screen_icons/notification_icon.svg',
                  height: 19,
                  width: 19)),
          SizedBox(width: 12),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                Row(children: [
                  Expanded(
                      child: Text('Appointment Success',
                          style: _textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryBlue))),
                  Text('1h',
                      style: _textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightSubTextColor)),
                ]),
                SizedBox(height: 4),
                Text(
                    'You have successfully booked your appointment with Dr. Emily Walker.',
                    style: _textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightSubTextColor))
              ])),
        ]));
  }
}
