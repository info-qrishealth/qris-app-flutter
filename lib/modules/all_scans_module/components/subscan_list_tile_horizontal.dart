import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/enums/subscan_type.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';

import '../../../constants/app_constants.dart';
import '../../../shared/components/offered_price_container.dart';
import '../../../styles/app_colors.dart';

class SubscanListTileHorizontal extends StatelessWidget {
  final SubScanType subScanType;
  const SubscanListTileHorizontal({super.key, required this.subScanType});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return GestureDetector(
        onTap: () {},
        child: Container(
            width: 152,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Colors.black.withOpacity(0.09), width: 0.9)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(subScanType.formattedName,
                                style: textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppConstants.ubuntuFontFamily,
                                    color: AppColors.primaryBlue)),
                            SizedBox(height: 6),
                            Text(
                                'The CT Scan chest is commonly known as the thoracic CT or...'
                                    .getEllipticText(charactersAfterTrim: 50)!,
                                style: textTheme.labelSmall!.copyWith(
                                    color: AppColors.lightSubTextColor,
                                    fontWeight: FontWeight.w400))
                          ])),
                  OfferedPriceContainer(
                      customWidget: Text('Starts @ ₹1099',
                          style: textTheme.bodyLarge!.copyWith(
                              color: AppColors.primaryBlue,
                              fontWeight: FontWeight.w700))),
                  Expanded(
                      child: InkWell(
                          onTap: () {},
                          child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AppColors.primaryPink,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10))),
                              child: Text('Read More...',
                                  textAlign: TextAlign.center,
                                  style: textTheme.bodySmall!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700)))))
                ])));
    ;
  }
}
