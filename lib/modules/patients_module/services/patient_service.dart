import 'dart:convert';

import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/patients_module/models/patient/patient.dart';
import 'package:qris_health/shared/utils/wrappers/wrapper.dart';

class PatientService {
  static Future<List<Patient>> getPatientsOfUser(
      {required String userId}) async {
    final url = '${AppConstants.baseUrl}/patients/$userId';

    try {
      final response = await Wrapper.get(url);
      return (json.decode(response)['body'] as List)
          .map((element) => Patient.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<Patient> addNewPatientForUser(
      {required String userId, required Patient patient}) async {
    final url = '${AppConstants.baseUrl}/patient/$userId';

    try {
      final response = await Wrapper.post(url, json.encode(patient.toJson()));
      return Patient.fromJson(json.decode(response)['body']);
    } catch (e) {
      rethrow;
    }
  }

  static Future<Patient> updatePatient(Patient patient) async {
    final url = '${AppConstants.baseUrl}/patient/${patient.userId}';

    try {
      final response = await Wrapper.put(url, json.encode(patient.toJson()));
      return Patient.fromJson(json.decode(response)['body']);
    } catch (e) {
      rethrow;
    }
  }
}
