import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qris_health/modules/all_scans_module/models/test_package_model/test_package_model.dart';
import 'package:qris_health/modules/all_scans_module/services/test_service.dart';

part 'popular_packages_state.dart';

class PopularPackagesCubit extends Cubit<PopularPackagesState> {
  PopularPackagesCubit() : super(PopularPackagesInitial());

  Future<void> getPopularPackages() async {
    try {
      emit(PopularPackagesLoading());
      final packages = await TestService.getMiniPopularTests();
      emit(PopularPackagesLoaded(popularPackages: packages.reversed.toList()));
    } catch (e) {
      emit(PopularPackagesLoadingError(
          errorMessage: e.toString(), popularPackages: state.popularPackages));
    }
  }
}
