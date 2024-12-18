import 'package:flutter/material.dart';

import '../../../constants/app_constants.dart';
import '../../../shared/components/common_app_bar.dart';
import '../components/wallet_balance_container.dart';
import '../components/wallet_entry_list_tile.dart';

class CoinsScreen extends StatefulWidget {
  const CoinsScreen({super.key});

  @override
  State<CoinsScreen> createState() => _CoinsScreenState();
}

class _CoinsScreenState extends State<CoinsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Qris Coins'),
        body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              SizedBox(height: 24),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.scaffoldPadding),
                  child: WalletBalanceContainer(
                      svgPath: 'assets/images/icons/drawer_icons/coin_icon.svg',
                      title: 'Total Coins',
                      value: '2100')),
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
                            title: 'Qris Coins Paid To Order #"11933"');
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 16);
                      },
                      itemCount: 32)),
            ])));
  }
}
