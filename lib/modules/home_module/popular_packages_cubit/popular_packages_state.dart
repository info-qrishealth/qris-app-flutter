part of 'popular_packages_cubit.dart';

sealed class PopularPackagesState extends Equatable {
  final List<TestPackageModel> popularPackages;
  const PopularPackagesState({this.popularPackages = const []});

  @override
  List<Object> get props => [popularPackages];
}

final class PopularPackagesInitial extends PopularPackagesState {}

final class PopularPackagesLoading extends PopularPackagesState {}

final class PopularPackagesLoaded extends PopularPackagesState {
  const PopularPackagesLoaded({required super.popularPackages});
}

final class PopularPackagesLoadingError extends PopularPackagesState {
  final String errorMessage;
  const PopularPackagesLoadingError(
      {required this.errorMessage, required super.popularPackages});
}
