import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/enums/scan_type.dart';
import 'package:qris_health/constants/enums/subscan_type.dart';
import 'package:qris_health/modules/all_scans_module/screens/subscan_info_screen.dart';
import 'package:qris_health/shared/components/common_bottom_sheet_template.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';
import 'package:qris_health/styles/app_colors.dart';

class SubScanBottomSheet extends StatefulWidget {
  final ScanType scanType;
  const SubScanBottomSheet({super.key, required this.scanType});

  @override
  State<SubScanBottomSheet> createState() => _SubScanBottomSheetState();
}

class _SubScanBottomSheetState extends State<SubScanBottomSheet> {
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return CommonBottomSheetTemplate(
        isExtendedWidget: false,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 32),
              Text(widget.scanType.formattedName,
                  style: _textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.w700, color: AppColors.black)),
              SizedBox(height: 16),
              Wrap(
                  spacing: 8,
                  runSpacing: 10,
                  children: widget.scanType.subScans
                      .map((subscan) => InkWell(
                            onTap: () async {
                              await Navigator.of(context).push(
                                  CupertinoPageRoute(
                                      builder: (context) => SubscanInfoScreen(
                                          subScanType: subscan)));
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        color: AppColors.borderColor)),
                                child: Text(subscan.formattedName,
                                    style: _textTheme.titleMedium!.copyWith(
                                        fontWeight: FontWeight.w400))),
                          ))
                      .toList()),
              SizedBox(height: 24),
            ]));
  }
}
