import 'dart:convert';

import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/all_scans_module/models/test_category_model/test_category_model.dart';
import 'package:qris_health/modules/all_scans_module/models/test_package_model/test_package_model.dart';
import 'package:qris_health/shared/utils/wrappers/wrapper.dart';

class TestService {
  static Future<List<TestCategoryModel>> getTestCategories() async {
    final url = '${AppConstants.baseUrl}/tests/categories';

    try {
      final response = await Wrapper.get(url);
      return (json.decode(response)['body'] as List)
          .map((element) => TestCategoryModel.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<TestPackageModel>> getPopularTests() async {
    final url = '${AppConstants.baseUrl}/tests/popular';

    try {
      final response = await Wrapper.get(url);
      return (json.decode(response)['body'] as List)
          .map((element) => TestPackageModel.fromJson(element))
          .toList();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
