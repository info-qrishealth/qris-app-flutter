// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DoctorCategoryImpl _$$DoctorCategoryImplFromJson(Map<String, dynamic> json) =>
    _$DoctorCategoryImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      h1: json['h1'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      pic: json['pic'] as String?,
      metaTitle: json['meta_title'] as String?,
      metaKey: json['meta_key'] as String?,
      metaDesc: json['meta_desc'] as String?,
      publishedOn: json['published_on'] == null
          ? null
          : DateTime.parse(json['published_on'] as String),
      disOrder: (json['dis_order'] as num?)?.toInt(),
      icon: json['icon'] as String?,
      iconBg: json['icon_bg'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$DoctorCategoryImplToJson(
        _$DoctorCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'h1': instance.h1,
      'slug': instance.slug,
      'description': instance.description,
      'pic': instance.pic,
      'meta_title': instance.metaTitle,
      'meta_key': instance.metaKey,
      'meta_desc': instance.metaDesc,
      'published_on': instance.publishedOn?.toIso8601String(),
      'dis_order': instance.disOrder,
      'icon': instance.icon,
      'icon_bg': instance.iconBg,
      'status': instance.status,
    };
