import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qris_health/modules/all_scans_module/models/risk_area_category/risk_area_category.dart';
import 'package:qris_health/modules/all_scans_module/models/test_category_model/test_category_model.dart';

part 'test_and_risk_category_res.freezed.dart';
part 'test_and_risk_category_res.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class TestAndRiskCategoryRes with _$TestAndRiskCategoryRes {
  const factory TestAndRiskCategoryRes(
          {@Default([]) List<RiskAreaCategory> riskCategories,
          @Default([]) List<TestCategoryModel> testCategories}) =
      _TestAndRiskCategoryRes;

  factory TestAndRiskCategoryRes.fromJson(Map<String, dynamic> json) =>
      _$TestAndRiskCategoryResFromJson(json);
}
