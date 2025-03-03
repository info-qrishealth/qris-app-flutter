import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/users_module/cubits/user_cubit.dart';
import 'package:qris_health/shared/models/qris_config/qris_config.dart';
import 'package:qris_health/shared/utils/wrappers/wrapper.dart';

import '../models/callback_request/callback_request.dart';

class ConfigService {
  static Future<QrisConfig> getAppConfigs() async {
    final url = '${AppConstants.baseUrl}/config';

    try {
      final response = await Wrapper.get(url);
      return QrisConfig.fromJson(json.decode(response)['body']);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> requestCallback({required String query}) async {
    final url = '${AppConstants.baseUrl}/config/request-callback';

    try {
      final user = BlocProvider.of<UserCubit>(Get.context!).state.user;
      final callbackRequest = CallbackRequest(
          name: user.name!, phoneNumber: user.phone!, query: query);

      await Wrapper.post(url, json.encode(callbackRequest.toJson()));
    } catch (e) {
      rethrow;
    }
  }
}
