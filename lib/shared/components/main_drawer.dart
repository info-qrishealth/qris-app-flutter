import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/profile_module/screens/my_profile_screen.dart';
import 'package:qris_health/modules/refer_and_earn_module/screens/coins_screen.dart';
import 'package:qris_health/modules/refer_and_earn_module/screens/refer_and_earn_screen.dart';
import 'package:qris_health/modules/refer_and_earn_module/screens/wallet_screen.dart';
import 'package:qris_health/modules/address_module/screens/address_screen.dart';
import 'package:qris_health/modules/booking_module/screens/bookings_screen.dart';
import 'package:qris_health/modules/family_members_module/screens/family_member_screen.dart';
import 'package:qris_health/modules/screens/find_doctors_screen.dart';
import 'package:qris_health/modules/screens/health_articles_screen.dart';
import 'package:qris_health/modules/health_module/screens/mental_wellness_screen.dart';
import 'package:qris_health/modules/screens/packages_screen.dart';
import 'package:qris_health/shared/components/underline_text.dart';

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
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => MyProfileScreen()));
                }),
            _buildListTile(
                svgPath: 'assets/images/icons/drawer_icons/location_icon.svg',
                title: 'Addresses',
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => AddressScreen()));
                }),
            _buildListTile(
                svgPath: 'assets/images/icons/drawer_icons/family_icon.svg',
                title: 'Family Members',
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => FamilyMemberScreen()));
                }),
            _buildListTile(
                svgPath: 'assets/images/icons/drawer_icons/wallet_icon.svg',
                title: 'Qris wallet',
                onTap: () {
                  Navigator.of(context).push(
                      CupertinoPageRoute(builder: (context) => WalletScreen()));
                }),
            _buildListTile(
                svgPath: 'assets/images/icons/drawer_icons/coin_icon.svg',
                title: 'Qris Coins',
                onTap: () {
                  Navigator.of(context).push(
                      CupertinoPageRoute(builder: (context) => CoinsScreen()));
                }),
            CommonDivider(),
            SizedBox(height: 8),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: UnconstrainedBox(
                        child: UnderlineText(
                            text: 'Others',
                            underlineColor: AppColors.primaryBlue,
                            style: _textTheme.titleMedium!.copyWith(
                                color: AppColors.primaryBlue,
                                fontWeight: FontWeight.w500))))),
            SizedBox(height: 8),
            _buildListTile(
                svgPath: 'assets/images/icons/drawer_icons/booking_icon.svg',
                title: 'Booking / Reports',
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => BookingsScreen()));
                }),
            _buildListTile(
                svgPath: 'assets/images/icons/drawer_icons/refer_icon.svg',
                title: 'Refer & Earn',
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => ReferAndEarnScreen()));
                }),
            _buildListTile(
                svgPath:
                    'assets/images/icons/drawer_icons/mental_wellness_icon.svg',
                title: 'Mental Wellness',
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => MentalWellnessScreen()));
                }),
            _buildListTile(
                svgPath: 'assets/images/icons/drawer_icons/premium_icon.svg',
                title: 'Popular Packages',
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => PackagesScreen()));
                }),
            _buildListTile(
                svgPath: 'assets/images/icons/drawer_icons/doctor_icon.svg',
                title: 'Find Doctors',
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => FindDoctorsScreen()));
                }),
            _buildListTile(
                svgPath: 'assets/images/icons/drawer_icons/article_icon.svg',
                title: 'Health Articles',
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => HealthArticlesScreen()));
                }),
          ])),
          CommonDivider(),
          _buildListTile(
              svgPath: 'assets/images/icons/drawer_icons/logout_icon.svg',
              title: 'Logout',
              onTap: () {
                Navigator.of(context).pop();
              },
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
