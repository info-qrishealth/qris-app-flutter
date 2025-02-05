import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/health_module/components/doctor_carousel_card.dart';
import 'package:qris_health/modules/health_module/components/health_problem_list_tile.dart';
import 'package:qris_health/modules/health_module/components/why_choose_package_container.dart';
import 'package:qris_health/modules/health_module/cubits/qris_doctors_cubit/qris_doctors_cubit.dart';
import 'package:qris_health/modules/health_module/cubits/qris_doctors_cubit/qris_doctors_cubit.dart';
import 'package:qris_health/modules/health_module/screens/male_infertility_screen.dart';
import 'package:qris_health/modules/health_module/screens/male_performance_screen.dart';
import 'package:qris_health/shared/components/common_action_app_bar_button.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/contact_us_container.dart';
import 'package:qris_health/shared/components/heading_text.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../../shared/components/meet_the_team_carousel.dart';

class MenHealthScreen extends StatefulWidget {
  const MenHealthScreen({super.key});

  @override
  State<MenHealthScreen> createState() => _MenHealthScreenState();
}

class _MenHealthScreenState extends State<MenHealthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Men Health'),
        body: SafeArea(
            child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.scaffoldPadding, vertical: 16),
                children: [
              Image.asset(
                  'assets/images/illustrations/men_health_illustration.png'),
              SizedBox(height: 18),
              HeadingText(text: 'Categories to explore'),
              SizedBox(height: 14),
              HealthProblemListTile(
                  title: 'Male Infertility',
                  imagePath:
                      'assets/images/icons/health_problem_icons/male_infertility_icon.png',
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => MaleInfertilityScreen()));
                  },
                  gradient: LinearGradient(
                      begin: Alignment(1.00, 0.00),
                      end: Alignment(-1, 0),
                      colors: [Color(0xFFFEFEFE), Color(0xFFE8F9FF)])),
              SizedBox(height: 8),
              HealthProblemListTile(
                  title: 'Men’s Performance',
                  imagePath:
                      'assets/images/icons/health_problem_icons/men_performance_icon.png',
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => MalePerformanceScreen()));
                  },
                  gradient: LinearGradient(
                      begin: Alignment(1.00, 0.00),
                      end: Alignment(-1, 0),
                      colors: [Color(0xFFFEFEFE), Color(0xFFFFF4CA)])),
              SizedBox(height: 12),
              ContactUsContainer(),
              SizedBox(height: 20),
              WhyChoosePackageContainer(),
              SizedBox(height: 20),
              BlocBuilder<QrisDoctorsCubit, QrisDoctorsState>(
                  builder: (context, state) {
                return MeetTheTeamCarousel(doctors: state.doctors);
              }),
              SizedBox(height: 16),
            ])));
  }
}
