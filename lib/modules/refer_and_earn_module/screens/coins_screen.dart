import 'package:flutter/material.dart';
import 'package:qris_health/constants/api_params.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';
import 'package:qris_health/constants/enums/transaction_type.dart';
import 'package:qris_health/modules/refer_and_earn_module/models/qris_coin/qris_coin.dart';
import 'package:qris_health/modules/refer_and_earn_module/services/qris_coin_service.dart';
import 'package:qris_health/shared/components/common_listview_shimmer.dart';
import 'package:qris_health/shared/components/no_item_found_container.dart';

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
  late Future<List<QrisCoin>> _coinFuture;

  @override
  void initState() {
    super.initState();
    _coinFuture = QrisCoinService.getCoinHistory(
        userId: ApiParams.getInstance()!.userId!.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Qris Coins'),
        body: SafeArea(
            child: FutureBuilder<List<QrisCoin>>(
                future: _coinFuture,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CommonListviewShimmer();
                  }

                  var coinsEntries = snapshot.data!.reversed.toList();

                  if (snapshot.hasError) {
                    AppConstants.showSnackbar(
                        text: snapshot.error.toString(),
                        type: SnackbarType.error);
                  }

                  final totalCoins = _getTotalCoins(coinsEntries);

                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 24),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppConstants.scaffoldPadding),
                            child: WalletBalanceContainer(
                                svgPath:
                                    'assets/images/icons/drawer_icons/coin_icon.svg',
                                title: 'Total Coins',
                                value: '$totalCoins')),
                        SizedBox(height: 32),
                        Expanded(
                            child: coinsEntries.isEmpty
                                ? NoItemFoundContainer(
                                    title: 'No coins till now')
                                : ListView.separated(
                                    physics: BouncingScrollPhysics(),
                                    padding: EdgeInsets.only(
                                        left: AppConstants.scaffoldPadding,
                                        right: AppConstants.scaffoldPadding,
                                        bottom: 32),
                                    itemBuilder: (context, index) {
                                      return WalletEntryListTile(
                                          coinEntry: coinsEntries[index]);
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(height: 16);
                                    },
                                    itemCount: coinsEntries.length)),
                      ]);
                })));
  }

  int _getTotalCoins(List<QrisCoin> coinsEntries) {
    int totalCoins = 0;

    for (var coin in coinsEntries) {
      if (coin.txnType == TransactionType.debit) {
        totalCoins -= coin.coins.toInt();
      } else if (coin.txnType == TransactionType.credit) {
        totalCoins += coin.coins.toInt();
      }
    }

    return totalCoins;
  }
}
