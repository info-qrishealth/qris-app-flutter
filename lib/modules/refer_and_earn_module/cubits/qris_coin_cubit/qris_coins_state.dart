part of 'qris_coins_cubit.dart';

sealed class QrisCoinsState extends Equatable {
  final List<QrisCoin> coinEntries;
  const QrisCoinsState({this.coinEntries = const []});

  @override
  List<Object> get props => [coinEntries];
}

final class QrisCoinsInitial extends QrisCoinsState {}

final class QrisCoinsLoading extends QrisCoinsState {}

final class QrisCoinsLoaded extends QrisCoinsState {
  const QrisCoinsLoaded({required super.coinEntries});
}

final class QrisCoinsLoadingError extends QrisCoinsState {
  final String errorMessage;
  const QrisCoinsLoadingError(
      {required super.coinEntries, required this.errorMessage});
}
