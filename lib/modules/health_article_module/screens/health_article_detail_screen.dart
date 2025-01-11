import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/health_article_module/models/health_article/health_article.dart';
import 'package:qris_health/modules/home_module/components/package_list_tile.dart';
import 'package:qris_health/modules/home_module/components/package_tile_horizontal.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/common_html_text.dart';
import 'package:qris_health/shared/components/common_network_image.dart';
import 'package:qris_health/shared/components/contact_us_container.dart';
import 'package:qris_health/shared/components/heading_text.dart';
import 'package:qris_health/shared/extensions/date_time_extension.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../components/health_article_list_tile_horizontal.dart';

class HealthArticleDetailScreen extends StatefulWidget {
  final HealthArticle healthArticle;
  const HealthArticleDetailScreen({super.key, required this.healthArticle});

  @override
  State<HealthArticleDetailScreen> createState() =>
      _HealthArticleDetailScreenState();
}

class _HealthArticleDetailScreenState extends State<HealthArticleDetailScreen> {
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Article'),
        body: SafeArea(
            child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.scaffoldPadding, vertical: 16),
                children: [
              HeadingText(text: widget.healthArticle.title),
              SizedBox(height: 14),
              Text(
                  '${widget.healthArticle.dateTime.toDateTime.getFormattedDatedMMMy}',
                  style: _textTheme.labelSmall!.copyWith(
                      color: AppColors.primaryPink,
                      fontWeight: FontWeight.w500)),
              SizedBox(height: 16),
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CommonNetworkImage(
                      name: '${widget.healthArticle.pic}',
                      fit: BoxFit.fill,
                      height: null)),
              SizedBox(height: 16),
              CommonHtmlText(text: widget.healthArticle.description!),
              SizedBox(height: 16),
              ContactUsContainer(),
              SizedBox(height: 16),
              PackageListTile(onSeeDetailsTap: () {}, onBookNowTap: () {}),
              SizedBox(height: 16),
              HeadingText(text: 'Related blood test packages'),
              SizedBox(height: 16),
              SizedBox(
                  height: 145,
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return PackageTileHorizontal(onBookNowTap: () {});
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 8);
                      },
                      itemCount: 10)),
              SizedBox(height: 16),
              HeadingText(text: 'You may also like'),
              SizedBox(height: 12),
              SizedBox(
                  height: 260,
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return HealthArticleListTileHorizontal(
                          healthArticle: HealthArticle(id: 3, title: ''),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 8);
                      },
                      itemCount: 10)),
              SizedBox(height: 16),
            ])));
  }
}
