import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:qris_health/modules/all_scans_module/models/category_res/test_and_risk_category_res.dart';
import 'package:qris_health/modules/all_scans_module/models/risk_area_category/risk_area_category.dart';
import 'package:qris_health/modules/all_scans_module/models/test_category_model/test_category_model.dart';
import 'package:qris_health/modules/all_scans_module/services/test_service.dart';

part 'tests_category_state.dart';

class TestsCategoryCubit extends Cubit<TestsCategoryState> {
  TestsCategoryCubit() : super(TestsCategoryInitial());

  Future<void> getTestsCategories() async {
    try {
      emit(TestsCategoryLoading());
      final res = await TestService.getTestCategories();
      emit(TestsCategoryLoaded(res: res));
    } catch (e) {
      emit(TestsCategoryLoadingError(
          res: state.res, errorMessage: e.toString()));
    }
  }

  TestCategoryModel? getTestCategoryById(int? initialCategoryId) {
    return state.res.testCategories
        .firstWhereOrNull((element) => element.id == initialCategoryId);
  }

  RiskAreaCategory? getRiskCategoryById(int? initialCategoryId) {
    return state.res.riskCategories
        .firstWhereOrNull((element) => element.id == initialCategoryId);
  }
}
