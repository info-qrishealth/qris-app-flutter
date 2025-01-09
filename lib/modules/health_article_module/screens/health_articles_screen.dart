import 'package:flutter/material.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/common_outlined_chip.dart';
import 'package:qris_health/shared/components/heading_text.dart';

import '../components/health_article_list_tile_horizontal.dart';

class HealthArticlesScreen extends StatefulWidget {
  const HealthArticlesScreen({super.key});

  @override
  State<HealthArticlesScreen> createState() => _HealthArticlesScreenState();
}

class _HealthArticlesScreenState extends State<HealthArticlesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Health Articles'),
        body: SafeArea(
            child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.scaffoldPadding, vertical: 16),
                children: [
              HeadingText(text: 'Recent Articles'),
              SizedBox(height: 12),
              SizedBox(
                  height: 260,
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return HealthArticleListTileHorizontal();
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 8);
                      },
                      itemCount: 10)),
              SizedBox(height: 20),
              HeadingText(text: 'Top Articles'),
              SizedBox(height: 12),
              SizedBox(
                  height: 260,
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return HealthArticleListTileHorizontal();
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 8);
                      },
                      itemCount: 10)),
            ])));
  }
}
