import 'package:flutter/material.dart';
import 'package:qris_health/constants/enums/specialist_type.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';
import '../../../shared/components/common_category_container.dart';

class SpecialistCategoryContainer extends StatelessWidget {
  final SpecialistType specialistType;
  const SpecialistCategoryContainer({super.key, required this.specialistType});

  @override
  Widget build(BuildContext context) {
    return CommonCategoryContainer(
        onTap: () async {},
        backgroundColor: specialistType.backgroundColor,
        assetImagePath: specialistType.imagePath,
        title: specialistType.name.formattedEnumName!);
  }
}
