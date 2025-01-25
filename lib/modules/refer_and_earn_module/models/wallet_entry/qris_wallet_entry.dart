import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qris_health/constants/enums/transaction_type.dart';

part 'qris_wallet_entry.freezed.dart';
part 'qris_wallet_entry.g.dart';

@freezed
class QrisWalletEntry with _$QrisWalletEntry {
  const factory QrisWalletEntry(
      {required int id,
      required double amount,
      @JsonKey(name: 'user_id') int? userId,
      required String dated,
      @JsonKey(name: 'txn_id') String? txnId,
      @JsonKey(name: 'txn_type') required TransactionType txnType,
      String? remark}) = _QrisWalletEntry;

  factory QrisWalletEntry.fromJson(Map<String, dynamic> json) =>
      _$QrisWalletEntryFromJson(json);
}
