import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/shared/components/mini_tile_container.dart';

import '../../../constants/app_constants.dart';
import '../../../shared/components/bullet_point.dart';
import '../../../shared/components/common_app_bar.dart';
import '../../../shared/components/contact_us_container.dart';
import '../../../shared/components/faq_list_tile.dart';
import '../../../shared/components/heading_text.dart';
import '../../../shared/components/how_it_works_container.dart';
import '../../../shared/components/meet_the_team_carousel.dart';
import '../../../shared/components/what_it_includes_container.dart';
import '../../../shared/models/title_and_description_model.dart';
import '../../../styles/app_colors.dart';
import '../../health_score_module/components/health_score_list_tile.dart';
import '../../home_module/components/cashback_container.dart';
import '../components/mental_wellness_bottom_navigation_bar.dart';

class FemaleMenopauseScreen extends StatefulWidget {
  const FemaleMenopauseScreen({super.key});

  @override
  State<FemaleMenopauseScreen> createState() => _FemaleMenopauseScreenState();
}

class _FemaleMenopauseScreenState extends State<FemaleMenopauseScreen> {
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MentalWellnessBottomNavigationBar(),
        appBar: CommonAppBar(title: 'Details'),
        body: SafeArea(
            child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    vertical: 16, horizontal: AppConstants.scaffoldPadding),
                children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                      'assets/images/illustrations/menopause_illustration.png')),
              SizedBox(height: 16),
              HeadingText(
                  text: 'What it includes',
                  style: _textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontFamily: AppConstants.latoFontFamily,
                      color: AppColors.primaryPink)),
              SizedBox(height: 8),
              WhatItIncludesContainer(testInfos: [
                TitleAndDescriptionModel(
                    title: 'Blood Tests (7 Parameters) :-',
                    description:
                        'Thyroid Profile, FSH - Follicle Stimulating Hormone, Prolactin, LH-Luteinizing Harmone',
                    imagePath: ''),
                TitleAndDescriptionModel(
                    title: 'Hormone imbalance treatment :-',
                    description:
                        'Hormone imbalance treatment by Gynaecologist which include both Hormone replacement therapy & Non Hormone therapy',
                    imagePath: ''),
                TitleAndDescriptionModel(
                    title: 'Ultrasound :-',
                    description:
                        'Get your ultrasound done as per your symptoms',
                    imagePath: ''),
                TitleAndDescriptionModel(
                    title: 'Diet Consultation :-',
                    description:
                        'Get your customized diet plan for healthy lifestyle',
                    imagePath: ''),
                TitleAndDescriptionModel(
                    title: 'Psychiatrist Consultation :-',
                    description:
                        'One-on-one expert advice tailored to your needs',
                    imagePath: ''),
              ]),
              SizedBox(height: 18),
              CashbackContainer(),
              SizedBox(height: 16),
              HeadingText(text: 'What can we help you with?'),
              SizedBox(height: 13),
              MiniTileContainer(titles: [
                TitleAndDescriptionModel(
                    title: 'Mood Changes',
                    imagePath:
                        'assets/images/icons/mental_wellness_icons/mood_change_icon.png'),
                TitleAndDescriptionModel(
                    title: 'To diagnose hormone change',
                    imagePath:
                        'assets/images/icons/mental_wellness_icons/hormone_imbalance_icon.png'),
                TitleAndDescriptionModel(
                    title: 'Low dose Medication',
                    imagePath:
                        'assets/images/icons/mental_wellness_icons/low_dose_icon.png'),
                TitleAndDescriptionModel(
                    title: 'Overcome Depression',
                    imagePath:
                        'assets/images/icons/mental_wellness_icons/depression_icon.png'),
              ]),
              SizedBox(height: 18),
              HeadingText(text: 'Description'),
              SizedBox(height: 12),
              Container(
                  padding: EdgeInsets.all(9),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(children: [
                    Text(
                        'Menopause is the last menstrual period of a women. It is characterised by 12 months of Amenorrhoea (Stoppage of periods) & have other physical and hormonal imbalance symptoms like Vaginal dryness, dyspareunia (Painful intercourse), Sleep & mood dysfunction. The average age at which menopause occur varies from 45-51 years. Various clinical effects of Menopause symptoms are:-',
                        style: _textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightText)),
                    SizedBox(height: 4),
                    BulletPoint(text: 'Hot flashes or flushes'),
                    SizedBox(height: 4),
                    BulletPoint(text: 'Osteoporosis (Hollow bones)'),
                    SizedBox(height: 4),
                    BulletPoint(text: 'Weight gain'),
                    SizedBox(height: 4),
                    BulletPoint(text: 'Irritability, Anxiety'),
                    SizedBox(height: 4),
                    BulletPoint(text: 'Depression'),
                    SizedBox(height: 4),
                    BulletPoint(text: 'Bloating feeling'),
                    SizedBox(height: 4),
                    BulletPoint(text: 'Headache'),
                  ])),
              SizedBox(height: 18),
              HowItWorksContainer(),
              SizedBox(height: 18),
              ContactUsContainer(),
              SizedBox(height: 20),
              MeetTheTeamCarousel(),
              SizedBox(height: 20),
              HeadingText(text: 'Frequently Asked Questions'),
              SizedBox(height: 10),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(15)),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return FaqListTile(
                            question:
                                'Is Smoking/Alcohol effects sperm counts?',
                            answer:
                                'Yes, any addiction- Smoking/Alcohol etc repatively effect not only sperm counts but also sperm mobility , morphology etc.');
                      },
                      itemCount: 3)),
            ])));
  }
}
