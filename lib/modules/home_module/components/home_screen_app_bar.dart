import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/cart_module/screens/cart_screen.dart';
import 'package:qris_health/modules/refer_and_earn_module/screens/wallet_screen.dart';
import 'package:qris_health/modules/users_module/cubits/user_cubit.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../notification_module/screens/notification_screen.dart';

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
                    BlocBuilder<UserCubit, UserState>(
                        builder: (context, state) {
                      return Text(
                          'Welcome, ${state.user.name!.split(' ').first}!',
                          style: _textTheme.titleLarge!.copyWith(
                              color: AppColors.primaryBlue,
                              fontWeight: FontWeight.w700,
                              fontFamily: AppConstants.latoFontFamily));
                    }),
                    Row(children: [
                      SvgPicture.asset('assets/images/icons/location_icon.svg'),
                      SizedBox(width: 4),
                      BlocBuilder<UserCubit, UserState>(
                          builder: (context, state) {
                        return Text(state.user.location ?? '-',
                            style: _textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightSubTextColor));
                      }),
                    ])
                  ])),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => WalletScreen()));
                  },
                  child: SvgPicture.asset(
                      'assets/images/icons/home_screen_icons/wallet_icon.svg')),
              SizedBox(width: 10),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        CupertinoPageRoute(builder: (context) => CartScreen()));
                  },
                  child: SvgPicture.asset(
                      'assets/images/icons/home_screen_icons/cart_icon.svg')),
              SizedBox(width: 10),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => NotificationScreen()));
                  },
                  child: SvgPicture.asset(
                      'assets/images/icons/home_screen_icons/notification_icon.svg')),
            ])));
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
