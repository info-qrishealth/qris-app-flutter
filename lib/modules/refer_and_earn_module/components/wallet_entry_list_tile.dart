import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../styles/app_colors.dart';

class WalletEntryListTile extends StatelessWidget {
  final String title;
  const WalletEntryListTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Row(children: [
      Container(
          padding: EdgeInsets.all(9),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: AppColors.primaryBlue),
          child: SvgPicture.asset('assets/images/icons/minus_icon.svg')),
      SizedBox(width: 9),
      Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(title,
            style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w400)),
        SizedBox(height: 5),
        Text('Aug 16, 2023 at 05:16 pm',
            style: textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w300,
                color: AppColors.lightSubTextColor))
      ])),
      Text('₹ 40',
          style: textTheme.bodyLarge!
              .copyWith(fontWeight: FontWeight.w600, color: AppColors.green))
    ]);
  }
}
