import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/refer_and_earn_module/components/wallet_balance_container.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../components/wallet_entry_list_tile.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Qris Wallet'),
        body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              SizedBox(height: 24),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.scaffoldPadding),
                  child: WalletBalanceContainer(
                      svgPath:
                          'assets/images/icons/drawer_icons/wallet_icon.svg',
                      title: 'Total Balance',
                      value: '₹4500')),
              SizedBox(height: 32),
              Expanded(
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(
                          left: AppConstants.scaffoldPadding,
                          right: AppConstants.scaffoldPadding,
                          bottom: 32),
                      itemBuilder: (context, index) {
                        return WalletEntryListTile(
                            title: 'Wallet Amount Paid To Order');
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 16);
                      },
                      itemCount: 32)),
            ])));
  }
}
