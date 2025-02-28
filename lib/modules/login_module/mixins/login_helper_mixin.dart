import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qris_health/constants/api_params.dart';
import 'package:qris_health/constants/pref_constants.dart';
import 'package:qris_health/modules/health_module/cubits/qris_doctors_cubit/qris_doctors_cubit.dart';
import 'package:qris_health/modules/home_module/popular_packages_cubit/popular_packages_cubit.dart';
import 'package:qris_health/shared/cubits/qris_config_cubit/qris_config_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home_module/screens/home_screen.dart';
import '../../users_module/cubits/user_cubit.dart';
import '../models/user/user.dart';

mixin LoginHelperMixin {
  Future<void> operationsForLogin(
      {required BuildContext context, required User user}) async {
    try {
      BlocProvider.of<UserCubit>(context).updateUser(user: user);
      BlocProvider.of<PopularPackagesCubit>(context).getPopularPackages();
      BlocProvider.of<QrisDoctorsCubit>(context).getTeamDoctors();
      await BlocProvider.of<QrisConfigCubit>(context).getConfig();

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          PrefConstants.authToken, ApiParams.getInstance()!.authorization!);
      await prefs.setString(PrefConstants.phoneNumber, user.phone!);
      ApiParams.getInstance()!.userId = user.id;

      Navigator.of(context).pushAndRemoveUntil(
          CupertinoPageRoute(builder: (context) => HomeScreen()), (_) => false);
    } catch (e) {
      rethrow;
    }
  }
}
