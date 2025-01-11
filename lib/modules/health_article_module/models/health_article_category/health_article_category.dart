import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_article_category.freezed.dart';
part 'health_article_category.g.dart';

@freezed
class HealthArticleCategory with _$HealthArticleCategory {
    const factory HealthArticleCategory({
        required int id,
        required String title,
        @JsonKey(name: 'dis_order') required String disOrder,
        required String status,
        @JsonKey(name: 'meta_title') required String metaTitle,
        @JsonKey(name: 'meta_key') required String metaKey,
        @JsonKey(name: 'meta_desc') required String metaDesc,
        required String canonical,
        required String slug,
        required String pic,
        @JsonKey(name: 'alt_tag') required String altTag,
    }) = _HealthArticleCategory;

    factory HealthArticleCategory.fromJson(Map<String, dynamic> json) =>
        _$HealthArticleCategoryFromJson(json);
}
