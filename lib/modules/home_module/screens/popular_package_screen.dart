import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/home_module/components/package_list_tile.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/constants/enums/popular_package_type.dart';
import 'package:qris_health/shared/components/discount_coupon_container.dart';
import 'package:qris_health/styles/app_colors.dart';

class PopularPackageScreen extends StatefulWidget {
  const PopularPackageScreen({super.key});

  @override
  State<PopularPackageScreen> createState() => _PopularPackageScreenState();
}

class _PopularPackageScreenState extends State<PopularPackageScreen> {
  final _textTheme = Get.textTheme;
  PopularPackageType _popularPackageType = PopularPackageType.ALCOHOLISM;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: DiscountCouponContainer(),
        appBar: CommonAppBar(title: _popularPackageType.formattedName),
        body: SafeArea(
            child: Column(children: [
          SizedBox(height: 18),
          SizedBox(
              height: 80,
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.scaffoldPadding),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final package = PopularPackageType.values[index];
                    final isSelected = _popularPackageType == package;

                    return GestureDetector(
                        onTap: () {
                          _popularPackageType = package;
                          setState(() {});
                        },
                        child: Column(children: [
                          Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: isSelected
                                          ? Color(0x14B23C97)
                                          : Colors.white,
                                      border: Border.all(
                                          width: 0.9,
                                          color: isSelected
                                              ? AppColors.primaryPink
                                              : Colors.black.withOpacity(0.09)),
                                      borderRadius: BorderRadius.circular(17)),
                                  padding: EdgeInsets.all(14),
                                  child: Image.asset(package.assetPath))),
                          SizedBox(height: 4),
                          Text(package.formattedName,
                              style: _textTheme.bodySmall!
                                  .copyWith(fontWeight: FontWeight.w500))
                        ]));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 18);
                  },
                  itemCount: PopularPackageType.values.length)),
          SizedBox(height: 28),
          Expanded(
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(
                      left: AppConstants.scaffoldPadding,
                      right: AppConstants.scaffoldPadding,
                      bottom: 16),
                  itemBuilder: (context, index) {
                    return PackageListTile(
                        description:
                            'Included : Liver Test, Kidney Test, Blood glucose fasting, Lipid profile, Thyroid Profile, HBA1C, Urine Test....',
                        onSeeDetailsTap: () {},
                        onBookNowTap: () {});
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 15);
                  },
                  itemCount: 10)),
        ])));
  }
}
