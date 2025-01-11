import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/health_article_module/models/health_article/health_article.dart';
import 'package:qris_health/modules/health_article_module/screens/health_article_detail_screen.dart';
import 'package:qris_health/shared/components/common_network_image.dart';
import 'package:qris_health/shared/extensions/date_time_extension.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';
import 'package:qris_health/styles/app_colors.dart';

class HealthArticleListTile extends StatelessWidget {
  final HealthArticle article;
  HealthArticleListTile({super.key, required this.article});

  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) =>
                  HealthArticleDetailScreen(healthArticle: article)));
        },
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(12)),
            child: Row(children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12)),
                  child: CommonNetworkImage(
                      name: '${article.pic}',
                      width: 125,
                      height: 100,
                      fit: BoxFit.cover)),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                article.title
                                    .getEllipticText(charactersAfterTrim: 52)!,
                                style: _textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textColor,
                                    fontFamily: AppConstants.ubuntuFontFamily)),
                            SizedBox(height: 6),
                            Text(
                                '${article.metaDesc.getEllipticText(charactersAfterTrim: 85)}',
                                style: _textTheme.labelSmall!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textColor,
                                    fontSize: 10)),
                            SizedBox(height: 6),
                            Text(
                                '${article.dateTime.toDateTime.getFormattedDatedMMMy}',
                                style: _textTheme.labelSmall!.copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryPink))
                          ])))
            ])));
  }
}
