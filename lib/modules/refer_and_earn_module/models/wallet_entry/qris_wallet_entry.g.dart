// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qris_wallet_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QrisWalletEntryImpl _$$QrisWalletEntryImplFromJson(
        Map<String, dynamic> json) =>
    _$QrisWalletEntryImpl(
      id: (json['id'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      userId: (json['user_id'] as num?)?.toInt(),
      dated: json['dated'] as String,
      txnId: json['txn_id'] as String?,
      txnType: $enumDecode(_$TransactionTypeEnumMap, json['txn_type']),
      remark: json['remark'] as String?,
    );

Map<String, dynamic> _$$QrisWalletEntryImplToJson(
        _$QrisWalletEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'user_id': instance.userId,
      'dated': instance.dated,
      'txn_id': instance.txnId,
      'txn_type': _$TransactionTypeEnumMap[instance.txnType]!,
      'remark': instance.remark,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.debit: 'debit',
  TransactionType.credit: 'credit',
  TransactionType.failed: 'failed',
};
