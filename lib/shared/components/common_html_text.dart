import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';

import '../../styles/app_colors.dart';

class CommonHtmlText extends StatelessWidget {
  final String text;
  final Style? pStyle;
  final Style? stringStyle;
  final Style? liStyle;
  const CommonHtmlText(
      {super.key,
      required this.text,
      this.pStyle,
      this.stringStyle,
      this.liStyle});

  @override
  Widget build(BuildContext context) {
    return Html(data: text.htmlString, style: {
      'p': pStyle ??
          Style(
              fontWeight: FontWeight.w400,
              color: AppColors.lightText,
              fontSize: FontSize.medium),
      'strong': stringStyle ??
          Style(
              color: AppColors.textColor,
              margin: Margins.only(bottom: 8, top: 8),
              display: Display.block),
      'li': liStyle ??
          Style(
              color: AppColors.lightText,
              fontWeight: FontWeight.w400,
              margin: Margins.symmetric(horizontal: 8, vertical: 5)),
    });
  }
}
