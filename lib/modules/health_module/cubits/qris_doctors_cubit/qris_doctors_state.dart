part of 'qris_doctors_cubit.dart';

sealed class QrisDoctorsState extends Equatable {
  final List<QrisTeamDoctor> doctors;
  const QrisDoctorsState({this.doctors = const []});

  @override
  List<Object> get props => [doctors];
}

final class QrisDoctorsInitial extends QrisDoctorsState {}

final class QrisDoctorsLoading extends QrisDoctorsState {}

final class QrisDoctorsLoaded extends QrisDoctorsState {
  const QrisDoctorsLoaded({required super.doctors});
}

final class QrisDoctorsLoadingError extends QrisDoctorsState {
  final String errorMessage;
  const QrisDoctorsLoadingError(
      {required this.errorMessage, required super.doctors});
}
