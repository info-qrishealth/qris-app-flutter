import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/generated/assets.dart';
import 'package:qris_health/modules/home_module/screens/chronic_packages_screen.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/heading_text.dart';
import 'package:qris_health/shared/components/outlined_icon_button.dart';
import 'package:qris_health/shared/components/verified_tick_row.dart';

import '../../../shared/components/bordered_container.dart';
import '../../../styles/app_colors.dart';
import '../../screens/blood_test_detail_screen.dart';
import '../components/package_tile_horizontal.dart';
import '../popular_packages_cubit/popular_packages_cubit.dart';

class ChronicDiseaseScreen extends StatelessWidget {
  const ChronicDiseaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Scaffold(
        appBar: CommonAppBar(title: 'Chronic Wellness'),
        body: SafeArea(
            child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.scaffoldPadding, vertical: 16),
                children: [
              HeadingText(text: 'Stay Ahead of Chronic Conditions'),
              SizedBox(height: 6),
              Text(
                  'At Qris Health, we believe that managing chronic illnesses such as Diabetes, Hypertension, Heart disease, Thyroid disorders, and Kidney conditions isn’t just about treatment—it’s about ongoing monitoring, lifestyle adjustments, and early detection. Our comprehensive Chronic Disease Management Packages are specially designed to help you stay in control of your health and prevent complications before they arise.',
                  style: textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.w400, height: 1.5)),
              SizedBox(height: 20),
              Image.asset(Assets.illustrationsChronicIllustration, height: 204),
              SizedBox(height: 20),
              HeadingText(
                  text:
                      'Why Choose Qris Health for Chronic Disease Management?'),
              SizedBox(height: 10),
              BorderedContainer(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 8),
                      child: Column(children: [
                        _buildRow(
                            title: 'Consistent Monitoring: ',
                            text:
                                'Track changes in your condition over time with regular testing.'),
                        SizedBox(height: 4),
                        _buildRow(
                            title: 'Doctor-Recommended Panels: ',
                            text:
                                'Our test packages are curated in consultation with leading specialists.'),
                        SizedBox(height: 4),
                        _buildRow(
                            title: 'Preventive Focus: ',
                            text:
                                'Detect health deterioration before symptoms worsen.'),
                        SizedBox(height: 4),
                        _buildRow(
                            title: 'Easy Booking & Home Collection: ',
                            text: 'Get tested from the comfort of your home.'),
                      ]))),
              SizedBox(height: 20),
              HeadingText(text: 'Chronic Disease Management Packages'),
              SizedBox(height: 10),
              BorderedContainer(
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Each package includes:',
                                style: textTheme.bodySmall!
                                    .copyWith(fontWeight: FontWeight.w400)),
                            SizedBox(height: 4),
                            VerifiedTickRow(
                                title: 'Comprehensive blood investigations',
                                textColor: Colors.black),
                            SizedBox(height: 4),
                            VerifiedTickRow(
                                title: 'Specialist doctor consultations',
                                textColor: Colors.black),
                            SizedBox(height: 4),
                            VerifiedTickRow(
                                title: 'Dietitian consultation and follow-up',
                                textColor: Colors.black),
                            SizedBox(height: 4),
                            VerifiedTickRow(
                                title: 'Physiotherapy assessment and guidance',
                                textColor: Colors.black),
                            SizedBox(height: 4),
                            VerifiedTickRow(
                                title: 'Follow-up support',
                                textColor: Colors.black),
                            SizedBox(height: 4),
                            SizedBox(
                                height: 36,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primaryBlue),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  ChronicPackagesScreen()));
                                    },
                                    child: Text(
                                        'Explore Chronic health packages',
                                        style: textTheme.bodyLarge!.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white))))
                          ])))
            ])));
  }

  Widget _buildRow({required String title, required String text}) {
    final textTheme = Get.textTheme;

    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SvgPicture.asset(Assets.testBenefitIconsVerifiedBenefitIcon,
          color: AppColors.primaryBlue,
          fit: BoxFit.fill,
          height: 24,
          width: 24),
      SizedBox(width: 4),
      Expanded(
          child: RichText(
              text: TextSpan(children: [
        TextSpan(
            text: title,
            style: textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w700, color: AppColors.primaryPink)),
        TextSpan(
            text: text,
            style: textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400, color: AppColors.primaryPink))
      ])))
    ]);
  }
}
