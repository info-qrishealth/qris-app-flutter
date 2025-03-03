import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/generated/assets.dart';
import 'package:qris_health/modules/all_scans_module/screens/all_scans_screen.dart';
import 'package:qris_health/modules/health_module/screens/mental_wellness_screen.dart';
import 'package:qris_health/modules/home_module/screens/popular_package_screen.dart';
import 'package:qris_health/shared/components/discount_coupon_container.dart';
import 'package:qris_health/shared/components/request_callback_dialog.dart';
import 'package:qris_health/styles/app_colors.dart';

class HomeScreenNavBar extends StatefulWidget {
  const HomeScreenNavBar({super.key});

  @override
  State<HomeScreenNavBar> createState() => _HomeScreenNavBarState();
}

class _HomeScreenNavBarState extends State<HomeScreenNavBar> {
  final _textTheme = Get.textTheme;
  int _selectedScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFF03B07A),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          DiscountCouponContainer(),
          Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color(0x1E000000),
                    blurRadius: 56,
                    offset: Offset(10, 14),
                    spreadRadius: 0)
              ]),
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  child: BottomAppBar(
                      shape: CircularNotchedRectangle(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      notchMargin: 8.0,
                      elevation: 12,
                      child: SafeArea(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                            _buildNavItem(
                                imagePath: Assets.navBarIconsHome,
                                label: 'Home',
                                index: 0,
                                size: 22),
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      builder: (context) =>
                                          PopularPackageScreen()));
                                },
                                child: _buildNavItem(
                                    imagePath: Assets.navBarIconsLabTestIcon,
                                    label: "Lab Tests",
                                    index: 1)),
                            SizedBox(
                                height: 65,
                                width: 65,
                                child: FloatingActionButton(
                                    onPressed: () async {
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              RequestCallbackDialog(
                                                  query:
                                                      'Callback request from application home screen'));
                                    },
                                    backgroundColor: AppColors.primaryBlue,
                                    child: Image.asset(
                                        Assets.navBarIconsCallIcon,
                                        height: 28))),
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      builder: (context) => AllScansScreen()));
                                },
                                child: _buildNavItem(
                                    imagePath: Assets.navBarIconsScanIcon,
                                    label: 'Scans',
                                    index: 2)),
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      builder: (context) =>
                                          MentalWellnessScreen()));
                                },
                                child: _buildNavItem(
                                    imagePath: Assets.navBarIconsWellnessIcon,
                                    label: 'Wellness',
                                    index: 3))
                          ]))))),
        ]));
  }

  Widget _buildNavItem(
      {required String imagePath,
      required String label,
      required int index,
      double? size}) {
    final isSelected = _selectedScreen == index;

    return Column(mainAxisSize: MainAxisSize.min, children: [
      Image.asset(imagePath,
          height: size ?? 24,
          width: size ?? 24,
          color:
              isSelected ? AppColors.primaryBlue : AppColors.lightSubTextColor),
      SizedBox(height: 4),
      Text(label,
          style: _textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w500,
              color: isSelected
                  ? AppColors.primaryBlue
                  : AppColors.lightSubTextColor)),
    ]);
  }
}
