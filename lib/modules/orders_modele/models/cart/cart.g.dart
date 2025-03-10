// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      cartTests: (json['cartTests'] as List<dynamic>)
          .map((e) => CartTest.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedAddress: json['selectedAddress'] == null
          ? null
          : Address.fromJson(json['selectedAddress'] as Map<String, dynamic>),
      timeSlot: json['timeSlot'] == null
          ? null
          : TimeSlot.fromJson(json['timeSlot'] as Map<String, dynamic>),
      collectionDate: json['collectionDate'] == null
          ? null
          : DateTime.parse(json['collectionDate'] as String),
      appliedCoupon: json['appliedCoupon'] == null
          ? null
          : Coupon.fromJson(json['appliedCoupon'] as Map<String, dynamic>),
      shouldGetHardCopy: json['shouldGetHardCopy'] as bool? ?? false,
      pincode: json['pincode'] == null
          ? null
          : Pincode.fromJson(json['pincode'] as Map<String, dynamic>),
      redeemCoins: json['redeemCoins'] as bool? ?? false,
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'cartTests': instance.cartTests,
      'selectedAddress': instance.selectedAddress,
      'timeSlot': instance.timeSlot,
      'collectionDate': instance.collectionDate?.toIso8601String(),
      'appliedCoupon': instance.appliedCoupon,
      'shouldGetHardCopy': instance.shouldGetHardCopy,
      'pincode': instance.pincode,
      'redeemCoins': instance.redeemCoins,
    };

_$CartTestImpl _$$CartTestImplFromJson(Map<String, dynamic> json) =>
    _$CartTestImpl(
      test: TestPackageModel.fromJson(json['test'] as Map<String, dynamic>),
      patientIds: (json['patientIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$CartTestImplToJson(_$CartTestImpl instance) =>
    <String, dynamic>{
      'test': instance.test,
      'patientIds': instance.patientIds,
    };
