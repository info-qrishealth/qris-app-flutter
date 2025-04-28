// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_package_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TestPackageModelImpl _$$TestPackageModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TestPackageModelImpl(
      id: (json['id'] as num).toInt(),
      bookingTestId: json['booking_test_id'] as String?,
      parent: json['parent'] as String?,
      type: $enumDecodeNullable(_$TestPackageTypeEnumMap, json['type']),
      package: json['package'] as String?,
      test: json['test'] as String?,
      title: json['title'] as String?,
      productH1: json['product_h1'] as String?,
      parameters: json['parameters'] as String?,
      productH3: json['product_h3'] as String?,
      shortDesc: json['short_desc'] as String?,
      description: json['description'] as String?,
      demoVideo: json['demo_video'] as String?,
      courseType: json['course_type'] as String?,
      price: (json['price'] as num?)?.toInt(),
      specialPrice: (json['special_price'] as num?)?.toInt(),
      discount: (json['discount'] as num?)?.toInt(),
      disallowed: (json['disallowed'] as num?)?.toInt(),
      popular: (json['popular'] as num?)?.toInt(),
      relatedPro: json['related_pro'] as String?,
      riskArea: json['risk_area'] as String?,
      fastingTime: json['fasting_time'] as String?,
      pic: json['pic'] as String?,
      customParameterCount: (json['custom_parameter_count'] as num?)?.toInt(),
      questions: json['questions'] as String?,
      metaTitle: json['meta_title'] as String?,
      metaKey: json['meta_key'] as String?,
      metaDesc: json['meta_desc'] as String?,
      canonical: json['canonical'] as String?,
      slug: json['slug'] as String?,
      sampleType: json['sample_type'] as String?,
      tubeType: json['tube_type'] as String?,
      wellness: json['wellness'] as String?,
      teamIds: json['team_ids'] as String?,
      status: json['status'] as String?,
      disOrder: json['dis_order'] as String?,
      scanType: json['scan_type'] as String?,
      rpDescription: json['r_p_description'] as String?,
      reviewCount: json['review_count'] as String?,
      includedPackages: (json['included_packages'] as List<dynamic>?)
              ?.map((e) => IncludedPackage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      rating: json['rating'] as String?,
    );

Map<String, dynamic> _$$TestPackageModelImplToJson(
        _$TestPackageModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'booking_test_id': instance.bookingTestId,
      'parent': instance.parent,
      'type': _$TestPackageTypeEnumMap[instance.type],
      'package': instance.package,
      'test': instance.test,
      'title': instance.title,
      'product_h1': instance.productH1,
      'parameters': instance.parameters,
      'product_h3': instance.productH3,
      'short_desc': instance.shortDesc,
      'description': instance.description,
      'demo_video': instance.demoVideo,
      'course_type': instance.courseType,
      'price': instance.price,
      'special_price': instance.specialPrice,
      'discount': instance.discount,
      'disallowed': instance.disallowed,
      'popular': instance.popular,
      'related_pro': instance.relatedPro,
      'risk_area': instance.riskArea,
      'fasting_time': instance.fastingTime,
      'pic': instance.pic,
      'custom_parameter_count': instance.customParameterCount,
      'questions': instance.questions,
      'meta_title': instance.metaTitle,
      'meta_key': instance.metaKey,
      'meta_desc': instance.metaDesc,
      'canonical': instance.canonical,
      'slug': instance.slug,
      'sample_type': instance.sampleType,
      'tube_type': instance.tubeType,
      'wellness': instance.wellness,
      'team_ids': instance.teamIds,
      'status': instance.status,
      'dis_order': instance.disOrder,
      'scan_type': instance.scanType,
      'r_p_description': instance.rpDescription,
      'review_count': instance.reviewCount,
      'included_packages': instance.includedPackages,
      'rating': instance.rating,
    };

const _$TestPackageTypeEnumMap = {
  TestPackageType.test: 'test',
  TestPackageType.package: 'package',
  TestPackageType.sub_package: 'sub_package',
};

_$IncludedPackageImpl _$$IncludedPackageImplFromJson(
        Map<String, dynamic> json) =>
    _$IncludedPackageImpl(
      title: json['title'] as String?,
      customParameterCount:
          (json['custom_parameter_count'] as num?)?.toInt() ?? 0,
      testNames: (json['test_names'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$IncludedPackageImplToJson(
        _$IncludedPackageImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'custom_parameter_count': instance.customParameterCount,
      'test_names': instance.testNames,
    };
