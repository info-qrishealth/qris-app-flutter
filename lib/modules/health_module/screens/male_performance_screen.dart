import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qris_health/modules/all_scans_module/models/faq/faq.dart';
import 'package:qris_health/modules/health_module/components/mental_wellness_bottom_navigation_bar.dart';
import 'package:qris_health/modules/health_module/cubits/qris_doctors_cubit/qris_doctors_cubit.dart';
import 'package:qris_health/modules/health_module/cubits/qris_doctors_cubit/qris_doctors_cubit.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/mini_tile.dart';
import 'package:qris_health/shared/components/mini_tile_container.dart';
import 'package:qris_health/shared/utils/mixins/general_helper_mixin.dart';

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
import '../../all_scans_module/models/test_package_model/test_package_model.dart';
import '../../all_scans_module/services/test_service.dart';
import '../../health_score_module/components/health_score_list_tile.dart';
import '../../home_module/components/cashback_container.dart';

class MalePerformanceScreen extends StatefulWidget {
  const MalePerformanceScreen({super.key});

  @override
  State<MalePerformanceScreen> createState() => _MalePerformanceScreenState();
}

class _MalePerformanceScreenState extends State<MalePerformanceScreen>
    with GeneralHelperMixin {
  final _testId = 274;
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
    final textTheme = Get.textTheme;

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
                      'assets/images/illustrations/male_performance_illustration.png')),
              SizedBox(height: 16),
              HeadingText(
                  text: 'What it includes',
                  style: textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontFamily: AppConstants.latoFontFamily,
                      color: AppColors.primaryPink)),
              SizedBox(height: 8),
              WhatItIncludesContainer(testInfos: [
                TitleAndDescriptionModel(
                    title: 'Blood Tests (58 Parameters) :-',
                    description:
                        'Serum Testosterone, Luteinizing Hormone (LH), Serum Prolactin, Thyroid stimulating hormone (TSH), HBA1C, Lipid profile, Prostate-Specific Antigen (PSA), Liver function Test, Kidney Function Test, Urine Routine, Urine Culture & Sensivity',
                    imagePath: ''),
                TitleAndDescriptionModel(
                    title: 'Psychologist Consultation :-',
                    description:
                        'One-on-one expert advice tailored to your mental wellness needs',
                    imagePath: ''),
                TitleAndDescriptionModel(
                    title: 'Surgeon/Physician Consultation :-',
                    description:
                        'One-on-one expert advice tailored to your mental wellness needs',
                    imagePath: ''),
              ]),
              SizedBox(height: 18),
              CashbackContainer(),
              SizedBox(height: 16),
              HeadingText(text: 'What can we help you with?'),
              SizedBox(height: 13),
              MiniTileContainer(titles: [
                TitleAndDescriptionModel(
                    title: 'Erectile Dysfunction',
                    imagePath:
                        'assets/images/icons/mental_wellness_icons/erectile_dysfunction_icon.png'),
                TitleAndDescriptionModel(
                    title: 'Performance Anxiety',
                    imagePath:
                        'assets/images/icons/mental_wellness_icons/performance_anxiety_icon.png'),
                TitleAndDescriptionModel(
                    title: 'Premature Ejaculation',
                    imagePath:
                        'assets/images/icons/mental_wellness_icons/premature_icon.png'),
                TitleAndDescriptionModel(
                    title: 'Low Libido',
                    imagePath:
                        'assets/images/icons/mental_wellness_icons/low_libido_icon.png'),
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
                        "It consist primarily of erectile problem or Impotence Erectile Dysfunction:- It is inability to allow or maintain erection of Penis for intercourse. Male impotence & impotence symptoms vary from inability to maintain erection to premature ejaculation\nMajor Causes for Mens Health:-",
                        style: textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightText)),
                    SizedBox(height: 4),
                    BulletPoint(
                        text: 'Psychological:- Depression, Anxiety, Fear etc'),
                    SizedBox(height: 4),
                    BulletPoint(text: 'Vascular Disease & Nerve damage'),
                    SizedBox(height: 4),
                    BulletPoint(text: 'Hormonal problems or Drugs'),
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
