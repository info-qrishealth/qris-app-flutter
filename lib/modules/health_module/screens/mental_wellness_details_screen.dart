import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/health_score_module/components/health_score_list_tile.dart';
import 'package:qris_health/modules/home_module/components/cashback_container.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/heading_text.dart';
import 'package:qris_health/shared/components/how_it_works_container.dart';
import 'package:qris_health/shared/components/what_it_includes_container.dart';
import 'package:qris_health/shared/models/blood_test_info_model.dart';
import 'package:qris_health/styles/app_colors.dart';

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
                BloodTestInfoModel(
                    title: 'Blood Tests (89 Parameters) :-',
                    description:
                        'Vitamin B12, Vitamin D, CBC, HBA1C, Iron Studies, KFT, LFT, Lipid Profile, Thyroid Profile, Urine Routine and Microscopy, Blood Glucose Fasting',
                    imagePath: ''),
                BloodTestInfoModel(
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
              DottedBorder(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  borderType: BorderType.RRect,
                  radius: Radius.circular(15),
                  color: AppColors.borderColor,
                  child: Column(children: [
                    HealthScoreListTile(
                        imagePath:
                            'assets/images/icons/mental_wellness_icons/neuroligical_icon.png',
                        title: 'Neurological well being',
                        imageSize: 24,
                        style: _textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.lightText)),
                    SizedBox(height: 12),
                    HealthScoreListTile(
                        imagePath:
                            'assets/images/icons/mental_wellness_icons/holistic_wellness_icon.png',
                        title: 'Holistic wellness',
                        imageSize: 24,
                        style: _textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.lightText)),
                    SizedBox(height: 12),
                    HealthScoreListTile(
                        imagePath:
                            'assets/images/icons/mental_wellness_icons/depression_icon.png',
                        title: 'Overcome Depression',
                        imageSize: 24,
                        style: _textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.lightText)),
                    SizedBox(height: 12),
                    HealthScoreListTile(
                        imagePath:
                            'assets/images/icons/mental_wellness_icons/expert_icon.png',
                        title: 'Expert psychologist',
                        imageSize: 24,
                        style: _textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.lightText)),
                  ])),
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
            ]));
  }
}
