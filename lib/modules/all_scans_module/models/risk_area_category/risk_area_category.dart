import 'package:freezed_annotation/freezed_annotation.dart';

part 'risk_area_category.freezed.dart';
part 'risk_area_category.g.dart';

@freezed
class RiskAreaCategory with _$RiskAreaCategory {
  const factory RiskAreaCategory(
      {required int id,
      @JsonKey(name: 'title') required String title,
      @JsonKey(name: 'heading') required String heading,
      @JsonKey(name: 'short_desc') required String shortDesc,
      @JsonKey(name: 'description') required String description,
      @JsonKey(name: 'header_description') required String headerDescription,
      @JsonKey(name: 'faq') required String faq,
      @JsonKey(name: 'pic') required String pic,
      @JsonKey(name: 'dis_order') required String disOrder,
      @JsonKey(name: 'status') required String status,
      @JsonKey(name: 'meta_title') required String metaTitle,
      @JsonKey(name: 'meta_key') required String metaKey,
      @JsonKey(name: 'meta_desc') required String metaDesc,
      @JsonKey(name: 'icon') String? icon,
      @JsonKey(name: 'icon_bg') String? iconBg,
      @JsonKey(name: 'canonical') required String canonical,
      @JsonKey(name: 'slug') required String slug}) = _RiskAreaCategory;

  factory RiskAreaCategory.fromJson(Map<String, dynamic> json) =>
      _$RiskAreaCategoryFromJson(json);
}
