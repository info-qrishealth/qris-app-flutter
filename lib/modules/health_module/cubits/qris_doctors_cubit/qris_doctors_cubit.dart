import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:qris_health/modules/doctor_consultation_module/services/doctor_service.dart';
import 'package:qris_health/shared/models/qris_team_doctor/qris_team_doctor.dart';

part 'qris_doctors_state.dart';

class QrisDoctorsCubit extends Cubit<QrisDoctorsState> {
  QrisDoctorsCubit() : super(QrisDoctorsInitial());

  Future<void> getTeamDoctors() async {
    try {
      emit(QrisDoctorsLoading());
      final doctors = await DoctorService.getQrisTeamDoctors();
      emit(QrisDoctorsLoaded(doctors: doctors));
    } catch (e) {
      emit(QrisDoctorsLoadingError(
          errorMessage: e.toString(), doctors: state.doctors));
    }
  }

  List<QrisTeamDoctor> getDoctorsByDoctorIds(List<int> doctorIds) {
    final List<QrisTeamDoctor> doctors = [];

    for (var doctor in state.doctors) {
      final searchedDoctor =
          doctorIds.firstWhereOrNull((id) => id == doctor.id);
      if (searchedDoctor != null) {
        doctors.add(doctor);
      }
    }

    return doctors;
  }
}
