import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';

import '../../styles/app_colors.dart';
import 'common_divider.dart';

class MainDrawer extends StatelessWidget {
  final _textTheme = Get.textTheme;
  MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16))),
        shadowColor: Colors.transparent,
        width: Get.width * 0.7,
        child: SafeArea(
            child: Column(children: [
          Expanded(
              child: ListView(children: [
            SizedBox(height: GetPlatform.isIOS ? 32 : 38),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Khushi Jain',
                          style: _textTheme.titleLarge!.copyWith(
                              color: AppColors.primaryBlue,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(height: 6),
                      Text('8287397488',
                          style: _textTheme.bodyLarge!.copyWith(
                              color: AppColors.primaryPink,
                              fontWeight: FontWeight.w400)),
                    ])),
            const SizedBox(height: 16),
            const CommonDivider(),
            _buildListTile(
                svgPath: 'assets/images/icons/drawer_icons/profile_icon.svg',
                title: 'View Profile',
                onTap: () {}),
            _buildListTile(
                svgPath: 'assets/images/icons/drawer_icons/location_icon.svg',
                title: 'Addresses',
                onTap: () {}),
            _buildListTile(
                svgPath: 'assets/images/icons/drawer_icons/family_icon.svg',
                title: 'Family Members',
                onTap: () {}),
            _buildListTile(
                svgPath: 'assets/images/icons/drawer_icons/wallet_icon.svg',
                title: 'Qris wallet',
                onTap: () {}),
            _buildListTile(
                svgPath: 'assets/images/icons/drawer_icons/coin_icon.svg',
                title: 'Qris Coins',
                onTap: () {}),
            CommonDivider(),
            SizedBox(height: 8),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: UnconstrainedBox(
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.primaryBlue))),
                            child: Text('Others',
                                style: _textTheme.titleMedium!.copyWith(
                                    color: AppColors.primaryBlue,
                                    fontWeight: FontWeight.w500)))))),
            SizedBox(height: 8),
            _buildListTile(
                svgPath: 'assets/images/icons/drawer_icons/booking_icon.svg',
                title: 'Booking / Reports',
                onTap: () {}),
            _buildListTile(
                svgPath: 'assets/images/icons/drawer_icons/refer_icon.svg',
                title: 'Refer & Earn',
                onTap: () {}),
            _buildListTile(
                svgPath:
                    'assets/images/icons/drawer_icons/mental_wellness_icon.svg',
                title: 'Mental Wellness',
                onTap: () {}),
            _buildListTile(
                svgPath: 'assets/images/icons/drawer_icons/premium_icon.svg',
                title: 'Popular Packages',
                onTap: () {}),
            _buildListTile(
                svgPath: 'assets/images/icons/drawer_icons/doctor_icon.svg',
                title: 'Find Doctors',
                onTap: () {}),
            _buildListTile(
                svgPath: 'assets/images/icons/drawer_icons/article_icon.svg',
                title: 'Health Articles',
                onTap: () {}),
          ])),
          CommonDivider(),
          _buildListTile(
              svgPath: 'assets/images/icons/drawer_icons/logout_icon.svg',
              title: 'Logout',
              onTap: () {},
              fontFamily: AppConstants.metropolisFontFamily,
              color: AppColors.red)
        ])));
  }

  Widget _buildListTile(
      {required String svgPath,
      required String title,
      required Function()? onTap,
      String? fontFamily,
      Color? color}) {
    return InkWell(
        onTap: onTap,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            child: Row(children: [
              SvgPicture.asset(svgPath, color: color ?? AppColors.black),
              const SizedBox(width: 24),
              Text(title,
                  style: _textTheme.titleMedium!.copyWith(
                      color: color ?? AppColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontFamily: fontFamily ?? AppConstants.latoFontFamily)),
            ])));
  }
}
