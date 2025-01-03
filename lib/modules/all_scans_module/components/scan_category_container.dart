import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qris_health/constants/enums/scan_type.dart';
import 'package:qris_health/modules/all_scans_module/components/subscan_bottom_sheet.dart';
import 'package:qris_health/modules/all_scans_module/screens/subscan_info_screen.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';

import '../../../shared/components/common_category_container.dart';

class ScanCategoryContainer extends StatelessWidget {
  final ScanType scanType;
  const ScanCategoryContainer({super.key, required this.scanType});

  @override
  Widget build(BuildContext context) {
    return CommonCategoryContainer(
        onTap: () async {
          final subScans = scanType.subScans;

          if (subScans.length == 1) {
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) =>
                    SubscanInfoScreen(subScanType: subScans.first)));
          } else {
            await showModalBottomSheet(
                context: context,
                builder: (context) => SubScanBottomSheet(scanType: scanType));
          }
        },
        backgroundColor: scanType.backgroundColor,
        imagePath: scanType.iconPath,
        title: scanType.name.formattedEnumName!);
  }
}
