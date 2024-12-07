import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/modules/home_module/screens/home_screen.dart';
import 'package:qris_health/modules/intro_module/screens/custom_splash_screen.dart';
import 'package:qris_health/styles/app_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Qris Health',
        theme: AppStyles.theme(context),
        home: HomeScreen());
  }
}
