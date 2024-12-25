import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/home_module/components/cashback_container.dart';
import 'package:qris_health/modules/home_module/components/package_tile.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/contact_us_container.dart';
import 'package:qris_health/shared/components/discount_coupon_container.dart';
import 'package:qris_health/shared/components/faq_list_tile.dart';
import 'package:qris_health/styles/app_colors.dart';

class BloodTestDetailScreen extends StatefulWidget {
  const BloodTestDetailScreen({super.key});

  @override
  State<BloodTestDetailScreen> createState() => _BloodTestDetailScreenState();
}

class _BloodTestDetailScreenState extends State<BloodTestDetailScreen> {
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
          DiscountCouponContainer(),
          Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.scaffoldPadding, vertical: 16),
              decoration: BoxDecoration(color: AppColors.primaryBlue),
              child: SafeArea(
                  child: Row(children: [
                Expanded(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 1),
                          child: Text('₹ 1999',
                              style: _textTheme.titleLarge!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  decoration: TextDecoration.lineThrough))),
                      SizedBox(width: 18),
                      Text('₹ 1099 *',
                          style: _textTheme.headlineLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                    ])),
                SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        child: Text('  Book Now  ',
                            style: _textTheme.titleLarge!
                                .copyWith(fontWeight: FontWeight.w800))))
              ]))),
        ]),
        appBar: CommonAppBar(title: 'Details'),
        body: SafeArea(
            child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.scaffoldPadding),
                children: [
              SizedBox(height: 16),
              SizedBox(height: 150, child: PackageTileHorizontal()),
              SizedBox(height: 18),
              DottedBorder(
                  strokeWidth: 0.7,
                  borderType: BorderType.RRect,
                  color: AppColors.primaryPink,
                  radius: Radius.circular(8),
                  borderPadding: EdgeInsets.zero,
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 9),
                      decoration: BoxDecoration(
                          color: AppColors.primaryPink.withOpacity(0.11)),
                      child: Row(children: [
                        Expanded(
                            child: _buildInfoRow(
                                svgPath: 'assets/images/icons/food_icon.svg',
                                title: 'Fasting Time : ',
                                description: ' 10-12 hours')),
                        _buildInfoRow(
                            svgPath: 'assets/images/icons/clock_icon.svg',
                            title: 'Report Time : ',
                            description: ' 24 hours'),
                      ]))),
              SizedBox(height: 18),
              CashbackContainer(),
              SizedBox(height: 18),
              Text('Description',
                  style: _textTheme.titleMedium!
                      .copyWith(fontWeight: FontWeight.w700)),
              SizedBox(height: 8),
              Container(
                  padding: EdgeInsets.all(9),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black.withOpacity(0.09)),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'A full body check-up is a series of tests that are done to detect any health issues that you may have. It can be done on an individual or a group of people. It is usually done with vitamin d and b12 in Delhi office or he ..... ',
                            style: _textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.w400, height: 1.2)),
                        SizedBox(height: 12),
                        Text('Read More',
                            style: _textTheme.bodySmall!.copyWith(
                                color: AppColors.primaryPink,
                                fontWeight: FontWeight.w400)),
                      ])),
              SizedBox(height: 18),
              ContactUsContainer(),
              SizedBox(height: 18),
              Text('Parameters Included - 89',
                  style: _textTheme.titleMedium!
                      .copyWith(fontWeight: FontWeight.w700)),
              SizedBox(height: 8),
              Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.primaryBlue, width: 0.7),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(children: [
                    _buildExpansionTile(title: 'Liver Function Test (10)'),
                    _buildExpansionTile(
                        title: 'CBC Test (Complete Hemogram) (10)'),
                    _buildExpansionTile(title: 'Iron Studies (10)'),
                    _buildExpansionTile(title: 'HBA1C (10)'),
                    _buildExpansionTile(title: 'Blood Glucose Fasting (10)'),
                    _buildExpansionTile(
                        title: 'Vitamin D Total - 25 Hydroxy (10)'),
                    _buildExpansionTile(title: 'Any Other (10)'),
                    _buildExpansionTile(
                        title: 'Urine Routine & Microscopy Extended (10)'),
                  ])),
              SizedBox(height: 18),
              Text('Benefits',
                  style: _textTheme.titleMedium!
                      .copyWith(fontWeight: FontWeight.w700)),
              SizedBox(height: 8),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: Colors.black.withOpacity(0.09))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBenefitRow(
                            title:
                                'Free Home Sample Collection by Vaccinated Professionals',
                            assetPath:
                                'assets/images/icons/test_benefit_icons/cycle_icon.svg'),
                        _buildBenefitRow(
                            title: 'Free Doctor Consultation from Expert Team',
                            assetPath:
                                'assets/images/icons/test_benefit_icons/doctor_icon.svg'),
                        _buildBenefitRow(
                            title:
                                'Doctor verified reports with 3-step review process',
                            assetPath:
                                'assets/images/icons/test_benefit_icons/verified_benefit_icon.svg'),
                        _buildBenefitRow(
                            title:
                                'Smart Reporting - Detailed information on each test',
                            assetPath:
                                'assets/images/icons/test_benefit_icons/sim_icon.svg'),
                        _buildBenefitRow(
                            title: 'Expert Team of Medical Professionals',
                            assetPath:
                                'assets/images/icons/test_benefit_icons/users_icon.svg'),
                      ])),
              SizedBox(height: 18),
              Text('Frequently Asked Questions',
                  style: _textTheme.titleMedium!
                      .copyWith(fontWeight: FontWeight.w700)),
              SizedBox(height: 8),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black.withOpacity(0.09)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(children: [
                    FaqListTile(
                        question:
                            'For what disorders is ESR a diagnostic tool?',
                        answer:
                            'When Should an ESR Test Be Performed? When a child shows symptoms of infection or inflammation, doctors may request an ESR test. It is possible to monitor the efficacy of treatment for inflammation or infection using ESR testing'),
                    FaqListTile(
                        question: 'Should I be concerned about a high ESR?',
                        answer:
                            'When Should an ESR Test Be Performed? When a child shows symptoms of infection or inflammation, doctors may request an ESR test. It is possible to monitor the efficacy of treatment for inflammation or infection using ESR testing'),
                    FaqListTile(
                        question: 'What is the usual range of ESR?',
                        answer:
                            'When Should an ESR Test Be Performed? When a child shows symptoms of infection or inflammation, doctors may request an ESR test. It is possible to monitor the efficacy of treatment for inflammation or infection using ESR testing')
                  ])),
              SizedBox(height: 16),
              Text('Related blood test packages',
                  style: _textTheme.titleMedium!
                      .copyWith(fontWeight: FontWeight.w700)),
              SizedBox(height: 8),
              SizedBox(
                  height: 150,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return PackageTileHorizontal();
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 8);
                      },
                      itemCount: 10)),
              SizedBox(height: 26),
            ])));
  }

  Widget _buildInfoRow(
      {required String svgPath,
      required String title,
      required String description}) {
    return Row(children: [
      SvgPicture.asset(svgPath, height: 16),
      SizedBox(width: 4),
      Text.rich(TextSpan(children: [
        TextSpan(
            text: title,
            style: _textTheme.bodySmall!.copyWith(
                color: AppColors.primaryPink, fontWeight: FontWeight.w400)),
        TextSpan(
            text: description,
            style: TextStyle(
                color: AppColors.primaryPink, fontWeight: FontWeight.w700)),
      ])),
    ]);
  }

  Widget _buildExpansionTile({required String title}) {
    return ExpansionTile(
        minTileHeight: 30,
        tilePadding: EdgeInsets.symmetric(horizontal: 10),
        title: Text(title,
            style: _textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w400)),
        childrenPadding: EdgeInsets.symmetric(horizontal: 9),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        expandedAlignment: Alignment.centerLeft,
        trailing: Icon(Icons.keyboard_arrow_down_outlined,
            color: AppColors.primaryBlue, size: 20),
        children: [
          Text('Chlorides, Serum',
              style: _textTheme.labelSmall!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightSubTextColor)),
          SizedBox(height: 2),
          Text('Chlorides, Serum',
              style: _textTheme.labelSmall!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightSubTextColor)),
          SizedBox(height: 2),
          Text('Chlorides, Serum',
              style: _textTheme.labelSmall!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightSubTextColor)),
          SizedBox(height: 8)
        ]);
  }

  Widget _buildBenefitRow({required String title, required String assetPath}) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(children: [
          SvgPicture.asset(assetPath),
          SizedBox(width: 8),
          Text(title,
              style: _textTheme.bodySmall!.copyWith(
                  color: AppColors.primaryPink, fontWeight: FontWeight.w400))
        ]));
  }
}
