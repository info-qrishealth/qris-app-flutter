import 'dart:convert';

import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/health_module/models/wellness_question/wellness_question.dart';
import 'package:qris_health/shared/utils/wrappers/wrapper.dart';

class WellnessService {
  static Future<List<WellnessQuestion>> getWellnessQuestions(
      {required String testId}) async {
    final url = '${AppConstants.baseUrl}/wellness/questions/$testId';

    try {
      final response = await Wrapper.get(url);
      return (json.decode(response)['body'] as List)
          .map((element) => WellnessQuestion.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
