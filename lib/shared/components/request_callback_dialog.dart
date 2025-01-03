import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/styles/app_colors.dart';

class RequestCallbackDialog extends StatelessWidget {
  const RequestCallbackDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        insetPadding:
            EdgeInsets.symmetric(horizontal: AppConstants.scaffoldPadding),
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(
                  'You have requested a call back from a healthcare expert. Please confirm if you’d like to proceed.',
                  style: textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      height: 1.8,
                      color: AppColors.black),
                  textAlign: TextAlign.center),
              SizedBox(height: 24),
              SizedBox(
                  height: 40,
                  child: Row(children: [
                    Expanded(
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(color: AppColors.primaryBlue)),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel',
                                style: textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryBlue)))),
                    SizedBox(width: 8),
                    Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryBlue),
                            onPressed: () {},
                            child: Text('Confirm',
                                style: textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white))))
                  ]))
            ])));
  }
}
