import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/health_score_module/components/health_score_result_card.dart';
import 'package:qris_health/modules/health_score_module/screens/health_score_intro_screen.dart';
import 'package:qris_health/modules/health_score_module/screens/health_score_screen.dart';
import 'package:qris_health/modules/home_module/components/package_tile_horizontal.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/heading_text.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../../shared/components/outlined_icon_button.dart';

class HealthScoreResultScreen extends StatefulWidget {
  const HealthScoreResultScreen({super.key});

  @override
  State<HealthScoreResultScreen> createState() =>
      _HealthScoreResultScreenState();
}

class _HealthScoreResultScreenState extends State<HealthScoreResultScreen> {
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
            padding: EdgeInsets.all(16),
            child: SafeArea(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(CupertinoPageRoute(
                          builder: (context) => HealthScoreIntroScreen()));
                    },
                    child: Text('Start Assessment again')))),
        appBar: CommonAppBar(title: 'Health Score'),
        body: ListView(
            padding:
                EdgeInsets.symmetric(horizontal: AppConstants.scaffoldPadding),
            children: [
              SizedBox(height: 24),
              HealthScoreResultCard(),
              SizedBox(height: 16),
              Text(
                  "Thank you for taking the time to complete your health assessment! While it offers valuable insights, it's important to remember that no online tool can be completely accurate. For a more comprehensive picture, we recommend consulting with a healthcare professional.\n\nYour health assessment reveals a balanced picture. Some areas show great potential, While others offer opportunities for improvement. Let's focus on strengthening your X for even better overall health.",
                  style: _textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightSubTextColor)),
              SizedBox(height: 24),
              Row(children: [
                HeadingText(text: 'Suggested blood test packages'),
                Spacer(),
                OutlinedIconButton(
                    onTap: () {},
                    icon: Icon(Icons.arrow_forward_ios_outlined,
                        color: AppColors.primaryBlue, size: 16)),
              ]),
              SizedBox(height: 12),
              SizedBox(
                  height: 145,
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return PackageTileHorizontal(onBookNowTap: () {});
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 8);
                      },
                      itemCount: 10)),
              SizedBox(height: 16),
              Text('Top Articles',
                  style: _textTheme.titleMedium!
                      .copyWith(fontWeight: FontWeight.w700)),
              SizedBox(height: 12),
            ]));
  }
}
