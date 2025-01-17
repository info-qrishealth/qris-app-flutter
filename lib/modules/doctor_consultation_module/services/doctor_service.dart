import 'dart:convert';

import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/doctor_consultation_module/models/doctor/doctor.dart';
import 'package:qris_health/modules/doctor_consultation_module/models/doctor_category/doctor_category.dart';
import 'package:qris_health/modules/doctor_consultation_module/models/doctor_education/doctor_education.dart';
import 'package:qris_health/modules/doctor_consultation_module/models/doctor_location/doctor_location.dart';
import 'package:qris_health/shared/utils/wrappers/wrapper.dart';

class DoctorService {
  static Future<List<DoctorCategory>> getDoctorCategories() async {
    final url = '${AppConstants.baseUrl}/doctors/categories';

    try {
      final response = await Wrapper.get(url);
      return (json.decode(response)['body'] as List)
          .map((element) => DoctorCategory.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<DoctorLocation>> getDoctorLocations() async {
    final url = '${AppConstants.baseUrl}/doctors/areas';

    try {
      final response = await Wrapper.get(url);

      return (json.decode(response)['body'] as List)
          .map((element) => DoctorLocation.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Doctor>> getDoctorsByAreaAndCategory(
      {required int areaId, required int categoryId}) async {
    final url =
        '${AppConstants.baseUrl}/doctors/category-and-area?areaId=$areaId&categoryId=$categoryId';

    try {
      final response = await Wrapper.get(url);
      return (json.decode(response)['body'] as List)
          .map((element) => Doctor.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Doctor>> getAllDoctors() async {
    final url = '${AppConstants.baseUrl}/doctors';

    try {
      final response = await Wrapper.get(url);
      return (json.decode(response)['body'] as List)
          .map((element) => Doctor.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<DoctorEducation>> getDoctorEducation(int id) async {
    final url = '${AppConstants.baseUrl}/doctors/education/$id';

    try {
      final response = await Wrapper.get(url);

      final educations = (json.decode(response)['body'] as List).map((element) {
        final education = DoctorEducation.fromJson(element);
        return education;
      }).toList();

      return educations;
    } catch (e) {
      rethrow;
    }
  }
}
