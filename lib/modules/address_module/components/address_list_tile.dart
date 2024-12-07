import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../styles/app_colors.dart';

class AddressListTile extends StatelessWidget {
  const AddressListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.09)),
            borderRadius: BorderRadius.circular(12)),
        child: IntrinsicHeight(
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Align(
              alignment: Alignment.topCenter,
              child: SvgPicture.asset('assets/images/icons/location_icon.svg',
                  height: 22)),
          SizedBox(width: 8),
          Expanded(
              child: Text(
                  '321, GF, Rajdhani Enclave, Pitampura, Near Rani Bagh, Delhi-110034',
                  style: textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor))),
          VerticalDivider(
              color: Colors.black.withOpacity(0.09), thickness: 1.5),
          SizedBox(width: 4),
          SvgPicture.asset('assets/images/icons/delete_icon.svg')
        ])));
  }
}
