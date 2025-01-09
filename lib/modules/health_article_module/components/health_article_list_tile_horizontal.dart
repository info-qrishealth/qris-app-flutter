import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/health_article_module/screens/health_article_detail_screen.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';
import 'package:qris_health/styles/app_colors.dart';

class HealthArticleListTileHorizontal extends StatelessWidget {
  HealthArticleListTileHorizontal({super.key});
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => HealthArticleDetailScreen()));
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
                  child: Image.network(
                      '${AppConstants.imageBaseUrl}/137_1736261089blog-hmpv-virus.jpg',
                      height: 150,
                      fit: BoxFit.fill)),
              SizedBox(height: 6),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Protect Your Vital Organs: Get a Liver and Kidney Function Test in Delhi'
                                .getEllipticText(charactersAfterTrim: 75)!,
                            style: _textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontFamily: AppConstants.ubuntuFontFamily,
                                color: AppColors.textColor)),
                        SizedBox(height: 4),
                        Text(
                            'Livers and kidneys are some of the most crucial organs in your body that always hel'
                                .getEllipticText(charactersAfterTrim: 80)!,
                            style: _textTheme.labelSmall!.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.textColor,
                                fontSize: 9.5)),
                        SizedBox(height: 5),
                        Text('20 Nov 2024',
                            style: _textTheme.labelSmall!.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryPink,
                                fontSize: 10)),
                      ])),
            ])));
  }
}
