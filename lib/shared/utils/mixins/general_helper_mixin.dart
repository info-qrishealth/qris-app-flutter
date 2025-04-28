import 'package:flutter/material.dart';
import 'package:qris_health/shared/models/bmi_info.dart';
import 'package:qris_health/styles/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/app_constants.dart';
import '../../../constants/enums/snackbar_type.dart';

mixin GeneralHelperMixin {
  List<int> getIntsFromString({required String? string}) {
    if (string == null || string.isEmpty) {
      return [];
    }

    if (string.endsWith(',')) {
      string = string.substring(0, string.length - 1);
    }

    return string.split(',').map((e) => int.parse(e)).toList();
  }

  Future<void> openDialPad({required String phoneNumber}) async {
    final url = 'tel:$phoneNumber';

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Couldn\'t launch url';
    }
  }

  BmiInfo getBmiInfo({required double bmi}) {
    if (bmi < 18.5) {
      return BmiInfo(text: 'Under Weight', color: Colors.orange);
    } else if (bmi > 18.5 && bmi < 24.9) {
      return BmiInfo(text: 'Normal Weight', color: AppColors.green);
    } else if (bmi > 24.9 && bmi < 29.9) {
      return BmiInfo(text: 'Overweight', color: Colors.orange);
    } else {
      return BmiInfo(text: 'Obesity', color: AppColors.red);
    }
  }

  Future<void> sendWhatsappMessage(
      {required String message, required String toNumber}) async {
    try {
      final whatsappBaseUrl = 'whatsapp://send?phone=91$toNumber&text=$message';

      await launchUrl(Uri.parse(whatsappBaseUrl));
    } catch (e) {
      final whatsappBaseUrl = '${'https://wa.me/$toNumber'}?text=';
      final url = whatsappBaseUrl + Uri.encodeComponent(message);

      if (await canLaunch(url)) {
        await launch(url);
      } else {
        return AppConstants.showSnackbar(
            text:
                'There is some problem in opening whatsapp. Please try again later or contact onelap support from onelap.in',
            type: SnackbarType.error);
      }
    }
  }
}
