import 'dart:convert';

import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/health_score_module/models/health_score_req_body/health_score_req_body.dart';
import 'package:qris_health/modules/health_score_module/models/health_score_res_model/health_score_res_model.dart';
import 'package:qris_health/shared/utils/wrappers/wrapper.dart';

class HealthScoreService {
  static Future<HealthScoreResModel?> getPatientHealthScore(
      {required String patientId}) async {
    final url = '${AppConstants.baseUrl}/health-score/$patientId';

    try {
      final response = await Wrapper.get(url);
      final body = json.decode(response)['body'];
      if (body == null) {
        return null;
      }

      return HealthScoreResModel.fromJson(body);
    } catch (e) {
      rethrow;
    }
  }

  static Future<HealthScoreResModel> addPatientHealthScore(
      {required HealthScoreReqBody healthScoreReqBody}) async {
    final url = '${AppConstants.baseUrl}/health-score';

    try {
      final response =
          await Wrapper.post(url, json.encode(healthScoreReqBody.toJson()));
      return HealthScoreResModel.fromJson(json.decode(response)['body']);
    } catch (e) {
      rethrow;
    }
  }
}
