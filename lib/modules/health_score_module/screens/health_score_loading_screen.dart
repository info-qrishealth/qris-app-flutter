import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/modules/health_score_module/screens/health_score_result_screen.dart';
import 'package:qris_health/styles/app_colors.dart';

class HealthScoreLoadingScreen extends StatefulWidget {
  const HealthScoreLoadingScreen({super.key});

  @override
  State<HealthScoreLoadingScreen> createState() =>
      _HealthScoreLoadingScreenState();
}

class _HealthScoreLoadingScreenState extends State<HealthScoreLoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (context) => HealthScoreResultScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
          Center(child: CircularProgressIndicator()),
          SizedBox(height: 16),
          Text('We are calculating your Health Score',
              textAlign: TextAlign.center,
              style: textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.primaryPink)),
        ]));
  }
}
