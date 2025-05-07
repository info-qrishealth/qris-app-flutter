import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/health_score_module/components/health_score_result_card.dart';
import 'package:qris_health/modules/health_score_module/models/health_score_res_model/health_score_res_model.dart';
import 'package:qris_health/modules/health_score_module/screens/health_score_intro_screen.dart';
import 'package:qris_health/modules/home_module/components/package_tile_horizontal.dart';
import 'package:qris_health/modules/home_module/popular_packages_cubit/popular_packages_cubit.dart';
import 'package:qris_health/modules/home_module/screens/popular_package_screen.dart';
import 'package:qris_health/modules/screens/blood_test_detail_screen.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/heading_text.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../../shared/components/outlined_icon_button.dart';
import '../../health_article_module/components/health_article_list_tile_horizontal.dart';
import '../../health_article_module/cubits/health_articles_cubit/health_article_cubit.dart';

class HealthScoreResultScreen extends StatefulWidget {
  final HealthScoreResModel healthScoreResModel;

  const HealthScoreResultScreen({super.key, required this.healthScoreResModel});

  @override
  State<HealthScoreResultScreen> createState() =>
      _HealthScoreResultScreenState();
}

class _HealthScoreResultScreenState extends State<HealthScoreResultScreen> {
  final _textTheme = Get.textTheme;

  @override
  void initState() {
    super.initState();
    final popularPackageCubit = BlocProvider.of<PopularPackagesCubit>(context);
    final healthArticleCubit = BlocProvider.of<HealthArticleCubit>(context);

    if (popularPackageCubit.state is! PopularPackagesLoaded) {
      popularPackageCubit.getPopularPackages();
    }

    if (healthArticleCubit.state is! HealthArticleLoaded) {
      healthArticleCubit.getAllArticles();
    }
  }

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
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(CupertinoPageRoute(
                          builder: (context) => HealthScoreIntroScreen()));
                    },
                    child: Text('Start Assessment again')))),
        appBar: CommonAppBar(title: 'Health Score'),
        body: ListView(
            physics: BouncingScrollPhysics(),
            padding:
                EdgeInsets.symmetric(horizontal: AppConstants.scaffoldPadding),
            children: [
              SizedBox(height: 24),
              HealthScoreResultCard(
                  healthScoreResModel: widget.healthScoreResModel),
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
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => PopularPackageScreen()));
                    },
                    icon: Icon(Icons.arrow_forward_ios_outlined,
                        color: AppColors.primaryBlue, size: 16)),
              ]),
              SizedBox(height: 12),
              SizedBox(
                  height: 150,
                  child:
                      BlocBuilder<PopularPackagesCubit, PopularPackagesState>(
                          builder: (context, state) {
                    if (state is PopularPackagesLoaded) {
                      return ListView.separated(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return PackageTileHorizontal(
                                onSeeDetailsTap: () async {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      builder: (context) =>
                                          BloodTestDetailScreen(
                                              testId: state
                                                  .popularPackages[index].id)));
                                },
                                testPackageModel: state.popularPackages[index]);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 8);
                          },
                          itemCount: state.popularPackages.length);
                    }

                    return FadeShimmer(
                        width: double.infinity,
                        height: 145,
                        fadeTheme: FadeTheme.light);
                  })),
              SizedBox(height: 16),
              Text('Top Articles',
                  style: _textTheme.titleMedium!
                      .copyWith(fontWeight: FontWeight.w700)),
              SizedBox(height: 12),
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

                    return Center(child: CircularProgressIndicator.adaptive());
                  })),
            ]));
  }
}
