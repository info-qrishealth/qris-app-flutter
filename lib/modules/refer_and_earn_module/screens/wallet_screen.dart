import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/api_params.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/refer_and_earn_module/components/qris_wallet_list_tile.dart';
import 'package:qris_health/modules/refer_and_earn_module/components/wallet_balance_container.dart';
import 'package:qris_health/modules/refer_and_earn_module/models/wallet_entry/qris_wallet_entry.dart';
import 'package:qris_health/modules/refer_and_earn_module/services/qris_wallet_service.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../../constants/enums/snackbar_type.dart';
import '../../../constants/enums/transaction_type.dart';
import '../../../shared/components/common_listview_shimmer.dart';
import '../../../shared/components/no_item_found_container.dart';
import '../components/qris_coin_list_tile.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  late Future<List<QrisWalletEntry>> _walletFuture;

  @override
  void initState() {
    super.initState();
    _walletFuture = QrisWalletService.getWalletHistory(
        userId: ApiParams.getInstance()!.userId!.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Qris Wallet'),
        body: SafeArea(
            child: FutureBuilder<List<QrisWalletEntry>>(
                future: _walletFuture,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CommonListviewShimmer();
                  }

                  var walletEntries = snapshot.data!.reversed.toList();

                  if (snapshot.hasError) {
                    AppConstants.showSnackbar(
                        text: snapshot.error.toString(),
                        type: SnackbarType.error);
                  }

                  final totalCoins = _getTotalCoins(walletEntries);

                  return Column(
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
                                value: '₹$totalCoins')),
                        SizedBox(height: 32),
                        Expanded(
                            child: walletEntries.isEmpty
                                ? NoItemFoundContainer(
                                    title: 'No wallet entry till now')
                                : ListView.separated(
                                    physics: BouncingScrollPhysics(),
                                    padding: EdgeInsets.only(
                                        left: AppConstants.scaffoldPadding,
                                        right: AppConstants.scaffoldPadding,
                                        bottom: 32),
                                    itemBuilder: (context, index) {
                                      return QrisWalletListTile(
                                          walletEntry: walletEntries[index]);
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(height: 16);
                                    },
                                    itemCount: walletEntries.length)),
                      ]);
                })));
  }

  int _getTotalCoins(List<QrisWalletEntry> coinsEntries) {
    int totalCoins = 0;

    for (var coin in coinsEntries) {
      if (coin.txnType == TransactionType.debit) {
        totalCoins -= coin.amount.toInt();
      } else if (coin.txnType == TransactionType.credit) {
        totalCoins += coin.amount.toInt();
      }
    }

    return totalCoins;
  }
}
