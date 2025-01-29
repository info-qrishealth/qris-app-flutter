part of 'patients_cubit.dart';

sealed class PatientsState extends Equatable {
  final List<Patient> patients;
  const PatientsState({this.patients = const []});

  @override
  List<Object> get props => [patients];
}

final class PatientsInitial extends PatientsState {}

final class PatientsLoading extends PatientsState {}

final class PatientsLoaded extends PatientsState {
  const PatientsLoaded({required super.patients});
}

final class PatientsLoadingError extends PatientsState {
  final String errorMessage;
  const PatientsLoadingError(
      {required this.errorMessage, required super.patients});
}
