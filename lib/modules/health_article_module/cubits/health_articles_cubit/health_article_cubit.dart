import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qris_health/modules/health_article_module/models/health_article/health_article.dart';
import 'package:qris_health/modules/health_article_module/services/health_article_service.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';

part 'health_article_state.dart';

class HealthArticleCubit extends Cubit<HealthArticleState> {
  HealthArticleCubit() : super(HealthArticleInitial());

  Future<void> getAllArticles() async {
    try {
      emit(HealthArticleLoading());
      final articles = await HealthArticleService.getAllHealthArticles();
      emit(HealthArticleLoaded(healthArticles: articles));
    } catch (e) {
      emit(HealthArticleLoadingError(
          errorMessage: e.toString(), healthArticles: state.healthArticles));
    }
  }

  List<HealthArticle> getRecentArticles() {
    final articles = [...state.healthArticles]
        .where((element) => element.dateTime != null && element.status == 1)
        .toList();

    articles.sort((a, b) =>
        b.dateTime.toDateTime?.compareTo(a.dateTime.toDateTime!) ?? 0);

    return articles;
  }

  List<HealthArticle> getArticlesByCategory(int id) {
    return state.healthArticles.where((element) {
      final categoryIds = element.category?.split(',');

      if (categoryIds != null && categoryIds.isNotEmpty) {
        return categoryIds.any((element) => element == id.toString());
      }

      return false;
    }).toList();
  }

  List<HealthArticle> getTopArticles() {
    final articles = [...state.healthArticles];
    articles.shuffle(Random());
    return articles;

  }
}
