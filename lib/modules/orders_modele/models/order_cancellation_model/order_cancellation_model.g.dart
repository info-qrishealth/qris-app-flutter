// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_cancellation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderCancellationModelImpl _$$OrderCancellationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderCancellationModelImpl(
      userId: json['user_id'] as String,
      doctorId: json['doctor_id'] as String,
      orderId: json['order_id'] as String,
      txnId: json['txn_id'] as String,
      cancellationRemark: json['cancellation_remark'] as String,
      cancellationComment: json['cancellation_comment'] as String,
    );

Map<String, dynamic> _$$OrderCancellationModelImplToJson(
        _$OrderCancellationModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'doctor_id': instance.doctorId,
      'order_id': instance.orderId,
      'txn_id': instance.txnId,
      'cancellation_remark': instance.cancellationRemark,
      'cancellation_comment': instance.cancellationComment,
    };
