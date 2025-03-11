part of 'qris_wallet_cubit.dart';

sealed class QrisWalletState extends Equatable {
  final List<QrisWalletEntry> entries;
  const QrisWalletState({this.entries = const []});

  @override
  List<Object> get props => [entries];
}

final class QrisWalletInitial extends QrisWalletState {}

final class QrisWalletLoading extends QrisWalletState {}

final class QrisWalletLoaded extends QrisWalletState {
  const QrisWalletLoaded({required super.entries});
}

final class QrisWalletLoadingError extends QrisWalletState {
  final String errorMessage;
  const QrisWalletLoadingError(
      {required super.entries, required this.errorMessage});
}
