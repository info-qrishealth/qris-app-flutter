import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_category_model.freezed.dart';
part 'test_category_model.g.dart';

@freezed
class TestCategoryModel with _$TestCategoryModel {
  const factory TestCategoryModel(
      {required int id,
      required String title,
      required String heading,
      required String shortDesc,
      required String description,
      required String headerDescription,
      required String faq,
      required String pic,
      required String disOrder,
      required String status,
      required String testByHabits,
      required String metaTitle,
      required String metaKey,
      required String metaDesc,
      required String canonical,
      required String slug}) = _TestCategoryModel;

  factory TestCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$TestCategoryModelFromJson(json);
}
