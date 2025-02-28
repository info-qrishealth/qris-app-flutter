part of 'qris_config_cubit.dart';

sealed class QrisConfigState extends Equatable {
  final QrisConfig? config;
  const QrisConfigState({this.config});

  @override
  List<Object?> get props => [config];
}

final class QrisConfigInitial extends QrisConfigState {}

final class QrisConfigLoaded extends QrisConfigState {
  const QrisConfigLoaded({required super.config});
}
