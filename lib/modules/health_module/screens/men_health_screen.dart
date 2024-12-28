import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/health_module/components/doctor_carousel_card.dart';
import 'package:qris_health/modules/health_module/components/health_problem_list_tile.dart';
import 'package:qris_health/modules/health_module/components/why_choose_package_container.dart';
import 'package:qris_health/shared/components/common_action_app_bar_button.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/contact_us_container.dart';
import 'package:qris_health/shared/components/heading_text.dart';
import 'package:qris_health/styles/app_colors.dart';

class MenHealthScreen extends StatefulWidget {
  const MenHealthScreen({super.key});

  @override
  State<MenHealthScreen> createState() => _MenHealthScreenState();
}

class _MenHealthScreenState extends State<MenHealthScreen> {
  final _pageController = FlutterCarouselController();

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
                  onTap: () {},
                  gradient: LinearGradient(
                      begin: Alignment(1.00, 0.00),
                      end: Alignment(-1, 0),
                      colors: [Color(0xFFFEFEFE), Color(0xFFE8F9FF)])),
              SizedBox(height: 8),
              HealthProblemListTile(
                  title: 'Men’s Performance',
                  imagePath:
                      'assets/images/icons/health_problem_icons/men_performance_icon.png',
                  onTap: () {},
                  gradient: LinearGradient(
                      begin: Alignment(1.00, 0.00),
                      end: Alignment(-1, 0),
                      colors: [Color(0xFFFEFEFE), Color(0xFFFFF4CA)])),
              SizedBox(height: 12),
              ContactUsContainer(),
              SizedBox(height: 20),
              WhyChoosePackageContainer(),
              SizedBox(height: 20),
              HeadingText(text: 'Meet the Team'),
              SizedBox(height: 16),
              FlutterCarousel(
                  items: [
                    DoctorCarouselCard(),
                    DoctorCarouselCard(),
                    DoctorCarouselCard(),
                  ],
                  options: FlutterCarouselOptions(
                      aspectRatio: 1.4,
                      initialPage: 1,
                      controller: _pageController,
                      enlargeCenterPage: true,
                      showIndicator: false,
                      enlargeFactor: 0.2,
                      viewportFraction: 0.75)),
              SizedBox(height: 12),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                _buildArrowButton(
                    icon: Icons.arrow_back_ios_new,
                    onTap: () {
                      _pageController.previousPage();
                    }),
                SizedBox(width: 8),
                _buildArrowButton(
                    icon: Icons.arrow_forward_ios,
                    onTap: () {
                      _pageController.nextPage();
                    }),
              ]),
              SizedBox(height: 16),
            ])));
  }

  Widget _buildArrowButton(
      {required IconData icon, required Function() onTap}) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: AppColors.primaryPink),
            child: Icon(icon, color: Colors.white, size: 12)));
  }
}
