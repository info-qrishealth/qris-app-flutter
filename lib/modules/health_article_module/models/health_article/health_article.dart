import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_article.freezed.dart';
part 'health_article.g.dart';

@freezed
class HealthArticle with _$HealthArticle {
  const factory HealthArticle(
          {required int id,
          required String title,
          @JsonKey(name: 'related_blog') String? relatedBlog,
          @JsonKey(name: 'pic') String? pic,
          @JsonKey(name: 'alt_tag') String? altTag,
          @JsonKey(name: 'short_desc') String? shortDesc,
          @JsonKey(name: 'description') String? description,
          @JsonKey(name: 'category') String? category,
          @JsonKey(name: 'author_name') String? authorName,
          @JsonKey(name: 'date_time') String? dateTime,
          @JsonKey(name: 'slug') String? slug,
          @JsonKey(name: 'meta_title') String? metaTitle,
          @JsonKey(name: 'meta_key') String? metaKey,
          @JsonKey(name: 'meta_desc') String? metaDesc,
          @JsonKey(name: 'canonical') String? canonical,
          @JsonKey(name: 'dis_order') int? disOrder,
          @JsonKey(name: 'status') int? status,
          @JsonKey(name: 'related_package') String? relatedPackage}) =
      _HealthArticle;

  factory HealthArticle.fromJson(Map<String, dynamic> json) =>
      _$HealthArticleFromJson(json);
}
