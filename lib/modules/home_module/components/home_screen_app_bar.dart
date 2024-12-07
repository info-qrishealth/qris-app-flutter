import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/styles/app_colors.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final _textTheme = Get.textTheme;
  HomeScreenAppBar({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            padding:
                EdgeInsets.symmetric(horizontal: AppConstants.scaffoldPadding),
            child: Row(children: [
              InkWell(
                  onTap: () {
                    scaffoldKey.currentState?.openDrawer();
                  },
                  child:
                      SvgPicture.asset('assets/images/icons/drawer_icon.svg')),
              SizedBox(width: 24),
              Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                    Text('Welcome, Khushi!',
                        style: _textTheme.titleLarge!.copyWith(
                            color: AppColors.primaryBlue,
                            fontWeight: FontWeight.w700,
                            fontFamily: AppConstants.latoFontFamily)),
                    Row(children: [
                      SvgPicture.asset('assets/images/icons/location_icon.svg'),
                      SizedBox(width: 4),
                      Text('New Delhi',
                          style: _textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.lightSubTextColor)),
                    ])
                  ])),
              SvgPicture.asset(
                  'assets/images/icons/home_screen_icons/wallet_icon.svg'),
              SizedBox(width: 10),
              SvgPicture.asset(
                  'assets/images/icons/home_screen_icons/cart_icon.svg'),
              SizedBox(width: 10),
              SvgPicture.asset(
                  'assets/images/icons/home_screen_icons/notification_icon.svg'),
            ])));
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
