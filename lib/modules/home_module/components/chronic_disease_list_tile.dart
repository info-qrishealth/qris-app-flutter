import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/generated/assets.dart';
import 'package:qris_health/modules/home_module/enum/chronic_disease_item_type.dart';
import 'package:qris_health/modules/home_module/models/chronic_package_model/chronic_disease_package.dart';
import 'package:qris_health/shared/components/bordered_container.dart';
import 'package:qris_health/styles/app_colors.dart';

class ChronicDiseaseListTile extends StatelessWidget {
  final ChronicDiseasePackage chronicDiseasePackage;
  const ChronicDiseaseListTile(
      {super.key, required this.chronicDiseasePackage});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return BorderedContainer(
        child: Column(children: [
      Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Text(chronicDiseasePackage.title,
                style: textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.primaryBlue)),
            SizedBox(height: 12),
            Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: AppColors.primaryPink.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                chronicDiseasePackage.idealFor != null
                                    ? 'Ideal for'
                                    : 'Why',
                                style: textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryPink)),
                            SizedBox(width: 16),
                            Expanded(
                                child: Text(
                                    chronicDiseasePackage.idealFor ??
                                        chronicDiseasePackage.why!,
                                    style: textTheme.bodyMedium!.copyWith(
                                        fontWeight: FontWeight.w400))),
                          ]),
                      SizedBox(height: 12),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Includes',
                                style: textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryPink)),
                            SizedBox(width: 16),
                            Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                  _buildSmallHeadingText(
                                      title: _getItem(
                                                  type: ChronicPackageItemType
                                                      .blood_test) !=
                                              null
                                          ? 'Blood Tests'
                                          : 'Tests',
                                      svgPath: Assets.iconsInjectionIcon),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Text(
                                          _getItem(
                                                  type: ChronicPackageItemType
                                                      .blood_test)!
                                              .details!,
                                          style: textTheme.bodyMedium!.copyWith(
                                              fontWeight: FontWeight.w400))),
                                  if (_getItem(
                                          type: ChronicPackageItemType.xray) !=
                                      null)
                                    Padding(
                                        padding: const EdgeInsets.only(top: 6),
                                        child: _buildSmallHeadingText(
                                            title: _getItem(
                                                    type: ChronicPackageItemType
                                                        .xray)!
                                                .title,
                                            svgPath: Assets.iconsReportIcon)),
                                  if (_getItem(
                                          type: ChronicPackageItemType
                                              .consultation) !=
                                      null)
                                    Padding(
                                        padding: const EdgeInsets.only(top: 6),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              _buildSmallHeadingText(
                                                  title: _getItem(
                                                          type:
                                                              ChronicPackageItemType
                                                                  .consultation)!
                                                      .title,
                                                  svgPath: Assets
                                                      .iconsConsultationIcon),
                                              SizedBox(height: 4),
                                              Text(
                                                  _getItem(
                                                          type:
                                                              ChronicPackageItemType
                                                                  .consultation)!
                                                      .details!,
                                                  style: textTheme.bodyMedium!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w400))
                                            ])),
                                  if (_getItem(
                                          type: ChronicPackageItemType.addon) !=
                                      null)
                                    Padding(
                                        padding: const EdgeInsets.only(top: 6),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              _buildSmallHeadingText(
                                                  title: _getItem(
                                                          type:
                                                              ChronicPackageItemType
                                                                  .addon)!
                                                      .title,
                                                  svgPath:
                                                      Assets.iconsAddOnIcon),
                                              SizedBox(height: 4),
                                              Text(
                                                  _getItem(
                                                          type:
                                                              ChronicPackageItemType
                                                                  .addon)!
                                                      .details!,
                                                  style: textTheme.bodyMedium!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w400))
                                            ])),
                                ]))
                          ]),
                    ])),
          ])),
      _buildPriceContainer(),
    ]));
  }

  Widget _buildSmallHeadingText(
      {required String title, required String svgPath}) {
    final textTheme = Get.textTheme;

    return Row(children: [
      SvgPicture.asset(svgPath, height: 14, width: 14),
      SizedBox(width: 6),
      Text(title,
          style: textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w500, color: AppColors.primaryBlue))
    ]);
  }

  ChronicPackageItem? _getItem({required ChronicPackageItemType type}) {
    return chronicDiseasePackage.includes
        .firstWhereOrNull((element) => element.type == type);
  }

  Widget _buildPriceContainer() {
    final textTheme = Get.textTheme;

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
        decoration: BoxDecoration(color: AppColors.primaryBlue),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 7,
          children: [
            Text('₹ ${chronicDiseasePackage.originalPrice.toInt()}',
                style: textTheme.bodyMedium!.copyWith(
                    color: AppColors.primaryPink, fontWeight: FontWeight.w400)),
            Text(
              '₹${chronicDiseasePackage.discountedPrice.toInt()}',
              style: textTheme.titleMedium!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      SizedBox(
          height: 38,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10)))),
              onPressed: () {},
              child: Text('Add to cart',
                  style: textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w700, color: Colors.white))))
    ]);
  }
}
