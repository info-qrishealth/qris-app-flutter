import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/health_module/components/why_choose_package_container.dart';
import 'package:qris_health/modules/health_module/screens/men_health_screen.dart';
import 'package:qris_health/modules/health_module/screens/mental_wellness_details_screen.dart';
import 'package:qris_health/modules/health_module/screens/women_health_screen.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/contact_us_container.dart';
import 'package:qris_health/shared/components/heading_text.dart';
import 'package:qris_health/shared/components/meet_the_team_carousel.dart';
import 'package:qris_health/styles/app_colors.dart';

class MentalWellnessScreen extends StatefulWidget {
  const MentalWellnessScreen({super.key});

  @override
  State<MentalWellnessScreen> createState() => _MentalWellnessScreenState();
}

class _MentalWellnessScreenState extends State<MentalWellnessScreen> {
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Wellness'),
        body: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
                vertical: 16, horizontal: AppConstants.scaffoldPadding),
            children: [
              Image.asset(
                  'assets/images/illustrations/mental_wellness_illustration.png'),
              SizedBox(height: 18),
              HeadingText(text: 'Categories to explore'),
              SizedBox(height: 16),
              Row(children: [
                Expanded(
                    child: _buildWellnessCard(
                        title: 'Mental Wellness',
                        imagePath:
                            'assets/images/placeholders/wellness_man.png',
                        backgroundColor: Color(0xFFECCAFF),
                        onTap: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) =>
                                  MentalWellnessDetailsScreen()));
                        })),
                SizedBox(width: 8),
                Expanded(
                    child: _buildWellnessCard(
                        title: 'Men Health',
                        imagePath: 'assets/images/placeholders/man.png',
                        backgroundColor: Color(0xFFD0FFD0),
                        onTap: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => MenHealthScreen()));
                        })),
                SizedBox(width: 8),
                Expanded(
                    child: _buildWellnessCard(
                        title: 'Women Health',
                        imagePath: 'assets/images/placeholders/woman.png',
                        backgroundColor: Color(0xFFFACCF2),
                        onTap: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => WomenHealthScreen()));
                        })),
              ]),
              SizedBox(height: 20),
              WhyChoosePackageContainer(),
              SizedBox(height: 20),
              ContactUsContainer(),
              SizedBox(height: 24),
              MeetTheTeamCarousel(),
            ]));
  }

  Widget _buildWellnessCard(
      {required String title,
      required String imagePath,
      required Color backgroundColor,
      required Function() onTap}) {
    return Stack(alignment: Alignment.topRight, children: [
      GestureDetector(
          onTap: onTap,
          child: Container(
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.borderColor, width: 0.5)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 6),
                    Image.asset(imagePath, height: 87),
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12))),
                        child: Text(title,
                            style: _textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.lightText))),
                  ]))),
      Positioned(
          top: 4,
          right: 8,
          child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.primaryPink),
              child:
                  Icon(Icons.arrow_forward_ios, size: 8, color: Colors.white))),
    ]);
  }
}
