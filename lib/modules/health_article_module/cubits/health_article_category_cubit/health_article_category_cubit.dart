import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qris_health/modules/health_article_module/models/health_article_category/health_article_category.dart';
import 'package:qris_health/modules/health_article_module/services/health_article_service.dart';

part 'health_article_category_state.dart';

class HealthArticleCategoryCubit extends Cubit<HealthArticleCategoryState> {
  HealthArticleCategoryCubit() : super(HealthArticleCategoryInitial());

  Future<void> getAllCategories() async {
    try {
      emit(HealthArticleCategoryLoading());
      final categories =
          await HealthArticleService.getHealthArticleCategories();
      emit(HealthArticleCategoryLoaded(categories: categories));
    } catch (e) {
      emit(HealthArticleCategoryLoadingError(
          categories: state.categories, errorMessage: e.toString()));
    }
  }
}
