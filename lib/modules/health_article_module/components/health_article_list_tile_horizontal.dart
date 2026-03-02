import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/health_article_module/models/health_article/health_article.dart';
import 'package:qris_health/modules/health_article_module/screens/health_article_detail_screen.dart';
import 'package:qris_health/shared/components/common_network_image.dart';
import 'package:qris_health/shared/extensions/date_time_extension.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';
import 'package:qris_health/styles/app_colors.dart';

class HealthArticleListTileHorizontal extends StatelessWidget {
  final HealthArticle healthArticle;
  HealthArticleListTileHorizontal({super.key, required this.healthArticle});
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) =>
                  HealthArticleDetailScreen(healthArticle: healthArticle)));
        },
        child: Container(
            width: 190,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.borderColor)),
            child: Column(children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: CommonNetworkImage(
                      height: 150,
                      fit: BoxFit.fill,
                      name: '${healthArticle.pic}')),
              SizedBox(height: 6),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                healthArticle.title
                                    .getEllipticText(charactersAfterTrim: 40)!,
                                style: _textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppConstants.ubuntuFontFamily,
                                    color: AppColors.textColor)),
                            Spacer(),
                            Text(
                                healthArticle.shortDesc
                                    .getEllipticText(charactersAfterTrim: 70)!,
                                style: _textTheme.labelSmall!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textColor,
                                    fontSize: 9.5)),
                            Spacer(),
                            Text(
                                healthArticle
                                    .dateTime.toDateTime.getFormattedDatedMMMy!,
                                style: _textTheme.labelSmall!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryPink,
                                    fontSize: 10)),
                            SizedBox(height: 8),
                          ]))),
            ])));
  }
}
