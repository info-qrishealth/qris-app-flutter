import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qris_health/constants/enums/transaction_type.dart';

part 'qris_coin.freezed.dart';
part 'qris_coin.g.dart';

@freezed
class QrisCoin with _$QrisCoin {
  const factory QrisCoin(
      {required int id,
      required double coins,
      @JsonKey(name: 'user_id') int? userId,
      required String dated,
      @JsonKey(name: 'txn_id') required String txnId,
      @JsonKey(name: 'txn_type') required TransactionType txnType,
      required String remark}) = _QrisCoin;

  factory QrisCoin.fromJson(Map<String, dynamic> json) =>
      _$QrisCoinFromJson(json);
}
