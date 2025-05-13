import 'package:flutter/material.dart';
import 'package:qris_health/constants/enums/specialist_type.dart';
import 'package:qris_health/modules/doctor_consultation_module/models/doctor_category/doctor_category.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';
import 'package:qris_health/shared/utils/hex_color.dart';
import 'package:qris_health/styles/app_colors.dart';
import '../../../generated/assets.dart';
import '../../../shared/components/common_category_container.dart';

class SpecialistCategoryContainer extends StatelessWidget {
  final Function() onTap;
  final DoctorCategory doctorCategory;
  const SpecialistCategoryContainer(
      {super.key, required this.doctorCategory, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CommonCategoryContainer(
        onTap: onTap,
        backgroundColor: HexColor.hexToColor(doctorCategory.iconBg),
        assetImagePath: doctorCategory.icon ?? Assets.logosFullLogo,
        title: '${doctorCategory.title}');
  }
}
