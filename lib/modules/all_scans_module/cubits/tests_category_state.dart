part of 'tests_category_cubit.dart';

sealed class TestsCategoryState extends Equatable {
  final TestAndRiskCategoryRes res;
  const TestsCategoryState({this.res = const TestAndRiskCategoryRes()});

  @override
  List<Object> get props => [res];
}

final class TestsCategoryInitial extends TestsCategoryState {}

final class TestsCategoryLoading extends TestsCategoryState {}

final class TestsCategoryLoaded extends TestsCategoryState {
  const TestsCategoryLoaded({required super.res});
}

final class TestsCategoryLoadingError extends TestsCategoryState {
  final String errorMessage;
  const TestsCategoryLoadingError(
      {required super.res, required this.errorMessage});
}
