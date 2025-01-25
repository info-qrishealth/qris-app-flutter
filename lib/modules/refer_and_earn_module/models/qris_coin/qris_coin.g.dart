// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qris_coin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QrisCoinImpl _$$QrisCoinImplFromJson(Map<String, dynamic> json) =>
    _$QrisCoinImpl(
      id: (json['id'] as num).toInt(),
      coins: (json['coins'] as num).toDouble(),
      userId: (json['user_id'] as num?)?.toInt(),
      dated: json['dated'] as String,
      txnId: json['txn_id'] as String,
      txnType: $enumDecode(_$TransactionTypeEnumMap, json['txn_type']),
      remark: json['remark'] as String,
    );

Map<String, dynamic> _$$QrisCoinImplToJson(_$QrisCoinImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'coins': instance.coins,
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
