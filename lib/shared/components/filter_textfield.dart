import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../styles/app_colors.dart';

class FilterTextField extends StatelessWidget {
  final Function(String)? onFieldSubmitted;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? hintText;
  final Widget? suffixIcon;
  final Function()? onTap;

  const FilterTextField(
      {super.key,
      required this.onFieldSubmitted,
      required this.controller,
      required this.onChanged,
      required this.hintText,
      required this.suffixIcon,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        controller: controller,
        cursorColor: AppColors.primaryPink,
        autofocus: false,
        onChanged: onChanged,
        onTap: onTap,
        style: textTheme.bodyLarge!.copyWith(color: AppColors.black),
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
            isCollapsed: true,
            hintText: hintText,
            prefixIconConstraints:
                const BoxConstraints(maxHeight: 24, maxWidth: 70),
            prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: SvgPicture.asset('assets/images/icons/search_icon.svg',
                    color: AppColors.lightSubTextColor)),
            suffixIconConstraints: const BoxConstraints(maxWidth: 55),
            suffixIcon: suffixIcon,
            hintStyle: textTheme.bodyLarge!.copyWith(
                color: AppColors.lightSubTextColor,
                fontWeight: FontWeight.w400)));
  }
}
