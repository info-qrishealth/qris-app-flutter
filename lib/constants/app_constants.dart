import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles/app_colors.dart';
import '../styles/app_styles.dart';
import 'enums/snackbar_type.dart';

class AppConstants {
  static const String baseUrl = 'http://192.168.1.33:8080';
  static const ubuntuFontFamily = 'Ubuntu';
  static const latoFontFamily = 'Lato';
  static const metropolisFontFamily = 'Metropolis';
  static const scaffoldPadding = 20.0;
  static var bottomSheetConstraints =
      BoxConstraints(maxHeight: Get.height * 0.85);
  static const imageBaseUrl = 'https://qrishealth.com/cms/uploads';

  static String getErrorMessage(String message) {
    try {
      final decodedMessage = json.decode(message);

      if (decodedMessage.containsKey('error')) {
        final errorMessage = decodedMessage['error'];

        if (errorMessage == null) {
          return message;
        }

        return errorMessage;
      }

      return message;
    } catch (e) {
      return message;
    }
  }

  static void showSnackbar(
      {required String text,
      required SnackbarType type,
      int? secondsDuration,
      int? milliSecondDuration}) {
    Get.showSnackbar(GetSnackBar(
        messageText: Text('${type.name.capitalizeFirst!} - $text',
            style: Get.textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w600,
                color: type == SnackbarType.success
                    ? AppColors.green
                    : type == SnackbarType.warning
                        ? AppColors.gold
                        : AppColors.red)),
        // icon: SvgPicture.asset(type == SnackbarType.success
        //     ? 'assets/images/icons/snackbar_icons/success.svg'
        //     : type == SnackbarType.error
        //         ? 'assets/images/icons/snackbar_icons/error.svg'
        //         : 'assets/images/icons/snackbar_icons/warning.svg'),
        snackStyle: SnackStyle.FLOATING,
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
        animationDuration: const Duration(milliseconds: 200),
        backgroundColor: type == SnackbarType.success
            ? const Color(0xffDCFCE7)
            : type == SnackbarType.warning
                ? const Color(0xffFEF9C3)
                : const Color(0xffFFDFDE),
        boxShadows: AppStyles.darkCardShadow,
        borderRadius: 10,
        isDismissible: true,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(left: 28, right: 28, top: 16)));
  }

  static const List<String> stateList = [
    'ANDAMAN AND NICOBAR',
    'ANDHRA PRADESH',
    'ARUNACHAL PRADESH',
    'ASSAM',
    'BIHAR',
    'CHANDIGARH',
    'CHHATTISGARH',
    'DADRA AND NAGAR HAVELI',
    'DAMAN AND DIU',
    'DELHI',
    'GOA',
    'GUJARAT',
    'HARYANA',
    'HIMACHAL PRADESH',
    'JAMMU & KASHMIR',
    'JHARKHAND',
    'KARNATAKA',
    'KERALA',
    'LADAKH',
    'LAKSHADWEEP',
    'MADHYA PRADESH',
    'MAHARASHTRA',
    'MANIPUR',
    'MEGHALAYA',
    'MIZORAM',
    'NAGALAND',
    'ODISHA',
    'PUDUCHERRY',
    'PUNJAB',
    'RAJASTHAN',
    'SIKKIM',
    'TAMIL NADU',
    'TELANGANA',
    'TRIPURA',
    'UTTAR PRADESH',
    'UTTARAKHAND',
    'WEST BENGAL',
  ];

  static List<String> bpOptions = [
    '90-130 / 60-90 mmHg (Normal)',
    '130-140 / 90-100 mmHg',
    '140-150 / 100-110 mmHg',
    '150-160 / 110-120 mmHg',
    '>160 / >120 mmHg'
  ];

  static List<String> pulseOptions = [
    '60-80 beats/minute',
    '81-90 beats/minute',
    '91-100 beats/minute',
    '101-110 beats/minute',
    '>110 / < 60'
  ];

  static List<String> sleepOptions = [
    'Sleep well for 7-8 hours daily',
    'Snoring at Night',
    'Snoring & Frequent wake up in middle of sleep',
    'Choking, coughing & breathing difficulty during sleep',
    'Falling asleep during the day while working/driving etc.'
  ];

  static List<String> dietOptions = [
    'No fruit or vegetables each day',
    '1-2 servings of fruit or vegetables per day',
    '3-4 servings of fruit or vegetables per day',
    '5+ servings of fruit or vegetables per day',
  ];

  static List<String> waterOptions = [
    '8 or more glasses',
    '5-7 glasses',
    '3-5 glasses',
    'Fewer than 3 glasses',
  ];

  static List<String> alcoholOptions = [
    'I Don’t drink',
    '2-3 drinks',
    '4-5 drinks',
    '6 or more drinks',
  ];

  static List<String> cigarettesOptions = [
    'I Don’t smoke',
    '2-3 cigarettes',
    '4-5 cigarettes',
    '6 or more cigarettes',
  ];

  static List<String> exerciseOptions = [
    'No Exercise',
    'Less than 30 minutes a day',
    '30-45 minutes a day',
    '45 minutes to 1 hour a day',
    'More than 1 ½ hours per day',
  ];
}
