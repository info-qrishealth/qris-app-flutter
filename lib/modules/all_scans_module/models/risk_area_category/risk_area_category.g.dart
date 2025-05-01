// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'risk_area_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RiskAreaCategoryImpl _$$RiskAreaCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$RiskAreaCategoryImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      heading: json['heading'] as String,
      shortDesc: json['short_desc'] as String,
      description: json['description'] as String,
      headerDescription: json['header_description'] as String,
      faq: json['faq'] as String,
      pic: json['pic'] as String,
      disOrder: json['dis_order'] as String,
      status: json['status'] as String,
      metaTitle: json['meta_title'] as String,
      metaKey: json['meta_key'] as String,
      metaDesc: json['meta_desc'] as String,
      icon: json['icon'] as String?,
      iconBg: json['icon_bg'] as String?,
      canonical: json['canonical'] as String,
      slug: json['slug'] as String,
    );

Map<String, dynamic> _$$RiskAreaCategoryImplToJson(
        _$RiskAreaCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'heading': instance.heading,
      'short_desc': instance.shortDesc,
      'description': instance.description,
      'header_description': instance.headerDescription,
      'faq': instance.faq,
      'pic': instance.pic,
      'dis_order': instance.disOrder,
      'status': instance.status,
      'meta_title': instance.metaTitle,
      'meta_key': instance.metaKey,
      'meta_desc': instance.metaDesc,
      'icon': instance.icon,
      'icon_bg': instance.iconBg,
      'canonical': instance.canonical,
      'slug': instance.slug,
    };
