import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/health_article_module/cubits/health_articles_cubit/health_article_cubit.dart';
import 'package:qris_health/modules/health_score_module/screens/health_score_intro_screen.dart';
import 'package:qris_health/modules/home_module/components/package_list_tile.dart';
import 'package:qris_health/modules/home_module/popular_packages_cubit/popular_packages_cubit.dart';
import 'package:qris_health/modules/home_module/screens/popular_package_screen.dart';
import 'package:qris_health/modules/screens/blood_test_detail_screen.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/double_tick_row.dart';
import 'package:qris_health/shared/components/filter_textfield.dart';
import 'package:qris_health/shared/components/heading_text.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../health_article_module/components/health_article_list_tile_horizontal.dart';
import 'find_doctor_screen.dart';

class DoctorConsultationScreen extends StatefulWidget {
  const DoctorConsultationScreen({super.key});

  @override
  State<DoctorConsultationScreen> createState() =>
      _DoctorConsultationScreenState();
}

class _DoctorConsultationScreenState extends State<DoctorConsultationScreen> {
  final _searchController = TextEditingController();
  final _textTheme = Get.textTheme;

  @override
  void initState() {
    super.initState();
    final healthArticleCubit = BlocProvider.of<HealthArticleCubit>(context);

    if (healthArticleCubit.state is! HealthArticleLoaded) {
      healthArticleCubit.getAllArticles();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Doctor Consultation'),
        body: SafeArea(
            child: ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.scaffoldPadding, vertical: 16),
                children: [
              FilterTextField(
                  readOnly: true,
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => FindDoctorScreen()));
                  },
                  onFieldSubmitted: null,
                  controller: _searchController,
                  onChanged: null,
                  hintText: 'Search for doctor consultation...',
                  suffixIcon: null),
              SizedBox(height: 20),
              Image.asset(
                  'assets/images/illustrations/doctor_consultation_illustration.png'),
              SizedBox(height: 20),
              Text('Find Doctor',
                  style: _textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryPink)),
              SizedBox(height: 4),
              Text('Find the right doctor according to your complaint',
                  style: _textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontFamily: AppConstants.latoFontFamily)),
              SizedBox(height: 14),
              Text(
                  'Qris Healthcare is a free, health app that goes beyond matching you with doctors. It actively helps you find the right doctor based on your medical and personal needs and connects you with your Qris Healthcare community for ongoing support throughout your journey to healthier living.',
                  style: _textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.w400, height: 1.25)),
              SizedBox(height: 12),
              DoubleTickRow(
                  text:
                      '100% free app designed to help you find the right doctor for you.'),
              SizedBox(height: 4),
              DoubleTickRow(text: 'Available 900 doctors specialist'),
              SizedBox(height: 14),
              UnconstrainedBox(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                      height: 38,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryBlue),
                          onPressed: () {
                            Navigator.of(context).push(CupertinoPageRoute(
                                builder: (context) => FindDoctorScreen()));
                          },
                          child: Text('Search Doctors',
                              style: _textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white))))),
              SizedBox(height: 24),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.primaryBlue, width: 0.4),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(children: [
                    Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text:
                                  'Qris HealthCare brings you the most convenient Laboratory Tests also ',
                              style: _textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.w700)),
                          TextSpan(
                              text: 'at your own home with comfort',
                              style: _textTheme.titleMedium!.copyWith(
                                  color: AppColors.primaryPink,
                                  fontWeight: FontWeight.w700)),
                        ]),
                        textAlign: TextAlign.center),
                    SizedBox(height: 8),
                    Text(
                        'Experience hassle-free health check-ups with our at-home lab services, ensuring your well-being without stepping out. Get accurate results with the comfort and convenience you deserve.',
                        style: _textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w400, height: 1.22),
                        textAlign: TextAlign.center),
                    SizedBox(height: 15),
                    AnimatedSize(
                        duration: Duration(milliseconds: 200),
                        child: BlocBuilder<PopularPackagesCubit,
                            PopularPackagesState>(builder: (context, state) {
                          if (state is PopularPackagesLoaded) {
                            return ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final testPackage =
                                      state.popularPackages[index];

                                  return PackageListTile(
                                      testPackage: testPackage,
                                      onSeeDetailsTap: () {
                                        Navigator.of(context).push(
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    BloodTestDetailScreen(
                                                        testId:
                                                            testPackage.id)));
                                      },
                                      onBookNowTap: () {});
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: 8);
                                },
                                itemCount: state.popularPackages.length > 3
                                    ? 3
                                    : state.popularPackages.length);
                          } else {
                            return FadeShimmer(
                                radius: 16,
                                width: double.infinity,
                                height: Get.height * 0.5,
                                fadeTheme: FadeTheme.light);
                          }
                        })),
                    SizedBox(height: 14),
                    SizedBox(
                        height: 38,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(color: AppColors.primaryBlue)),
                            onPressed: () {
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (context) =>
                                      PopularPackageScreen()));
                            },
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Text('View all',
                                    style: _textTheme.bodyMedium!.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primaryBlue))))),
                  ])),
              SizedBox(height: 24),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Know Your\n',
                    style: _textTheme.headlineMedium!.copyWith(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.w400)),
                TextSpan(
                    text: 'Health Score',
                    style: _textTheme.headlineMedium!.copyWith(
                        color: AppColors.primaryPink,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700)),
                TextSpan(
                    text: '...',
                    style: _textTheme.headlineMedium!.copyWith(
                        color: AppColors.primaryBlue,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700)),
              ])),
              SizedBox(height: 4),
              Text(
                  'Get rid of all your health concerns by calculating your health score and getting your customized treatment started.',
                  style: _textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w400, color: AppColors.lightText)),
              SizedBox(height: 16),
              UnconstrainedBox(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                      height: 38,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryBlue),
                          onPressed: () {
                            Navigator.of(context).push(CupertinoPageRoute(
                                builder: (context) =>
                                    HealthScoreIntroScreen()));
                          },
                          child: Text('Calculate my score',
                              style: _textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white))))),
              SizedBox(height: 32),
              Image.asset(
                  'assets/images/illustrations/health_score_section_illustration.png'),
              SizedBox(height: 28),
              HeadingText(text: 'Recent Articles'),
              SizedBox(height: 16),
              SizedBox(
                  height: 260,
                  child: BlocBuilder<HealthArticleCubit, HealthArticleState>(
                      builder: (context, state) {
                    if (state is HealthArticleLoaded) {
                      final articles =
                          BlocProvider.of<HealthArticleCubit>(context)
                              .getRecentArticles();
                      return ListView.separated(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return HealthArticleListTileHorizontal(
                                healthArticle: articles[index]);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 8);
                          },
                          itemCount: articles.length);
                    }

                    return CircularProgressIndicator.adaptive();
                  })),
            ])));
  }
}
