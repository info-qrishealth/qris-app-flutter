// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppBannerImpl _$$AppBannerImplFromJson(Map<String, dynamic> json) =>
    _$AppBannerImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      buttonText: json['buttonText'] as String,
      onTap: json['onTap'] as String,
      image: json['image'] as String,
      buttonBackgroundColor: json['buttonBackgroundColor'] as String?,
      buttonTextColor: json['buttonTextColor'] as String?,
      backgroundColor1: json['backgroundColor1'] as String,
      backgroundColor2: json['backgroundColor2'] as String?,
    );

Map<String, dynamic> _$$AppBannerImplToJson(_$AppBannerImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'buttonText': instance.buttonText,
      'onTap': instance.onTap,
      'image': instance.image,
      'buttonBackgroundColor': instance.buttonBackgroundColor,
      'buttonTextColor': instance.buttonTextColor,
      'backgroundColor1': instance.backgroundColor1,
      'backgroundColor2': instance.backgroundColor2,
    };
