// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: json['user_id'] as String?,
      house: json['house'] as String?,
      address1: json['address_1'] as String?,
      address2: json['address_2'] as String?,
      landmark: json['landmark'] as String?,
      pincode: json['pincode'] as String?,
      state: json['state'] as String?,
      status: (json['status'] as num?)?.toInt(),
      disOrder: (json['dis_order'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'house': instance.house,
      'address_1': instance.address1,
      'address_2': instance.address2,
      'landmark': instance.landmark,
      'pincode': instance.pincode,
      'state': instance.state,
      'status': instance.status,
      'dis_order': instance.disOrder,
    };
