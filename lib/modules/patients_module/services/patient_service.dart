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
}
