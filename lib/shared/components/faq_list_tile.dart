import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/styles/app_colors.dart';

class FaqListTile extends StatefulWidget {
  final String question;
  final String answer;
  const FaqListTile({super.key, required this.question, required this.answer});

  @override
  State<FaqListTile> createState() => _FaqListTileState();
}

class _FaqListTileState extends State<FaqListTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return ExpansionTile(
        minTileHeight: 50,
        onExpansionChanged: (isExpanded) {
          _isExpanded = isExpanded;
          setState(() {});
        },
        tilePadding: EdgeInsets.symmetric(horizontal: 9),
        title: Text(widget.question,
            style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500)),
        childrenPadding: EdgeInsets.symmetric(horizontal: 9),
        trailing: SvgPicture.asset(
            _isExpanded
                ? 'assets/images/icons/minus_icon.svg'
                : 'assets/images/icons/plus_icon.svg',
            color: AppColors.primaryPink,
            height: _isExpanded ? 20 : 24),
        children: [
          Text(widget.answer,
              style: textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightSubTextColor)),
          SizedBox(height: 16),
        ]);
  }
}
