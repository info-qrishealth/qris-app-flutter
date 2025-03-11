import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';
import 'package:qris_health/modules/refer_and_earn_module/cubits/qris_coin_cubit/qris_coins_cubit.dart';
import 'package:qris_health/shared/components/common_listview_shimmer.dart';
import 'package:qris_health/shared/components/no_item_found_container.dart';

import '../../../constants/app_constants.dart';
import '../../../generated/assets.dart';
import '../../../shared/components/common_app_bar.dart';
import '../components/wallet_balance_container.dart';
import '../components/qris_coin_list_tile.dart';

class CoinsScreen extends StatefulWidget {
  const CoinsScreen({super.key});

  @override
  State<CoinsScreen> createState() => _CoinsScreenState();
}

class _CoinsScreenState extends State<CoinsScreen> {
  @override
  void initState() {
    super.initState();
    final qrisCoinsCubit = BlocProvider.of<QrisCoinsCubit>(context);

    if (qrisCoinsCubit.state is! QrisCoinsLoaded) {
      qrisCoinsCubit.getQrisCoins();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Qris Coins'),
        body: SafeArea(child: BlocBuilder<QrisCoinsCubit, QrisCoinsState>(
            builder: (context, state) {
          if (state is QrisCoinsLoadingError) {
            AppConstants.showSnackbar(
                text: state.errorMessage, type: SnackbarType.error);
          }

          if (state is QrisCoinsLoaded) {
            final totalCoins =
                BlocProvider.of<QrisCoinsCubit>(context).getTotalCoins();

            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 24),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.scaffoldPadding),
                      child: WalletBalanceContainer(
                          svgPath: Assets.drawerIconsCoinIcon,
                          title: 'Total Coins',
                          value: '₹$totalCoins')),
                  SizedBox(height: 32),
                  Expanded(
                      child: state.coinEntries.isEmpty
                          ? NoItemFoundContainer(title: 'No coins till now')
                          : ListView.separated(
                              physics: BouncingScrollPhysics(),
                              padding: EdgeInsets.only(
                                  left: AppConstants.scaffoldPadding,
                                  right: AppConstants.scaffoldPadding,
                                  bottom: 32),
                              itemBuilder: (context, index) {
                                return QrisCoinListTile(
                                    coinEntry: state.coinEntries[index]);
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 16);
                              },
                              itemCount: state.coinEntries.length)),
                ]);
          }

          return CommonListviewShimmer();
        })));
  }
}
