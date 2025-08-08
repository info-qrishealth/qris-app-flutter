// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chronic_disease_package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChronicDiseasePackageImpl _$$ChronicDiseasePackageImplFromJson(
        Map<String, dynamic> json) =>
    _$ChronicDiseasePackageImpl(
      title: json['title'] as String,
      idealFor: json['idealFor'] as String?,
      why: json['why'] as String?,
      includes: (json['includes'] as List<dynamic>)
          .map((e) => ChronicPackageItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      originalPrice: (json['originalPrice'] as num).toDouble(),
      discountedPrice: (json['discountedPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$$ChronicDiseasePackageImplToJson(
        _$ChronicDiseasePackageImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'idealFor': instance.idealFor,
      'why': instance.why,
      'includes': instance.includes,
      'originalPrice': instance.originalPrice,
      'discountedPrice': instance.discountedPrice,
    };

_$ChronicPackageItemImpl _$$ChronicPackageItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ChronicPackageItemImpl(
      type: $enumDecode(_$ChronicPackageItemTypeEnumMap, json['type']),
      title: json['title'] as String,
      details: json['details'] as String?,
    );

Map<String, dynamic> _$$ChronicPackageItemImplToJson(
        _$ChronicPackageItemImpl instance) =>
    <String, dynamic>{
      'type': _$ChronicPackageItemTypeEnumMap[instance.type]!,
      'title': instance.title,
      'details': instance.details,
    };

const _$ChronicPackageItemTypeEnumMap = {
  ChronicPackageItemType.blood_test: 'blood_test',
  ChronicPackageItemType.xray: 'xray',
  ChronicPackageItemType.consultation: 'consultation',
  ChronicPackageItemType.addon: 'addon',
};
