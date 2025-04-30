// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderPatientImpl _$$OrderPatientImplFromJson(Map<String, dynamic> json) =>
    _$OrderPatientImpl(
      name: json['name'] as String,
      id: json['id'] as String,
      gender: json['gender'] as String,
      dob: json['dob'] as String,
      mobile: json['mobile'] as String? ?? '',
    );

Map<String, dynamic> _$$OrderPatientImplToJson(_$OrderPatientImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'gender': instance.gender,
      'dob': instance.dob,
      'mobile': instance.mobile,
    };
