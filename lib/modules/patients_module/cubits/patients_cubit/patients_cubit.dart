import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/api_params.dart';
import 'package:qris_health/modules/patients_module/models/patient/patient.dart';
import 'package:qris_health/modules/patients_module/services/patient_service.dart';
import 'package:qris_health/shared/extensions/date_time_extension.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';

part 'patients_state.dart';

class PatientsCubit extends Cubit<PatientsState> {
  PatientsCubit() : super(PatientsInitial());

  List<Patient> get validPatients =>
      state.patients.where((element) => element.status == '1').toList();

  Future<void> getAllPatientsForUser() async {
    try {
      emit(PatientsLoading());
      final patients = await PatientService.getPatientsOfUser(
          userId: ApiParams.getInstance()!.userId!.toString());
      emit(PatientsLoaded(patients: patients));
    } catch (e) {
      emit(PatientsLoadingError(
          errorMessage: e.toString(), patients: state.patients));
    }
  }

  void _updatePatients({required List<Patient> patients}) {
    emit(PatientsLoaded(patients: patients));
  }

  String? getFormattedAgeOfPatient({required int? patientId}) {
    final patient =
        state.patients.firstWhereOrNull((element) => element.id == patientId);

    if (patient == null || patient.dob?.toDateTime == null) {
      return null;
    }

    return patient.dob.toDateTime?.formattedAge;
  }

  void addNewPatient(Patient patient) {
    _updatePatients(patients: [...state.patients, patient]);
  }

  void updatePatient(Patient patient) {
    final index =
        state.patients.indexWhere((element) => element.id == patient.id);
    if (index != -1) {
      final patients = [...state.patients];
      patients.removeAt(index);
      _updatePatients(patients: [...patients]..insert(index, patient));
    }
  }
}
