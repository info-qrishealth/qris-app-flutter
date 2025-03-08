// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pincode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PincodeImpl _$$PincodeImplFromJson(Map<String, dynamic> json) =>
    _$PincodeImpl(
      id: (json['id'] as num?)?.toInt(),
      pincode: (json['pincode'] as num).toInt(),
      minOrder: (json['min_order'] as num).toInt(),
      deliveryCharge: (json['delivery_charge'] as num).toInt(),
      hardCopyCharge: (json['hard_copy_charge'] as num).toInt(),
      status: json['status'] as String? ?? '1',
    );

Map<String, dynamic> _$$PincodeImplToJson(_$PincodeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pincode': instance.pincode,
      'min_order': instance.minOrder,
      'delivery_charge': instance.deliveryCharge,
      'hard_copy_charge': instance.hardCopyCharge,
      'status': instance.status,
    };
