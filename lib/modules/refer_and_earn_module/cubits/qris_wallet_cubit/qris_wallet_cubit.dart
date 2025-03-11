import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qris_health/constants/api_params.dart';
import 'package:qris_health/modules/refer_and_earn_module/models/wallet_entry/qris_wallet_entry.dart';
import 'package:qris_health/modules/refer_and_earn_module/services/qris_wallet_service.dart';

import '../../../../constants/enums/transaction_type.dart';

part 'qris_wallet_state.dart';

class QrisWalletCubit extends Cubit<QrisWalletState> {
  QrisWalletCubit() : super(QrisWalletInitial());

  Future<void> getWalletEntries() async {
    try {
      emit(QrisWalletLoading());
      final entries = await QrisWalletService.getWalletHistory(
          userId: ApiParams.getInstance()!.userId!.toString());
      emit(QrisWalletLoaded(entries: entries.reversed.toList()));
    } catch (e) {
      emit(QrisWalletLoadingError(
          entries: state.entries, errorMessage: e.toString()));
    }
  }

  int getTotalAmount() {
    int totalCoins = 0;
    final coinsEntries = state.entries;
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
