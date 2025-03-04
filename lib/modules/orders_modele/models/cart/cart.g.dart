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
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'cartTests': instance.cartTests,
      'selectedAddress': instance.selectedAddress,
    };

_$CartTestImpl _$$CartTestImplFromJson(Map<String, dynamic> json) =>
    _$CartTestImpl(
      testId: (json['testId'] as num).toInt(),
      patientIds: (json['patientIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$CartTestImplToJson(_$CartTestImpl instance) =>
    <String, dynamic>{
      'testId': instance.testId,
      'patientIds': instance.patientIds,
    };
