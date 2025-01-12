import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_package_model.freezed.dart';
part 'test_package_model.g.dart';

@freezed
class TestPackageModel with _$TestPackageModel {
  const factory TestPackageModel(
      {required int id,
      @JsonKey(name: 'booking_test_id') required String? bookingTestId,
      @JsonKey(name: 'parent') required String? parent,
      @JsonKey(name: 'type') required String? type,
      @JsonKey(name: 'package') required String? package,
      @JsonKey(name: 'test') required String? test,
      @JsonKey(name: 'title') required String? title,
      @JsonKey(name: 'product_h1') required String? productH1,
      @JsonKey(name: 'parameters') required String? parameters,
      @JsonKey(name: 'product_h3') required String? productH3,
      @JsonKey(name: 'short_desc') required String? shortDesc,
      @JsonKey(name: 'description') required String? description,
      @JsonKey(name: 'demo_video') required String? demoVideo,
      @JsonKey(name: 'course_type') required String? courseType,
      @JsonKey(name: 'price') required int? price,
      @JsonKey(name: 'special_price') required int? specialPrice,
      @JsonKey(name: 'discount') required int? discount,
      @JsonKey(name: 'disallowed') required int? disallowed,
      @JsonKey(name: 'popular') required int? popular,
      @JsonKey(name: 'related_pro') required String? relatedPro,
      @JsonKey(name: 'risk_area') required String? riskArea,
      @JsonKey(name: 'fasting_time') required String? fastingTime,
      @JsonKey(name: 'pic') required String? pic,
      @JsonKey(name: 'base_price') required String? basePrice,
      @JsonKey(name: 'custom_parameter_count')
      required int? customParameterCount,
      @JsonKey(name: 'questions') required String? questions,
      @JsonKey(name: 'meta_title') required String? metaTitle,
      @JsonKey(name: 'meta_key') required String? metaKey,
      @JsonKey(name: 'meta_desc') required String? metaDesc,
      @JsonKey(name: 'canonical') required String? canonical,
      @JsonKey(name: 'slug') required String? slug,
      @JsonKey(name: 'sample_type') required String? sampleType,
      @JsonKey(name: 'tube_type') required String? tubeType,
      @JsonKey(name: 'wellness') required String? wellness,
      @JsonKey(name: 'team_ids') required String? teamIds,
      @JsonKey(name: 'status') required String? status,
      @JsonKey(name: 'dis_order') required String? disOrder,
      @JsonKey(name: 'scan_type') required String? scanType,
      @JsonKey(name: 'r_p_description') required String? rpDescription,
      @JsonKey(name: 'review_count') required String? reviewCount,
      @JsonKey(name: 'rating') required String? rating}) = _TestPackageModel;

  factory TestPackageModel.fromJson(Map<String, dynamic> json) =>
      _$TestPackageModelFromJson(json);
}
