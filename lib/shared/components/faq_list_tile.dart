import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/modules/all_scans_module/models/faq/faq.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';
import 'package:qris_health/styles/app_colors.dart';

class FaqListTile extends StatefulWidget {
  final Faq? faq;
  const FaqListTile({super.key, this.faq});

  @override
  State<FaqListTile> createState() => _FaqListTileState();
}

class _FaqListTileState extends State<FaqListTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return ExpansionTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minTileHeight: 50,
        onExpansionChanged: (isExpanded) {
          _isExpanded = isExpanded;
          setState(() {});
        },
        tilePadding: EdgeInsets.symmetric(horizontal: 9),
        title: Text('${widget.faq?.question.clean}',
            style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500)),
        childrenPadding: EdgeInsets.symmetric(horizontal: 9),
        trailing: SvgPicture.asset(
            _isExpanded
                ? 'assets/images/icons/minus_icon.svg'
                : 'assets/images/icons/plus_icon.svg',
            color: AppColors.primaryPink,
            height: _isExpanded ? 20 : 24),
        children: [
          Text('${widget.faq?.answer.clean}',
              style: textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightSubTextColor)),
          SizedBox(height: 16),
        ]);
  }
}
