import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/cart_module/screens/cart_screen.dart';
import 'package:qris_health/modules/orders_modele/cart_cubit/cart_cubit.dart';
import 'package:qris_health/modules/refer_and_earn_module/cubits/qris_wallet_cubit/qris_wallet_cubit.dart';
import 'package:qris_health/modules/refer_and_earn_module/screens/wallet_screen.dart';
import 'package:qris_health/modules/users_module/cubits/user_cubit.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../../generated/assets.dart';
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
                  child: Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: SvgPicture.asset(Assets.iconsDrawerIcon))),
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
                      SvgPicture.asset(Assets.iconsLocationIcon),
                      SizedBox(width: 4),
                      BlocBuilder<UserCubit, UserState>(
                          builder: (context, state) {
                        return Text('New Delhi',
                            style: _textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightSubTextColor));
                      }),
                    ])
                  ])),
              InkWell(onTap: () {
                Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) => WalletScreen()));
              }, child: BlocBuilder<QrisWalletCubit, QrisWalletState>(
                  builder: (context, state) {
                final totalCoins =
                    BlocProvider.of<QrisWalletCubit>(context).getTotalAmount();

                return Badge(
                    isLabelVisible: true,
                    backgroundColor: AppColors.primaryPink,
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    label: Text('₹$totalCoins',
                        style: _textTheme.labelSmall!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 7)),
                    child: SvgPicture.asset(Assets.homeScreenIconsWalletIcon));
              })),
              SizedBox(width: 10),
              InkWell(onTap: () async {
                await Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) =>
                        CartScreen(testPackageModel: null, initialPage: 1)));
              }, child:
                  BlocBuilder<CartCubit, CartState>(builder: (context, state) {
                return Badge(
                    backgroundColor: AppColors.primaryPink,
                    padding: EdgeInsets.zero,
                    label: Text(
                        state.cart?.cartTests
                                .where(
                                    (element) => element.patientIds.isNotEmpty)
                                .length
                                .toString() ??
                            '0',
                        style: _textTheme.labelSmall!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 7)),
                    child: SvgPicture.asset(Assets.homeScreenIconsCartIcon));
              })),
              // SizedBox(width: 10),
              // InkWell(
              //     onTap: () {
              //       Navigator.of(context).push(CupertinoPageRoute(
              //           builder: (context) => NotificationScreen()));
              //     },
              //     child:
              //         SvgPicture.asset(Assets.homeScreenIconsNotificationIcon)),
            ])));
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
