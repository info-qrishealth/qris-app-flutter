import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../styles/app_colors.dart';

class CommonTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final bool? autoFocus;
  final Widget? suffix;
  final Widget? prefix;
  final int? minLines;
  final int? maxLines;
  final String? headingText;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final EdgeInsets? contentPadding;
  final Function()? onTap;
  final bool? readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isRequired;

  const CommonTextField(
      {super.key,
      required this.controller,
      this.labelText,
      this.hintText,
      this.autoFocus,
      this.suffix,
      required this.textInputType,
      this.validator,
      this.onChanged,
      this.textInputAction,
      this.maxLength,
      this.contentPadding,
      this.onTap,
      this.readOnly,
      this.prefix,
      this.minLines,
      this.maxLines,
      this.prefixIcon,
      this.suffixIcon,
      required this.headingText,
      this.isRequired = false});

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  late bool _obsecureText;

  @override
  void initState() {
    super.initState();
    _obsecureText = widget.textInputType == TextInputType.visiblePassword;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      if (widget.headingText != null)
        RichText(
            text: TextSpan(
                style: textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w400, color: AppColors.textColor),
                children: [
              TextSpan(text: ' ${widget.headingText!}'),
              if (widget.isRequired)
                TextSpan(text: ' *', style: TextStyle(color: AppColors.red)),
            ])),
      if (widget.headingText != null) SizedBox(height: 12),
      TextFormField(
          readOnly: widget.readOnly ?? false,
          onTap: widget.onTap,
          autofocus: widget.autoFocus ?? false,
          controller: widget.controller,
          keyboardType: widget.textInputType,
          validator: widget.validator,
          minLines: widget.minLines ?? 1,
          maxLines: widget.maxLines ?? 1,
          onChanged: widget.onChanged,
          style: Get.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
          inputFormatters: [
            if (widget.textInputType == TextInputType.phone ||
                widget.textInputType == TextInputType.number)
              FilteringTextInputFormatter.digitsOnly
          ],
          maxLength: widget.textInputType == TextInputType.phone
              ? 10
              : widget.maxLength,
          textInputAction: widget.textInputAction,
          obscureText: _obsecureText,
          decoration: InputDecoration(
              prefix: widget.prefix,
              prefixIconConstraints: const BoxConstraints(
                  maxHeight: 25, minWidth: 40, maxWidth: 50),
              suffix: widget.suffix,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.textInputType == TextInputType.visiblePassword
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _obsecureText = !_obsecureText;
                        });
                      },
                      child: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Image.asset(
                              _obsecureText
                                  ? 'assets/images/icons/unhide.png'
                                  : 'assets/images/icons/hide.png',
                              height: _obsecureText ? 16 : 20)))
                  : widget.suffixIcon,
              suffixIconConstraints: const BoxConstraints(
                  maxHeight: 25, minWidth: 40, maxWidth: 50),
              counterText: '',
              contentPadding: widget.contentPadding ??
                  const EdgeInsets.only(
                      top: 20, bottom: 20, left: 16, right: 16),
              isCollapsed: true,
              labelText: widget.labelText,
              hintText: widget.hintText)),
    ]);
  }
}
