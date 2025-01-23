import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/modules/address_module/models/address/address.dart';

import '../../../styles/app_colors.dart';

class AddressListTile extends StatelessWidget {
  final Address? address;
  final Function() onDeleteTap;
  const AddressListTile(
      {super.key, required this.address, required this.onDeleteTap});

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
                  '${address?.house}, ${address?.address1} ${address?.address2 != null && address!.address2!.isNotEmpty ? ', ${address?.address2}' : ''} ${address?.landmark != null && address!.landmark!.isNotEmpty ? ', ${address?.landmark}' : ''} ${address?.pincode != null && address!.pincode!.isNotEmpty ? ', ${address?.pincode}' : ''}, ${address?.state ?? ''}',
                  style: textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor))),
          VerticalDivider(
              color: Colors.black.withOpacity(0.09), thickness: 1.5),
          SizedBox(width: 4),
          InkWell(
              onTap: onDeleteTap,
              child: SvgPicture.asset('assets/images/icons/delete_icon.svg')),
        ])));
  }
}
