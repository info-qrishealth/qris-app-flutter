import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/generated/assets.dart';

class PrescriptionUploadSuccessDialog extends StatelessWidget {
  const PrescriptionUploadSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Dialog(
        insetPadding: EdgeInsets.all(AppConstants.scaffoldPadding),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            SvgPicture.asset(Assets.illustrationsPrescriptionIllustration),
            SizedBox(height: 14),
            Text('Prescription uploaded!',
                style: textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.w800)),
            SizedBox(height: 8),
            Text(
                'Our healthcare expert will call you shortly to discuss your prescription and needs.',
                style:
                    textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w400),
                textAlign: TextAlign.center)
          ]),
        ));
  }
}
