// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TestCategoryModelImpl _$$TestCategoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TestCategoryModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      heading: json['heading'] as String,
      shortDesc: json['shortDesc'] as String,
      description: json['description'] as String,
      headerDescription: json['headerDescription'] as String,
      faq: json['faq'] as String,
      pic: json['pic'] as String,
      disOrder: json['disOrder'] as String,
      status: json['status'] as String,
      testByHabits: json['testByHabits'] as String,
      metaTitle: json['metaTitle'] as String,
      metaKey: json['metaKey'] as String,
      metaDesc: json['metaDesc'] as String,
      canonical: json['canonical'] as String,
      slug: json['slug'] as String,
    );

Map<String, dynamic> _$$TestCategoryModelImplToJson(
        _$TestCategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'heading': instance.heading,
      'shortDesc': instance.shortDesc,
      'description': instance.description,
      'headerDescription': instance.headerDescription,
      'faq': instance.faq,
      'pic': instance.pic,
      'disOrder': instance.disOrder,
      'status': instance.status,
      'testByHabits': instance.testByHabits,
      'metaTitle': instance.metaTitle,
      'metaKey': instance.metaKey,
      'metaDesc': instance.metaDesc,
      'canonical': instance.canonical,
      'slug': instance.slug,
    };
