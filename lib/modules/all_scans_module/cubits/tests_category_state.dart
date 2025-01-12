part of 'tests_category_cubit.dart';

sealed class TestsCategoryState extends Equatable {
  final List<TestCategoryModel> categories;
  const TestsCategoryState({this.categories = const []});

  @override
  List<Object> get props => [categories];
}

final class TestsCategoryInitial extends TestsCategoryState {}

final class TestsCategoryLoading extends TestsCategoryState {}

final class TestsCategoryLoaded extends TestsCategoryState {
  const TestsCategoryLoaded({required super.categories});
}

final class TestsCategoryLoadingError extends TestsCategoryState {
  final String errorMessage;
  const TestsCategoryLoadingError(
      {required super.categories, required this.errorMessage});
}
