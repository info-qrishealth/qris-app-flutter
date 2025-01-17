// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_education.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DoctorEducationImpl _$$DoctorEducationImplFromJson(
        Map<String, dynamic> json) =>
    _$DoctorEducationImpl(
      id: (json['id'] as num).toInt(),
      docId: (json['doc_id'] as num?)?.toInt(),
      education: json['education'] as String?,
      college: json['college'] as String?,
    );

Map<String, dynamic> _$$DoctorEducationImplToJson(
        _$DoctorEducationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doc_id': instance.docId,
      'education': instance.education,
      'college': instance.college,
    };
