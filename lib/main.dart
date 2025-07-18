import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qris_health/modules/all_scans_module/cubits/tests_category_cubit.dart';
import 'package:qris_health/modules/health_article_module/cubits/health_article_category_cubit/health_article_category_cubit.dart';
import 'package:qris_health/modules/health_article_module/cubits/health_articles_cubit/health_article_cubit.dart';
import 'package:qris_health/modules/health_module/cubits/qris_doctors_cubit/qris_doctors_cubit.dart';
import 'package:qris_health/modules/home_module/popular_packages_cubit/popular_packages_cubit.dart';
import 'package:qris_health/modules/intro_module/screens/custom_splash_screen.dart';
import 'package:qris_health/modules/orders_modele/cart_cubit/cart_cubit.dart';
import 'package:qris_health/modules/patients_module/cubits/patients_cubit/patients_cubit.dart';
import 'package:qris_health/modules/refer_and_earn_module/cubits/qris_coin_cubit/qris_coins_cubit.dart';
import 'package:qris_health/modules/users_module/cubits/user_cubit.dart';
import 'package:qris_health/shared/cubits/qris_config_cubit/qris_config_cubit.dart';
import 'package:qris_health/styles/app_styles.dart';

import 'firebase_options.dart';
import 'modules/refer_and_earn_module/cubits/qris_wallet_cubit/qris_wallet_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HealthArticleCubit()),
          BlocProvider(create: (context) => HealthArticleCategoryCubit()),
          BlocProvider(create: (context) => TestsCategoryCubit()),
          BlocProvider(create: (context) => UserCubit()),
          BlocProvider(create: (context) => PopularPackagesCubit()),
          BlocProvider(create: (context) => PatientsCubit()),
          BlocProvider(create: (context) => QrisDoctorsCubit()),
          BlocProvider(create: (context) => QrisConfigCubit()),
          BlocProvider(create: (context) => CartCubit()),
          BlocProvider(create: (context) => QrisWalletCubit()),
          BlocProvider(create: (context) => QrisCoinsCubit()),
        ],
        child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Qris Health',
            theme: AppStyles.theme(context),
            home: CustomSplashScreen()));
  }
}
