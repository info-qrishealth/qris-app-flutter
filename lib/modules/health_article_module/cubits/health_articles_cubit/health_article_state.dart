part of 'health_article_cubit.dart';

sealed class HealthArticleState extends Equatable {
  final List<HealthArticle> healthArticles;
  const HealthArticleState({this.healthArticles = const []});

  @override
  List<Object> get props => [healthArticles];
}

final class HealthArticleInitial extends HealthArticleState {}

final class HealthArticleLoading extends HealthArticleState {}

final class HealthArticleLoaded extends HealthArticleState {
  const HealthArticleLoaded({required super.healthArticles});
}

final class HealthArticleLoadingError extends HealthArticleState {
  final String errorMessage;
  const HealthArticleLoadingError(
      {required this.errorMessage, super.healthArticles});
}
