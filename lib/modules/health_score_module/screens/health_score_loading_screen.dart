import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';
import 'package:qris_health/modules/health_score_module/models/health_score_req_body/health_score_req_body.dart';
import 'package:qris_health/modules/health_score_module/screens/health_score_result_screen.dart';
import 'package:qris_health/modules/health_score_module/services/health_score_service.dart';
import 'package:qris_health/styles/app_colors.dart';

class HealthScoreLoadingScreen extends StatefulWidget {
  final HealthScoreReqBody healthScoreReqBody;
  const HealthScoreLoadingScreen({super.key, required this.healthScoreReqBody});

  @override
  State<HealthScoreLoadingScreen> createState() =>
      _HealthScoreLoadingScreenState();
}

class _HealthScoreLoadingScreenState extends State<HealthScoreLoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () async {
      try {
        final healthScoreResModel =
            await HealthScoreService.addPatientHealthScore(
                healthScoreReqBody: widget.healthScoreReqBody);

        Navigator.of(context).pushReplacement(CupertinoPageRoute(
            builder: (context) => HealthScoreResultScreen(
                healthScoreResModel: healthScoreResModel)));
      } catch (e) {
        AppConstants.showSnackbar(text: e.toString(), type: SnackbarType.error);
      }
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
