import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/modules/health_module/components/mental_wellness_bottom_navigation_bar.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/mini_tile_container.dart';

import '../../../constants/app_constants.dart';
import '../../../shared/components/bullet_point.dart';
import '../../../shared/components/contact_us_container.dart';
import '../../../shared/components/faq_list_tile.dart';
import '../../../shared/components/heading_text.dart';
import '../../../shared/components/how_it_works_container.dart';
import '../../../shared/components/meet_the_team_carousel.dart';
import '../../../shared/components/what_it_includes_container.dart';
import '../../../shared/models/title_and_description_model.dart';
import '../../../styles/app_colors.dart';
import '../../home_module/components/cashback_container.dart';

class FemaleInfertilityScreen extends StatefulWidget {
  const FemaleInfertilityScreen({super.key});

  @override
  State<FemaleInfertilityScreen> createState() =>
      _FemaleInfertilityScreenState();
}

class _FemaleInfertilityScreenState extends State<FemaleInfertilityScreen> {
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
                      'assets/images/illustrations/female_infertility_illustration.png')),
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
                    title: 'Blood & Hormones Test (15 Parameters) :-',
                    description:
                        'Thyroid Profile, FSH - Follicle Stimulating Hormone, Prolactin, LH-Luteinizing Harmone, E2 - FEMALE REPRODUCTIVE HORMONE, Blood Glucose Fasting, HBA1C, AMH, HIV Antibodies, HPLC, VDRL, HBSaG',
                    imagePath: ''),
                TitleAndDescriptionModel(
                    title: 'Ultrasound :-',
                    description:
                        'Get your ultrasound done as per your symptoms',
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
                    title: 'Age related changes',
                    imagePath:
                        'assets/images/icons/mental_wellness_icons/age_related_icon.png'),
                TitleAndDescriptionModel(
                    title: 'Hormonal imbalance',
                    imagePath:
                        'assets/images/icons/mental_wellness_icons/hormone_imbalance_icon.png'),
                TitleAndDescriptionModel(
                    title: 'Surgical procedure if needed',
                    imagePath:
                        'assets/images/icons/mental_wellness_icons/surgical_lab_icon.png'),
                TitleAndDescriptionModel(
                    title: 'Top gynaecologist consultation',
                    imagePath:
                        'assets/images/icons/mental_wellness_icons/gyno_icon.png'),
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
                        'Infertility is the inability to conceive due to any factor after 1 year of unprotected intercourse. Female Infertility can be due to many causes which primarily include:-',
                        style: _textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightText)),
                    SizedBox(height: 4),
                    BulletPoint(
                        text:
                            'Cervical incompatibility: Like blockage, obstruction or mucus abnormalities'),
                    SizedBox(height: 4),
                    BulletPoint(
                        text:
                            'Uterus- Congenital defects In Uterus, fallopian tubes, Vagina or Cervix or acquired cause like Inflammation of Endometrium (Uterus wall), Adhesions or fibroids Ovarian infertility'),
                    SizedBox(height: 4),
                    BulletPoint(text: 'Age > 40 years'),
                    SizedBox(height: 4),
                    BulletPoint(text: 'Damaged or blocked fallopian tubes'),
                    SizedBox(height: 4),
                    BulletPoint(
                        text:
                            'Sexually transmitted disease like Gonorrhoea or Chlamydia'),
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
