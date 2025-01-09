import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/home_module/components/package_list_tile.dart';
import 'package:qris_health/modules/home_module/components/package_tile_horizontal.dart';
import 'package:qris_health/shared/components/common_action_app_bar_button.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/contact_us_container.dart';
import 'package:qris_health/shared/components/heading_text.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../components/health_article_list_tile_horizontal.dart';

class HealthArticleDetailScreen extends StatefulWidget {
  const HealthArticleDetailScreen({super.key});

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
              HeadingText(
                  text:
                      'Protect Your Vital Organs: Get a Liver and Kidney Function Test in Delhi'),
              SizedBox(height: 14),
              Text('20 Nov 2024',
                  style: _textTheme.labelSmall!.copyWith(
                      color: AppColors.primaryPink,
                      fontWeight: FontWeight.w500)),
              SizedBox(height: 16),
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                      '${AppConstants.imageBaseUrl}/137_1736261089blog-hmpv-virus.jpg',
                      fit: BoxFit.fill)),
              SizedBox(height: 16),
              Text(
                  'Livers and kidneys are some of the most crucial organs in your body that always help to keep you healthy. You need your kidneys as they remove wastes from your blood, keep the balance of fluids and also perform many other important functions. However, just like any other machinery, they require occasional visits to the doctor, if they have to deliver their very best. A liver and kidney function test in Delhi will aid in keeping tabs on their status and contain any complications, should they occur, before they become an issue.',
                  style: _textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w400, color: AppColors.lightText)),
              SizedBox(height: 16),
              ContactUsContainer(),
              SizedBox(height: 16),
              PackageListTile(onSeeDetailsTap: () {}, onBookNowTap: () {}),
              SizedBox(height: 16),
              Text(
                  'Functions of Liver and Kidney Function Test PF a healthy checkup entails frequent liver and kidney functions. These tests give you an idea of how your various organs are performing because they can diagnose you before complicated diseases develop.\n1. Screening for Health Problems\nPreventing or diagnosing diseases linked with the liver as well as the kidneys at an early stage is of much importance. Annual testing can help determine if one is pre-clinical for a particular disease, for example, liver disease, kidney disease, or damage, or not at all. This helps both you and your metropolis provider to start treatment earlier, and this can greatly help out in most cases.\n2. Preventive Healthcare\nThis means that people should take extra precautions that will help them avoid getting ill in the future. By getting regular liver function tests in Delhi and kidney function tests in Delhi you can know the state of your health and prevent diseases. Whatever choice you may be making in your life, whether you are choosing to eat healthier or visiting a doctor, understanding your liver and kidney health helps in the decision-making of what is ahead for you.\n3. Monitoring Chronic Conditions\nIn particular, clients with liver or kidney disorders, including fatty liver disease, hepatitis, or chronic kidney disease, should have periodic tests. Such tests are useful to track the state of progression of the disease in patients, evaluate the efficiency of the existing treatments, and, if needed, modify further management strategies. This helps a person to conform to their condition and avoid the worsening of their state.\nQrisHealth: Your Comprehensive Solution Provider for Liver & Kidney Function Tests in Delhi',
                  style: _textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w400, color: AppColors.lightText)),
              SizedBox(height: 24),
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
                        return HealthArticleListTileHorizontal();
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 8);
                      },
                      itemCount: 10)),
              SizedBox(height: 16),
            ])));
  }
}
