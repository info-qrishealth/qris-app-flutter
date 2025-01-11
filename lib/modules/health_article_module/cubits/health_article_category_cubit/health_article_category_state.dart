part of 'health_article_category_cubit.dart';

sealed class HealthArticleCategoryState extends Equatable {
  final List<HealthArticleCategory> categories;
  const HealthArticleCategoryState({this.categories = const []});

  @override
  List<Object> get props => [categories];
}

final class HealthArticleCategoryInitial extends HealthArticleCategoryState {}

final class HealthArticleCategoryLoading extends HealthArticleCategoryState {}

final class HealthArticleCategoryLoaded extends HealthArticleCategoryState {
  const HealthArticleCategoryLoaded({required super.categories});
}

final class HealthArticleCategoryLoadingError
    extends HealthArticleCategoryState {
  final String errorMessage;
  const HealthArticleCategoryLoadingError(
      {required super.categories, required this.errorMessage});
}
