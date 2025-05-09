// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DoctorLocationImpl _$$DoctorLocationImplFromJson(Map<String, dynamic> json) =>
    _$DoctorLocationImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      cityId: (json['city_id'] as num?)?.toInt(),
      slug: json['slug'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$DoctorLocationImplToJson(
        _$DoctorLocationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'city_id': instance.cityId,
      'slug': instance.slug,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
      'status': instance.status,
    };
