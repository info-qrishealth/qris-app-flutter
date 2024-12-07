import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_constants.dart';
import '../../styles/app_colors.dart';

class CommonFieldDropdown<T> extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final List<DropdownMenuItem<T>> items;
  final T? selectedValue;
  final Widget? suffixIcon;
  final void Function(T?)? onChanged;
  final bool? isExpanded;
  final double? menuWidth;
  final String? Function(T?)? validator;
  final String? headingText;

  const CommonFieldDropdown(
      {super.key,
      required this.labelText,
      this.hintText,
      required this.items,
      required this.selectedValue,
      this.suffixIcon,
      required this.onChanged,
      this.isExpanded,
      this.menuWidth,
      this.validator,
      required this.headingText});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      if (headingText != null)
        Text(' ${headingText!}',
            style: textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w400, color: AppColors.textColor)),
      if (headingText != null) SizedBox(height: 12),
      FormField<T>(
          validator: validator,
          builder: (_) {
            return InputDecorator(
                decoration: InputDecoration(
                    labelText: labelText,
                    contentPadding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 16, right: 16)),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton<T>(
                        menuWidth: menuWidth,
                        isExpanded: isExpanded ?? false,
                        borderRadius: BorderRadius.circular(16),
                        padding: EdgeInsets.zero,
                        underline: Container(),
                        style: textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w400, color: Colors.black),
                        hint: Text(hintText ?? 'Choose',
                            style: textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.45))),
                        items: items,
                        value: selectedValue,
                        onChanged: (value) {
                          if (onChanged != null) onChanged!(value);
                        },
                        icon: suffixIcon ??
                            const Icon(Icons.keyboard_arrow_down_outlined,
                                color: AppColors.lightGrey, size: 20))));
          }),
    ]);
  }
}
