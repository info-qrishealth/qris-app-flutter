import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/health_score_module/components/health_score_list_tile.dart';
import 'package:qris_health/modules/health_score_module/components/heath_score_info_tile.dart';
import 'package:qris_health/modules/health_score_module/screens/health_score_screen.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/styles/app_colors.dart';

class HealthScoreIntroScreen extends StatefulWidget {
  const HealthScoreIntroScreen({super.key});

  @override
  State<HealthScoreIntroScreen> createState() => _HealthScoreIntroScreenState();
}

class _HealthScoreIntroScreenState extends State<HealthScoreIntroScreen> {
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue),
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => HealthScoreScreen()));
                },
                child: Text('Start Assessment'))),
        appBar: CommonAppBar(title: 'Health Score'),
        body: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
                horizontal: AppConstants.scaffoldPadding, vertical: 20),
            children: [
              Image.asset(
                  'assets/images/illustrations/health_score_illustration.png'),
              SizedBox(height: 24),
              Text(
                  'Healthy you in few clicks!\nTake the assessment, get your roadmap.',
                  style: _textTheme.titleMedium!.copyWith(
                      height: 1.3,
                      fontFamily: AppConstants.latoFontFamily,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textColor)),
              SizedBox(height: 16),
              DottedBorder(
                  dashPattern: [3, 3],
                  color: AppColors.borderColor,
                  padding: EdgeInsets.all(10),
                  radius: Radius.circular(15),
                  borderType: BorderType.RRect,
                  child: Column(children: [
                    HealthScoreListTile(
                        imagePath:
                            'assets/images/icons/health_score_icons/assesment_icon.png',
                        title: 'Take Assessment'),
                    SizedBox(height: 20),
                    HealthScoreListTile(
                        imagePath:
                            'assets/images/icons/health_score_icons/health_score_icon.png',
                        title: 'Know your Health Score'),
                    SizedBox(height: 20),
                    HealthScoreListTile(
                        imagePath:
                            'assets/images/icons/health_score_icons/invest_icon.png',
                        title: 'Invest in You'),
                  ])),
              SizedBox(height: 16),
              Text('Why knowing Health Score is crucial?',
                  style: _textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textColor,
                      fontFamily: AppConstants.latoFontFamily)),
              SizedBox(height: 16),
              DottedBorder(
                  dashPattern: [3, 3],
                  color: AppColors.borderColor,
                  padding: EdgeInsets.all(10),
                  radius: Radius.circular(15),
                  borderType: BorderType.RRect,
                  child: Column(children: [
                    HealthScoreInfoTile(
                        title: 'Know Your Blueprint',
                        description:
                            'Gain a clear map of your health, highlighting strengths and areas to improve.',
                        imagePath:
                            'assets/images/icons/health_score_icons/blueprint_icon.png'),
                    SizedBox(height: 10),
                    HealthScoreInfoTile(
                        title: 'Empower Your Choices',
                        description:
                            'Make confident decisions with insights tailored to your well-being.',
                        imagePath:
                            'assets/images/icons/health_score_icons/empower_icon.png'),
                    SizedBox(height: 10),
                    HealthScoreInfoTile(
                        title: 'Track Your Progress',
                        description:
                            'See how your efforts pay off and stay motivated on your health journey.',
                        imagePath:
                            'assets/images/icons/health_score_icons/progress_icon.png'),
                    SizedBox(height: 10),
                    HealthScoreInfoTile(
                        title: 'Invest in Your Future',
                        description:
                            'Prioritize your health—your greatest asset—for a better tomorrow.',
                        imagePath:
                            'assets/images/icons/health_score_icons/invest.png'),
                  ]))
            ]));
  }
}
