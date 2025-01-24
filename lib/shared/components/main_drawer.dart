import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/api_params.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';
import 'package:qris_health/modules/home_module/screens/popular_package_screen.dart';
import 'package:qris_health/modules/login_module/screens/login_phone_number_screen.dart';
import 'package:qris_health/modules/patients_module/screens/patients_screen.dart';
import 'package:qris_health/modules/profile_module/screens/my_profile_screen.dart';
import 'package:qris_health/modules/refer_and_earn_module/screens/coins_screen.dart';
import 'package:qris_health/modules/refer_and_earn_module/screens/refer_and_earn_screen.dart';
import 'package:qris_health/modules/refer_and_earn_module/screens/wallet_screen.dart';
import 'package:qris_health/modules/address_module/screens/address_screen.dart';
import 'package:qris_health/modules/booking_module/screens/bookings_screen.dart';
import 'package:qris_health/modules/doctor_consultation_module/screens/doctor_consultation_screen.dart';
import 'package:qris_health/modules/health_article_module/screens/health_articles_screen.dart';
import 'package:qris_health/modules/health_module/screens/mental_wellness_screen.dart';
import 'package:qris_health/modules/users_module/cubits/user_cubit.dart';
import 'package:qris_health/shared/components/underline_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../styles/app_colors.dart';
import 'common_divider.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final _textTheme = Get.textTheme;

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
            BlocBuilder<UserCubit, UserState>(builder: (context, state) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('${state.user.name}',
                            style: _textTheme.titleLarge!.copyWith(
                                color: AppColors.primaryBlue,
                                fontWeight: FontWeight.w700)),
                        const SizedBox(height: 6),
                        Text('${state.user.phone}',
                            style: _textTheme.bodyLarge!.copyWith(
                                color: AppColors.primaryPink,
                                fontWeight: FontWeight.w400)),
                      ]));
            }),
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
                      builder: (context) => PatientsScreen()));
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
                      builder: (context) => PopularPackageScreen()));
                }),
            _buildListTile(
                svgPath: 'assets/images/icons/drawer_icons/doctor_icon.svg',
                title: 'Find Doctors',
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => DoctorConsultationScreen()));
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
              onTap: _logout,
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

  Future<void> _logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.clear();
      ApiParams.getInstance()!.userId = null;
      ApiParams.getInstance()!.authorization = null;
      ApiParams.getInstance()!.phoneNumber = null;
      Navigator.of(context).pushAndRemoveUntil(
          CupertinoPageRoute(builder: (context) => LoginPhoneNumberScreen()),
          (route) => false);
    } catch (e) {
      AppConstants.showSnackbar(text: e.toString(), type: SnackbarType.error);
    }
  }
}
