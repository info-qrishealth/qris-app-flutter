import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qris_health/modules/health_module/cubits/qris_doctors_cubit/qris_doctors_cubit.dart';
import 'package:qris_health/modules/health_module/cubits/qris_doctors_cubit/qris_doctors_cubit.dart';
import 'package:qris_health/modules/health_module/screens/female_disorder_screen.dart';
import 'package:qris_health/modules/health_module/screens/female_infertility_screen.dart';
import 'package:qris_health/modules/health_module/screens/female_menopause_sceen.dart';

import '../../../constants/app_constants.dart';
import '../../../shared/components/common_app_bar.dart';
import '../../../shared/components/contact_us_container.dart';
import '../../../shared/components/heading_text.dart';
import '../../../shared/components/meet_the_team_carousel.dart';
import '../components/health_problem_list_tile.dart';
import '../components/why_choose_package_container.dart';
import 'male_infertility_screen.dart';
import 'male_performance_screen.dart';

class WomenHealthScreen extends StatefulWidget {
  const WomenHealthScreen({super.key});

  @override
  State<WomenHealthScreen> createState() => _WomenHealthScreenState();
}

class _WomenHealthScreenState extends State<WomenHealthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Women Health'),
        body: SafeArea(
            child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.scaffoldPadding, vertical: 16),
                children: [
              Image.asset(
                  'assets/images/illustrations/women_health_illustration.png'),
              SizedBox(height: 18),
              HeadingText(text: 'Categories to explore'),
              SizedBox(height: 14),
              HealthProblemListTile(
                  title: 'Female Infertility',
                  imagePath:
                      'assets/images/icons/health_problem_icons/female_infertility_icon.png',
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => FemaleInfertilityScreen()));
                  },
                  gradient: LinearGradient(
                      begin: Alignment(1.00, 0.00),
                      end: Alignment(-1, 0),
                      colors: [Color(0xFFFEFEFE), Color(0xFFE8F9FF)])),
              SizedBox(height: 8),
              HealthProblemListTile(
                  title: 'Menopause',
                  imagePath:
                      'assets/images/icons/health_problem_icons/menopause_icon.png',
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => FemaleMenopauseScreen()));
                  },
                  gradient: LinearGradient(
                      begin: Alignment(1.00, 0.00),
                      end: Alignment(-1, 0),
                      colors: [Color(0xFFFEFEFE), Color(0xFFFFF4CA)])),
              SizedBox(height: 8),
              HealthProblemListTile(
                  title: 'Female Disorder',
                  imagePath:
                      'assets/images/icons/health_problem_icons/female_disorder_icon.png',
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => FemaleDisorderScreen()));
                  },
                  gradient: LinearGradient(
                      begin: Alignment(1.00, 0.00),
                      end: Alignment(-1, 0),
                      colors: [Color(0xFFFEFEFE), Color(0xFFFFE8FA)])),
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
