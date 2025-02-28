import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/shared/models/qris_config/qris_config.dart';
import 'package:qris_health/shared/utils/wrappers/wrapper.dart';

part 'qris_config_state.dart';

class QrisConfigCubit extends Cubit<QrisConfigState> {
  QrisConfigCubit() : super(QrisConfigInitial());

  Future<void> getConfig() async {
    try {
      final url = '${AppConstants.baseUrl}/config';
      final response = await Wrapper.get(url);
      final config = QrisConfig.fromJson(json.decode(response)['body']);
      emit(QrisConfigLoaded(config: config));
    } catch (e) {
      rethrow;
    }
  }
}
