import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/enums/environment.dart';

import '../styles/app_colors.dart';
import '../styles/app_styles.dart';
import 'enums/snackbar_type.dart';

class AppConstants {
  static const Environment environment = Environment.dev;

  static const String baseUrl = environment == Environment.prod
      ? 'http://srv740952.hstgr.cloud:8080'
      // ? 'http://192.168.1.4:8080'
      : 'http://192.168.214.197:8080';

  static const razorpayKey = environment == Environment.prod
      ? 'rzp_live_cM3qnAbKhHGQQ5'
      : 'rzp_test_Jz4MxRXoB0bQx7';
      // : 'rzp_test_Jz4MxRXoB0bQx7';

  static const ubuntuFontFamily = 'Ubuntu';
  static const latoFontFamily = 'Lato';
  static const metropolisFontFamily = 'Metropolis';
  static const scaffoldPadding = 20.0;
  static var bottomSheetConstraints =
      BoxConstraints(maxHeight: Get.height * 0.85);
  static const imageBaseUrl = 'https://qrishealth.com/cms/uploads';
  static const invoiceUrl = 'https://qrishealth.com/payment/invoice';
  static const reportUrl = 'https://qrishealth.com/mylab/report_file';
  static const supportNumber = '9289589692';
  static const privacyPolicyUrl =
      'https://qrishealth.com/privacy-and-policy.php';
  static const termsAndConditionsUrl =
      'https://qrishealth.com/terms-and-conditions.php';
  static const playStoreLink =
      'https://play.google.com/store/apps/details?id=com.qris.app&hl=en';
  static const appStoreLink =
      'https://apps.apple.com/in/app/qris-health-full-body-checkup/id6746754385';

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

  static Map<String, dynamic>? decodeBase64({required String? encodedString}) {
    try {
      if (encodedString == null || encodedString.isEmpty) {
        return null;
      }

      String decodedStr = utf8.decode(base64.decode(encodedString));
      return json.decode(decodedStr);
    } on FormatException catch (e) {
      return null;
    } catch (e) {
      return null;
    }
  }

  static String encodeStringToBase64(String text) {
    return base64.encode(utf8.encode(text));
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
}
