// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HealthArticleImpl _$$HealthArticleImplFromJson(Map<String, dynamic> json) =>
    _$HealthArticleImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      relatedBlog: json['related_blog'] as String?,
      pic: json['pic'] as String?,
      altTag: json['alt_tag'] as String?,
      shortDesc: json['short_desc'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      authorName: json['author_name'] as String?,
      dateTime: json['date_time'] as String?,
      slug: json['slug'] as String?,
      metaTitle: json['meta_title'] as String?,
      metaKey: json['meta_key'] as String?,
      metaDesc: json['meta_desc'] as String?,
      canonical: json['canonical'] as String?,
      disOrder: (json['dis_order'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      relatedPackage: json['related_package'] as String?,
    );

Map<String, dynamic> _$$HealthArticleImplToJson(_$HealthArticleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'related_blog': instance.relatedBlog,
      'pic': instance.pic,
      'alt_tag': instance.altTag,
      'short_desc': instance.shortDesc,
      'description': instance.description,
      'category': instance.category,
      'author_name': instance.authorName,
      'date_time': instance.dateTime,
      'slug': instance.slug,
      'meta_title': instance.metaTitle,
      'meta_key': instance.metaKey,
      'meta_desc': instance.metaDesc,
      'canonical': instance.canonical,
      'dis_order': instance.disOrder,
      'status': instance.status,
      'related_package': instance.relatedPackage,
    };
