import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:qris_health/constants/api_params.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/all_scans_module/models/category_res/test_and_risk_category_res.dart';
import 'package:qris_health/modules/all_scans_module/models/faq/faq.dart';
import 'package:qris_health/modules/all_scans_module/models/test_package_model/test_package_model.dart';
import 'package:qris_health/shared/utils/wrappers/wrapper.dart';

class TestService {
  static Future<TestAndRiskCategoryRes> getTestCategories() async {
    final url = '${AppConstants.baseUrl}/tests/categories';

    try {
      final response = await Wrapper.get(url);
      return TestAndRiskCategoryRes.fromJson(json.decode(response)['body']);
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<TestPackageModel>> getMiniPopularTests() async {
    final url = '${AppConstants.baseUrl}/tests/mini-popular';

    try {
      final response = await Wrapper.get(url);
      return (json.decode(response)['body'] as List)
          .map((element) => TestPackageModel.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<TestPackageModel> getTestByTestId({required int id}) async {
    final url = '${AppConstants.baseUrl}/tests/$id';

    try {
      final response = await Wrapper.get(url);
      return TestPackageModel.fromJson(json.decode(response)['body']);
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<TestPackageModel>> getPackagesByCategory(
      {required int categoryOrRiskId}) async {
    final url =
        '${AppConstants.baseUrl}/tests/by-category-or-risk-id?categoryOrRiskId=$categoryOrRiskId';

    try {
      final response = await Wrapper.get(url);
      return (json.decode(response)['body'] as List)
          .map((element) => TestPackageModel.fromJson(element))
          .toSet()
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Faq>> getFaqsByTestId({required int testId}) async {
    final url = '${AppConstants.baseUrl}/tests/faqs/$testId';

    try {
      final response = await Wrapper.get(url);
      return (json.decode(response)['body'] as List)
          .map((element) => Faq.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<TestPackageModel>> getTestsByTestIds(
      {required List<int> testIds}) async {
    final url = '${AppConstants.baseUrl}/tests';

    try {
      final response = await Wrapper.post(url, json.encode(testIds));

      return (json.decode(response)['body'] as List)
          .map((element) => TestPackageModel.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<TestPackageModel>> getAllTests() async {
    final url = '${AppConstants.baseUrl}/tests';

    try {
      final response = await Wrapper.get(url);
      return (json.decode(response)['body'] as List)
          .map((element) => TestPackageModel.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> trackTestSearch({
    int? testId,
    String? searchQuery,
    String? scanName,
  }) async {
    try {
      final userId = ApiParams.getInstance()?.userId;
      if (userId == null) return;

      if (_lastTrackingCall != null && 
          _lastTrackingCall!['userId'] == userId && 
          _lastTrackingCall!['testId'] == testId &&
          DateTime.now().difference(_lastTrackingCall!['timestamp']).inSeconds < 5) {
        return;
      }

      final url = '${AppConstants.baseUrl}/tests/track-search';
      final body = json.encode({
        'userId': userId,
        if (testId != null) 'testId': testId,
        if (searchQuery != null) 'searchQuery': searchQuery,
        if (scanName != null) 'scanName': scanName,
      });

      await Wrapper.post(url, body);
      
      _lastTrackingCall = {
        'userId': userId,
        'testId': testId,
        'timestamp': DateTime.now()
      };
    } catch (e) {
      debugPrint('Tracking error: $e');
    }
  }

  static Map<String, dynamic>? _lastTrackingCall;

  static int? getScanTestId(String scanName) {
    final scanTestIdMap = {
      'ECG Test': 368,
      'CT Scan': 368,
      'Ultrasound': 368,
      'ECHO Test': 368,
      'EEG Test': 368,
      'DEXA Test': 368,
      'PFT Test': 368,
      'MRI': 368,
      'Holter Test': 368,
      'Color Doppler': 368,
    };
    return scanTestIdMap[scanName];
  }
}
