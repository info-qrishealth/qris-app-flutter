import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/all_scans_module/models/faq/faq.dart';
import 'package:qris_health/modules/all_scans_module/models/test_package_model/test_package_model.dart';
import 'package:qris_health/modules/all_scans_module/services/test_service.dart';
import 'package:qris_health/modules/health_module/components/mental_wellness_bottom_navigation_bar.dart';
import 'package:qris_health/modules/health_module/cubits/qris_doctors_cubit/qris_doctors_cubit.dart';
import 'package:qris_health/modules/health_module/cubits/qris_doctors_cubit/qris_doctors_cubit.dart';
import 'package:qris_health/modules/home_module/components/cashback_container.dart';
import 'package:qris_health/shared/components/bullet_point.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/contact_us_container.dart';
import 'package:qris_health/shared/components/faq_list_tile.dart';
import 'package:qris_health/shared/components/heading_text.dart';
import 'package:qris_health/shared/components/how_it_works_container.dart';
import 'package:qris_health/shared/components/meet_the_team_carousel.dart';
import 'package:qris_health/shared/components/mini_tile_container.dart';
import 'package:qris_health/shared/components/what_it_includes_container.dart';
import 'package:qris_health/shared/models/title_and_description_model.dart';
import 'package:qris_health/shared/utils/mixins/general_helper_mixin.dart';
import 'package:qris_health/styles/app_colors.dart';

class MaleInfertilityScreen extends StatefulWidget {
  const MaleInfertilityScreen({super.key});

  @override
  State<MaleInfertilityScreen> createState() => _MaleInfertilityScreenState();
}

class _MaleInfertilityScreenState extends State<MaleInfertilityScreen>
    with GeneralHelperMixin {
  final _textTheme = Get.textTheme;
  final _testId = 272;
  TestPackageModel? _test;

  @override
  void initState() {
    super.initState();
    TestService.getTestByTestId(id: _testId).then((test) {
      _test = test;
      setState(() {});
    });
  }

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
                      'assets/images/illustrations/male_infertility_illustration.png')),
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
                    title: 'Blood Tests (32 Parameters) :-',
                    description:
                        'Thyroid Profile, Testosterone, Semen analysis, HBA1C, Lipid Profile, LFT, HIV Antibodies, HPLC, VDRL, HBSaG',
                    imagePath: ''),
                TitleAndDescriptionModel(
                    title: 'Psychologist Consultation :-',
                    description:
                        'One-on-one expert advice tailored to your mental wellness needs',
                    imagePath: ''),
                TitleAndDescriptionModel(
                    title: 'Surgeon/Physician Consultation :-',
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
                    title: 'Poor Sperm Motility',
                    imagePath:
                        'assets/images/icons/mental_wellness_icons/poor_sperm_motility.png'),
                TitleAndDescriptionModel(
                    title: 'Poor Sperm Quality',
                    imagePath:
                        'assets/images/icons/mental_wellness_icons/poor_sperm_quality_icon.png'),
                TitleAndDescriptionModel(
                    title: 'Overcome Depression',
                    imagePath:
                        'assets/images/icons/mental_wellness_icons/depression_icon.png'),
                TitleAndDescriptionModel(
                    title: 'Surgical procedure if needed',
                    imagePath:
                        'assets/images/icons/mental_wellness_icons/surgical_lab_icon.png'),
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
                        'Inability to conceive primarily due to Sterility in males or Sperms dysfunction. It can be primarily due to:-',
                        style: _textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightText)),
                    SizedBox(height: 4),
                    BulletPoint(
                        text:
                            'Hormonal imbalance- Disease of pituitary or hypothalamus'),
                    SizedBox(height: 4),
                    BulletPoint(
                        text:
                            'Testicle Infertility- Due to drugs, Trauma, infection or genetic factors'),
                    SizedBox(height: 4),
                    BulletPoint(text: 'Sperm Duct Blockage'),
                    SizedBox(height: 4),
                    BulletPoint(
                        text: 'Drugs like Tobacco, smoking & Marijuana'),
                    SizedBox(height: 4),
                    BulletPoint(text: 'Obesity'),
                  ])),
              SizedBox(height: 18),
              HowItWorksContainer(),
              SizedBox(height: 18),
              ContactUsContainer(),
              SizedBox(height: 20),
              if (_test != null)
                BlocBuilder<QrisDoctorsCubit, QrisDoctorsState>(
                    builder: (context, state) {
                  final doctorIds = getIntsFromString(string: _test!.teamIds);

                  return MeetTheTeamCarousel(
                      doctors: BlocProvider.of<QrisDoctorsCubit>(context)
                          .getDoctorsByDoctorIds(doctorIds));
                }),
              SizedBox(height: 20),
              HeadingText(text: 'Frequently Asked Questions'),
              SizedBox(height: 10),
              Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(15)),
                  child: FutureBuilder<List<Faq>>(
                      future: TestService.getFaqsByTestId(testId: _testId),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final faqs = snapshot.data!;

                          return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return FaqListTile(faq: faqs[index]);
                              },
                              itemCount: faqs.length);
                        }

                        return Center(child: CircularProgressIndicator());
                      })),
            ])));
  }
}
