import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qris_health/modules/all_scans_module/cubits/tests_category_cubit.dart';
import 'package:qris_health/modules/health_article_module/cubits/health_article_category_cubit/health_article_category_cubit.dart';
import 'package:qris_health/modules/health_article_module/cubits/health_articles_cubit/health_article_cubit.dart';
import 'package:qris_health/modules/intro_module/screens/custom_splash_screen.dart';
import 'package:qris_health/styles/app_styles.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        ],
        child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Qris Health',
            theme: AppStyles.theme(context),
            home: CustomSplashScreen()));
  }
}
