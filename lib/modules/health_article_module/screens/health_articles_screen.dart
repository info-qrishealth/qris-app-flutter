import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/health_article_module/cubits/health_article_category_cubit/health_article_category_cubit.dart';
import 'package:qris_health/modules/health_article_module/cubits/health_articles_cubit/health_article_cubit.dart';
import 'package:qris_health/modules/health_article_module/services/health_article_service.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/common_outlined_chip.dart';
import 'package:qris_health/shared/components/heading_text.dart';
import 'package:qris_health/shared/components/shimmer_tile.dart';

import '../components/health_article_list_tile.dart';
import '../components/health_article_list_tile_horizontal.dart';
import '../models/health_article/health_article.dart';
import '../models/health_article_category/health_article_category.dart';

class HealthArticlesScreen extends StatefulWidget {
  const HealthArticlesScreen({super.key});

  @override
  State<HealthArticlesScreen> createState() => _HealthArticlesScreenState();
}

class _HealthArticlesScreenState extends State<HealthArticlesScreen> {
  HealthArticleCategory? _selectedCategory;
  late HealthArticleCubit _healthArticleCubit;
  late HealthArticleCategoryCubit _healthArticleCategoryCubit;

  @override
  void initState() {
    super.initState();
    _healthArticleCubit = BlocProvider.of<HealthArticleCubit>(context);
    _healthArticleCategoryCubit =
        BlocProvider.of<HealthArticleCategoryCubit>(context);

    if (_healthArticleCubit.state.healthArticles.isEmpty) {
      _healthArticleCubit.getAllArticles();
    }

    if (_healthArticleCategoryCubit.state.categories.isEmpty) {
      _healthArticleCategoryCubit.getAllCategories();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Health Articles'),
        body: SafeArea(child:
            BlocBuilder<HealthArticleCategoryCubit, HealthArticleCategoryState>(
                builder: (context, categoryState) {
          final categories = categoryState.categories;

          return BlocBuilder<HealthArticleCubit, HealthArticleState>(
              builder: (context, articlesState) {
            if (articlesState is HealthArticleLoadingError) {
              return Center(
                  child: Text(
                      'There is some error while loading articles. Please try again later.\n${articlesState.errorMessage}'));
            }

            if (articlesState is HealthArticleLoaded) {
              final recentArticles = _healthArticleCubit.getRecentArticles();
              final topArticles = _healthArticleCubit.getTopArticles();

              return ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.scaffoldPadding, vertical: 16),
                  children: [
                    SizedBox(height: 4),
                    if (categoryState is HealthArticleCategoryLoaded)
                      SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(children: [
                            CommonOutlinedChip(
                                onTap: () {
                                  setState(() {
                                    _selectedCategory = null;
                                  });
                                },
                                isSelected: _selectedCategory == null,
                                title: 'All'),
                            SizedBox(width: 8),
                            ...categories.map((category) => Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: CommonOutlinedChip(
                                    onTap: () {
                                      setState(() {
                                        _selectedCategory = category;
                                      });
                                    },
                                    isSelected:
                                        _selectedCategory?.id == category.id,
                                    title: category.title)))
                          ])),
                    SizedBox(height: 20),
                    HeadingText(
                        text: _selectedCategory == null
                            ? 'Recent Articles'
                            : 'Category: ${_selectedCategory!.title}'),
                    SizedBox(height: 12),
                    SizedBox(
                        height: 245,
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final article = _selectedCategory == null
                                  ? recentArticles[index]
                                  : _healthArticleCubit.getArticlesByCategory(
                                      _selectedCategory!.id)[index];

                              return HealthArticleListTileHorizontal(
                                  healthArticle: article);
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 8);
                            },
                            itemCount: _selectedCategory == null
                                ? recentArticles.length
                                : _healthArticleCubit
                                    .getArticlesByCategory(
                                        _selectedCategory!.id)
                                    .length)),
                    SizedBox(height: 20),
                    HeadingText(
                        text: _selectedCategory == null
                            ? 'Top Articles'
                            : 'Recent Articles'),
                    SizedBox(height: 12),
                    AnimatedCrossFade(
                        duration: Duration(milliseconds: 200),
                        firstChild: SizedBox(
                            height: 245,
                            child: ListView.separated(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return HealthArticleListTileHorizontal(
                                      healthArticle: _selectedCategory == null
                                          ? topArticles[index]
                                          : recentArticles[index]);
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(width: 8);
                                },
                                itemCount: _selectedCategory == null
                                    ? recentArticles.length
                                    : topArticles.length)),
                        secondChild: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return HealthArticleListTile(
                                  article: recentArticles[index]);
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 8);
                            },
                            itemCount: recentArticles.length),
                        crossFadeState: _selectedCategory == null
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond),
                  ]);
            } else {
              return ListView(children: [
                ...List.generate(8, (index) {
                  return ShimmerTile();
                }),
              ]);
            }
          });
        })));
  }
}
