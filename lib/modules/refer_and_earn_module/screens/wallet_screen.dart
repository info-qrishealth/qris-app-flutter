import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/refer_and_earn_module/components/qris_wallet_list_tile.dart';
import 'package:qris_health/modules/refer_and_earn_module/components/wallet_balance_container.dart';
import 'package:qris_health/modules/refer_and_earn_module/cubits/qris_wallet_cubit/qris_wallet_cubit.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';

import '../../../constants/enums/snackbar_type.dart';
import '../../../generated/assets.dart';
import '../../../shared/components/common_listview_shimmer.dart';
import '../../../shared/components/no_item_found_container.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  void initState() {
    super.initState();
    final walletCubit = BlocProvider.of<QrisWalletCubit>(context);

    if (walletCubit.state is! QrisWalletLoaded) {
      walletCubit.getWalletEntries();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Qris Wallet'),
        body: SafeArea(child: BlocBuilder<QrisWalletCubit, QrisWalletState>(
          builder: (context, state) {
            if (state is QrisWalletLoadingError) {
              AppConstants.showSnackbar(
                  text: state.errorMessage, type: SnackbarType.error);
            }

            if (state is QrisWalletLoaded) {
              final totalCoins =
                  BlocProvider.of<QrisWalletCubit>(context).getTotalAmount();

              return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 24),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppConstants.scaffoldPadding),
                        child: WalletBalanceContainer(
                            svgPath: Assets.drawerIconsWalletIcon,
                            title: 'Total Balance',
                            value: '₹$totalCoins')),
                    SizedBox(height: 32),
                    Expanded(
                        child: state.entries.isEmpty
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
                                      walletEntry: state.entries[index]);
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: 16);
                                },
                                itemCount: state.entries.length)),
                  ]);
            }

            return CommonListviewShimmer();
          },
        )));
  }
}
