// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'free_consultation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FreeConsultationRequestImpl _$$FreeConsultationRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$FreeConsultationRequestImpl(
      orderId: (json['orderId'] as num).toInt(),
      patientIds: (json['patientIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$FreeConsultationRequestImplToJson(
        _$FreeConsultationRequestImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'patientIds': instance.patientIds,
    };
