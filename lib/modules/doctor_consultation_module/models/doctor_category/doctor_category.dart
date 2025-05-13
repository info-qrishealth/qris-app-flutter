import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_category.freezed.dart';
part 'doctor_category.g.dart';

@freezed
class DoctorCategory with _$DoctorCategory {
  const factory DoctorCategory({
    required int id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'h1') String? h1,
    @JsonKey(name: 'slug') String? slug,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'pic') String? pic,
    @JsonKey(name: 'meta_title') String? metaTitle,
    @JsonKey(name: 'meta_key') String? metaKey,
    @JsonKey(name: 'meta_desc') String? metaDesc,
    @JsonKey(name: 'published_on') DateTime? publishedOn,
    @JsonKey(name: 'dis_order') int? disOrder,
    @JsonKey(name: 'icon') String? icon,
    @JsonKey(name: 'icon_bg') String? iconBg,
    @JsonKey(name: 'status') String? status,
  }) = _DoctorCategory;

  factory DoctorCategory.fromJson(Map<String, dynamic> json) =>
      _$DoctorCategoryFromJson(json);
}
