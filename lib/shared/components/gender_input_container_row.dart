import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/enums/gender.dart';

import '../../styles/app_colors.dart';

class GenderInputContainerRow extends StatefulWidget {
  final Function(Gender) onTap;
  final Gender? selectedGender;
  final bool isRequired;

  const GenderInputContainerRow(
      {super.key,
      required this.onTap,
      this.isRequired = false,
      required this.selectedGender});

  @override
  State<GenderInputContainerRow> createState() =>
      _GenderInputContainerRowState();
}

class _GenderInputContainerRowState extends State<GenderInputContainerRow> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      RichText(
          text: TextSpan(
              style: textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w400, color: AppColors.textColor),
              children: [
            TextSpan(text: ' Gender'),
            if (widget.isRequired)
              TextSpan(text: ' *', style: TextStyle(color: AppColors.red)),
          ])),
      SizedBox(height: 12),
      Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: Gender.values
                  .map((gender) => _buildSexContainer(gender: gender))
                  .toList())),
    ]);
  }

  Widget _buildSexContainer({required Gender gender}) {
    final isSelected = widget.selectedGender == gender;

    return GestureDetector(
        onTap: () {
          widget.onTap(gender);
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 26, vertical: 12),
            decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primaryBlue.withOpacity(0.1)
                    : Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                    width: 0.6,
                    color: isSelected
                        ? AppColors.primaryBlue
                        : AppColors.borderColor)),
            child: SvgPicture.asset(gender.imagePath)));
  }
}
