import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qris_health/constants/api_params.dart';
import 'package:qris_health/modules/refer_and_earn_module/models/qris_coin/qris_coin.dart';
import 'package:qris_health/modules/refer_and_earn_module/services/qris_coin_service.dart';

import '../../../../constants/enums/transaction_type.dart';

part 'qris_coins_state.dart';

class QrisCoinsCubit extends Cubit<QrisCoinsState> {
  QrisCoinsCubit() : super(QrisCoinsInitial());

  Future<void> getQrisCoins() async {
    try {
      emit(QrisCoinsLoading());
      final coins = await QrisCoinService.getCoinHistory(
          userId: ApiParams.getInstance()!.userId.toString());
      emit(QrisCoinsLoaded(coinEntries: coins.reversed.toList()));
    } catch (e) {
      emit(QrisCoinsLoadingError(
          coinEntries: state.coinEntries, errorMessage: e.toString()));
    }
  }

  int getTotalAmount() {
    int totalCoins = 0;
    final coinsEntries = state.coinEntries;

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
