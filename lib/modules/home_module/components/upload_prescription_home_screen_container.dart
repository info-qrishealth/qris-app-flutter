import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/enums/prescription_type.dart';
import 'package:qris_health/modules/home_module/screens/upload_prescription_screen.dart';

import '../../../generated/assets.dart';
import '../../../styles/app_colors.dart';

class UploadPrescriptionHomeScreenContainer extends StatefulWidget {
  const UploadPrescriptionHomeScreenContainer({super.key});

  @override
  State<UploadPrescriptionHomeScreenContainer> createState() =>
      _UploadPrescriptionHomeScreenContainerState();
}

class _UploadPrescriptionHomeScreenContainerState
    extends State<UploadPrescriptionHomeScreenContainer> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(12)),
        child: Row(children: [
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(
                  'Not sure what to book?',
                  style: textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                Text('Upload a prescription for tests and scans!',
                    style: textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightSubTextColor))
              ])),
          SizedBox(
              height: 30,
              child: ElevatedButton(
                  onPressed: () async {
                    await Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => UploadPrescriptionScreen(
                            type: PrescriptionType.normal)));
                  },
                  child: Row(children: [
                    Text('Upload',
                        style: textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600, color: Colors.white)),
                    SizedBox(width: 4),
                    SvgPicture.asset(Assets.iconsUploadIcon)
                  ])))
        ]));
  }
}
