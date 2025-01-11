// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_article_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HealthArticleCategoryImpl _$$HealthArticleCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$HealthArticleCategoryImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      disOrder: json['dis_order'] as String,
      status: json['status'] as String,
      metaTitle: json['meta_title'] as String,
      metaKey: json['meta_key'] as String,
      metaDesc: json['meta_desc'] as String,
      canonical: json['canonical'] as String,
      slug: json['slug'] as String,
      pic: json['pic'] as String,
      altTag: json['alt_tag'] as String,
    );

Map<String, dynamic> _$$HealthArticleCategoryImplToJson(
        _$HealthArticleCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'dis_order': instance.disOrder,
      'status': instance.status,
      'meta_title': instance.metaTitle,
      'meta_key': instance.metaKey,
      'meta_desc': instance.metaDesc,
      'canonical': instance.canonical,
      'slug': instance.slug,
      'pic': instance.pic,
      'alt_tag': instance.altTag,
    };
