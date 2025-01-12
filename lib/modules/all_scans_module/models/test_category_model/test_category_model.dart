import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_category_model.freezed.dart';
part 'test_category_model.g.dart';

@freezed
class TestCategoryModel with _$TestCategoryModel {
  const factory TestCategoryModel({
    required int id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'heading') required String heading,
    @JsonKey(name: 'short_desc') required String shortDesc,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'header_description') required String headerDescription,
    @JsonKey(name: 'faq') required String faq,
    @JsonKey(name: 'pic') required String pic,
    @JsonKey(name: 'dis_order') required String disOrder,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'test_by_habits') required String testByHabits,
    @JsonKey(name: 'meta_title') required String metaTitle,
    @JsonKey(name: 'meta_key') required String metaKey,
    @JsonKey(name: 'meta_desc') required String metaDesc,
    @JsonKey(name: 'canonical') required String canonical,
    @JsonKey(name: 'slug') required String slug,
  }) = _TestCategoryModel;

  factory TestCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$TestCategoryModelFromJson(json);
}
