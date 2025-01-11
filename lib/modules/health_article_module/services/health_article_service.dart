import 'dart:convert';

import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/health_article_module/models/health_article/health_article.dart';
import 'package:qris_health/modules/health_article_module/models/health_article_category/health_article_category.dart';
import 'package:qris_health/shared/utils/wrappers/wrapper.dart';

class HealthArticleService {
  static Future<List<HealthArticle>> getAllHealthArticles() async {
    final url = '${AppConstants.baseUrl}/articles';

    try {
      final response = await Wrapper.get(url);

      final articles = (json.decode(response)['body'] as List)
          .map((element) => HealthArticle.fromJson(element))
          .toList();

      return articles;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<HealthArticleCategory>>
      getHealthArticleCategories() async {
    final url = '${AppConstants.baseUrl}/articles/categories';

    try {
      final response = await Wrapper.get(url);

      final articles = (json.decode(response)['body'] as List)
          .map((element) => HealthArticleCategory.fromJson(element))
          .toList();

      return articles;
    } catch (e) {
      rethrow;
    }
  }
}
