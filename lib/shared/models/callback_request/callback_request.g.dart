// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'callback_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CallbackRequestImpl _$$CallbackRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CallbackRequestImpl(
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      query: json['query'] as String,
    );

Map<String, dynamic> _$$CallbackRequestImplToJson(
        _$CallbackRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'query': instance.query,
    };
