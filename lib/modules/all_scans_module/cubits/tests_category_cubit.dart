import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qris_health/modules/all_scans_module/models/test_category_model/test_category_model.dart';
import 'package:qris_health/modules/all_scans_module/services/test_service.dart';

part 'tests_category_state.dart';

class TestsCategoryCubit extends Cubit<TestsCategoryState> {
  TestsCategoryCubit() : super(TestsCategoryInitial());

  Future<void> getTestsCategories() async {
    try {
      emit(TestsCategoryLoading());
      final categories = await TestService.getTestCategories();
      emit(TestsCategoryLoaded(categories: categories));
    } catch (e) {
      emit(TestsCategoryLoadingError(
          categories: state.categories, errorMessage: e.toString()));
    }
  }
}
