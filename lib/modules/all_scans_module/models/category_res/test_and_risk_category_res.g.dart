// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_and_risk_category_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TestAndRiskCategoryResImpl _$$TestAndRiskCategoryResImplFromJson(
        Map<String, dynamic> json) =>
    _$TestAndRiskCategoryResImpl(
      riskCategories: (json['riskCategories'] as List<dynamic>?)
              ?.map((e) => RiskAreaCategory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      testCategories: (json['testCategories'] as List<dynamic>?)
              ?.map(
                  (e) => TestCategoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TestAndRiskCategoryResImplToJson(
        _$TestAndRiskCategoryResImpl instance) =>
    <String, dynamic>{
      'riskCategories': instance.riskCategories,
      'testCategories': instance.testCategories,
    };
