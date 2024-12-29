import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/health_module/components/mental_wellness_bottom_navigation_bar.dart';
import 'package:qris_health/modules/health_score_module/components/health_score_list_tile.dart';
import 'package:qris_health/modules/home_module/components/cashback_container.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/contact_us_container.dart';
import 'package:qris_health/shared/components/discount_coupon_container.dart';
import 'package:qris_health/shared/components/faq_list_tile.dart';
import 'package:qris_health/shared/components/heading_text.dart';
import 'package:qris_health/shared/components/how_it_works_container.dart';
import 'package:qris_health/shared/components/meet_the_team_carousel.dart';
import 'package:qris_health/shared/components/mini_tile_container.dart';
import 'package:qris_health/shared/components/what_it_includes_container.dart';
import 'package:qris_health/shared/models/title_and_description_model.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../../shared/screens/questionaire_screen.dart';

class MentalWellnessDetailsScreen extends StatefulWidget {
  const MentalWellnessDetailsScreen({super.key});

  @override
  State<MentalWellnessDetailsScreen> createState() =>
      _MentalWellnessDetailsScreenState();
}

class _MentalWellnessDetailsScreenState
    extends State<MentalWellnessDetailsScreen> {
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Details'),
        bottomNavigationBar: MentalWellnessBottomNavigationBar(),
        body: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
                horizontal: AppConstants.scaffoldPadding, vertical: 16),
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                      'assets/images/illustrations/mental_wellness_package_illustration.png')),
              SizedBox(height: 20),
              Text('What it includes',
                  style: _textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryPink)),
              SizedBox(height: 10),
              WhatItIncludesContainer(testInfos: [
                TitleAndDescriptionModel(
                    title: 'Blood Tests (89 Parameters) :-',
                    description:
                        'Vitamin B12, Vitamin D, CBC, HBA1C, Iron Studies, KFT, LFT, Lipid Profile, Thyroid Profile, Urine Routine and Microscopy, Blood Glucose Fasting',
                    imagePath: ''),
                TitleAndDescriptionModel(
                    title: 'Psychologist Consultation :-',
                    description:
                        'One-on-one expert advice tailored to your mental wellness needs',
                    imagePath: ''),
              ]),
              SizedBox(height: 18),
              CashbackContainer(),
              SizedBox(height: 18),
              HeadingText(text: 'What can we help you with?'),
              SizedBox(height: 12),
              MiniTileContainer(titles: [
                TitleAndDescriptionModel(
                    title: 'Neurological well being',
                    imagePath:
                        'assets/images/icons/mental_wellness_icons/neuroligical_icon.png'),
                TitleAndDescriptionModel(
                    title: 'Holistic wellness',
                    imagePath:
                        'assets/images/icons/mental_wellness_icons/holistic_wellness_icon.png'),
                TitleAndDescriptionModel(
                    title: 'Overcome Depression',
                    imagePath:
                        'assets/images/icons/mental_wellness_icons/depression_icon.png'),
                TitleAndDescriptionModel(
                    title: 'Expert psychologist',
                    imagePath:
                        'assets/images/icons/mental_wellness_icons/expert_icon.png'),
              ]),
              SizedBox(height: 18),
              HeadingText(text: 'Description'),
              SizedBox(height: 12),
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: AppColors.borderColor)),
                  child: Text(
                      'According to WHO, Mental health is a state of mental well being that enables people to cope with Life stress, realizing their ability & working well with their community. Physical health and mental health is an integral component of health. From the era of family therapists , mental health has evolved to clinical psychologist & counsellor psychologist & psychiatric doctors who work for the treatment of mental disorders thus helping the patient with personal, socio-economic & community development. At QRIS, our team of clinical Psychologist & psychiatrist help you find the perfect care, balance & solution to all your mental health needs which can range from Anxiety, Depression & Insomnia etc. We do that by counselling along with physical examination & pathological testing if need arises Read More',
                      style: _textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w400,
                          height: 1.25,
                          color: AppColors.lightText))),
              SizedBox(height: 18),
              HowItWorksContainer(),
              SizedBox(height: 18),
              ContactUsContainer(),
              SizedBox(height: 18),
              MeetTheTeamCarousel(),
              SizedBox(height: 18),
              HeadingText(text: 'Frequently Asked Questions'),
              SizedBox(height: 12),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black.withOpacity(0.09)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(children: [
                    FaqListTile(
                        question:
                            'What is Mental health programme offered by Qris Health?',
                        answer:
                            'We all have a mental health which is made up of our beliefs, thoughts, feeling  and behaviours. At Qris Health a team of professionals help work for the treatment of mental disorder.'),
                    FaqListTile(
                        question: 'Should I be concerned about a high ESR?',
                        answer:
                            'When Should an ESR Test Be Performed? When a child shows symptoms of infection or inflammation, doctors may request an ESR test. It is possible to monitor the efficacy of treatment for inflammation or infection using ESR testing'),
                  ])),
            ]));
  }
}
