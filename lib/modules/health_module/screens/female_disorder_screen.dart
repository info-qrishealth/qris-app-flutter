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

class FemaleDisorderScreen extends StatefulWidget {
  const FemaleDisorderScreen({super.key});

  @override
  State<FemaleDisorderScreen> createState() => _FemaleDisorderScreenState();
}

class _FemaleDisorderScreenState extends State<FemaleDisorderScreen> {
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
                      'assets/images/illustrations/female_disorder_illustration.png')),
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
                    title: 'PCOS/PCOD Screening (37 parameters) :-',
                    description:
                        'CBC, HBA1c, Thyroid Profile-Free, Testosterone Total, FSH - Follicle Stimulating Hormone, Prolactin, LH-Luteinizing Harmone, Progesterone',
                    imagePath: ''),
                TitleAndDescriptionModel(
                    title: 'Ultrasound :-',
                    description:
                        'Get your ultrasound done as per your symptoms',
                    imagePath: ''),
                TitleAndDescriptionModel(
                    title: 'Psychiatrist Consultation :-',
                    description:
                        'One-on-one expert advice tailored to your needs',
                    imagePath: ''),
                TitleAndDescriptionModel(
                    title: 'Diet Consultation :-',
                    description:
                        'Get your customized diet plan for healthy lifestyle',
                    imagePath: ''),
                TitleAndDescriptionModel(
                    title: 'Gynaecologist Consultation :-',
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
                    title: 'Irregular periods',
                    imagePath:
                        'assets/images/icons/mental_wellness_icons/irregular_period_icon.png'),
                TitleAndDescriptionModel(
                    title: 'Weight gain',
                    imagePath:
                        'assets/images/icons/mental_wellness_icons/weight_gain_icon.png'),
                TitleAndDescriptionModel(
                    title: 'Diagnose Infection',
                    imagePath:
                        'assets/images/icons/mental_wellness_icons/infection_icon.png'),
                TitleAndDescriptionModel(
                    title: 'Urinary Tract Infection (UTI)',
                    imagePath:
                        'assets/images/icons/mental_wellness_icons/urinary_icon.png'),
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
                        'Women with polycystic ovarian Syndrome (PCOS) have abnormalities in the metabolism of hormones like Estrogen & Androgens. PCOD is a major disease affecting Women’s health. A women is diagnosed with Polycystic ovaries if she has less follicles in atleast 1 ovary. The Women and Health of a patients with PCOS may include:',
                        style: _textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightText)),
                    SizedBox(height: 4),
                    BulletPoint(
                        text:
                            'Menstrual disorders like Oligomenorrhea (irregular periods) or Secondary Amenorrhoea (absence of menstruation)'),
                    SizedBox(height: 4),
                    BulletPoint(
                        text:
                            'Hyperandrogenism or excess terminal body hair Obesity'),
                    SizedBox(height: 4),
                    BulletPoint(text: 'Damaged lipid profile'),
                    SizedBox(height: 4),
                    BulletPoint(text: 'Diabetes mellitus'),
                    SizedBox(height: 4),
                    BulletPoint(text: 'Sleep Apnea'),
                    SizedBox(height: 4),
                    BulletPoint(
                        text:
                            'Acanthosis nigricans or hyperpigmentation (Darkening of skin or neck)'),
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
