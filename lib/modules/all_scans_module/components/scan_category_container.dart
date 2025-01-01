import 'package:flutter/material.dart';
import 'package:qris_health/constants/enums/scan_type.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';

import '../../../shared/components/common_category_container.dart';

class ScanCategoryContainer extends StatelessWidget {
  final ScanType scanType;
  const ScanCategoryContainer({super.key, required this.scanType});

  @override
  Widget build(BuildContext context) {
    return CommonCategoryContainer(
        onTap: () {},
        backgroundColor: scanType.backgroundColor,
        imagePath: scanType.iconPath,
        title: scanType.name.formattedEnumName!);
  }
}
