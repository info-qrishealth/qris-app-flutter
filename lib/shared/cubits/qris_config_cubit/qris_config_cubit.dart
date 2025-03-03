import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qris_health/shared/models/qris_config/qris_config.dart';
import 'package:qris_health/shared/services/config_services.dart';

part 'qris_config_state.dart';

class QrisConfigCubit extends Cubit<QrisConfigState> {
  QrisConfigCubit() : super(QrisConfigInitial());

  Future<void> getConfig() async {
    try {
      final config = await ConfigService.getAppConfigs();
      emit(QrisConfigLoaded(config: config));
    } catch (e) {
      rethrow;
    }
  }
}
