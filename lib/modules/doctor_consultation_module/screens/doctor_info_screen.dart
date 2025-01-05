import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/doctor_consultation_module/components/doctor_list_tile.dart';
import 'package:qris_health/shared/components/bullet_point.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/common_divider.dart';
import 'package:qris_health/shared/components/heading_text.dart';
import 'package:qris_health/shared/components/rating_container.dart';
import 'package:qris_health/styles/app_colors.dart';

class DoctorInfoScreen extends StatelessWidget {
  DoctorInfoScreen({super.key});
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Dr. Praveen Shukla'),
        body: SafeArea(
            child: ListView(
                padding: EdgeInsets.symmetric(
                    vertical: 16, horizontal: AppConstants.scaffoldPadding),
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
              Container(
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(alignment: Alignment.bottomCenter, children: [
                          ClipOval(
                              child: Image.asset(
                                  'assets/images/placeholders/doctor_placeholder_2.png',
                                  fit: BoxFit.cover,
                                  height: 140,
                                  width: 140)),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                  color: AppColors.primaryBlue,
                                  borderRadius: BorderRadius.circular(100)),
                              child: Text('Most Trusted',
                                  style: _textTheme.labelSmall!.copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white))),
                        ]),
                        SizedBox(height: 6),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Dr. Praveen Shukla',
                                  style: _textTheme.headlineSmall!.copyWith(
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.w700)),
                              SizedBox(width: 10),
                              Image.asset(
                                  'assets/images/icons/verified_icon_2.png',
                                  height: 24),
                            ]),
                        SizedBox(height: 6),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Orthopedic',
                                  style: _textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black60)),
                              SizedBox(width: 8),
                              RatingContainer(),
                            ]),
                        SizedBox(height: 4),
                        Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text('MS in Orthopedics',
                                  style: _textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black.withOpacity(0.6))),
                              SizedBox(width: 8),
                              Text('|',
                                  style: _textTheme.titleMedium!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black.withOpacity(0.5))),
                              SizedBox(width: 8),
                              Text('MBBS',
                                  style: _textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black.withOpacity(0.6))),
                            ]),
                        SizedBox(height: 8),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: CommonDivider(height: 1)),
                        SizedBox(height: 8),
                        Text(
                            'Orthopedy Sports Medicine, Orthopedic Surgery, Total Femur Replacement, Neck and Spine BiopsyOrthopedy Sports Medicine, Orthopedic Surgery, Total Femur Replacement, Neck and Spine Biopsy',
                            style: _textTheme.bodyLarge!.copyWith(
                                color: AppColors.lightText,
                                fontWeight: FontWeight.w400,
                                height: 1.22),
                            textAlign: TextAlign.center),
                        SizedBox(height: 10),
                        Text('22 years of experience',
                            style: _textTheme.bodyLarge!
                                .copyWith(fontWeight: FontWeight.w700)),
                        SizedBox(height: 12),
                        Container(
                            padding: EdgeInsets.symmetric(vertical: 9),
                            decoration: BoxDecoration(
                                color: AppColors.primaryPink.withOpacity(0.04),
                                borderRadius: BorderRadius.circular(36)),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Consultation Fees',
                                      style: _textTheme.bodyLarge!.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.primaryPink)),
                                  SizedBox(width: 12),
                                  Text('₹800/-',
                                      style: _textTheme.titleLarge!.copyWith(
                                          fontWeight: FontWeight.w800,
                                          fontFamily:
                                              AppConstants.latoFontFamily)),
                                ])),
                      ])),
              SizedBox(height: 12),
              HeadingText(text: 'Contact'),
              SizedBox(height: 10),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 9),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(color: AppColors.borderColor)),
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                        text: 'Mobile number:-',
                        style: _textTheme.bodySmall!.copyWith(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w500)),
                    TextSpan(
                        text: ' 9999999999\n',
                        style: _textTheme.bodySmall!.copyWith(
                            color: AppColors.lightText,
                            fontWeight: FontWeight.w400)),
                    TextSpan(
                        text: 'Address:-',
                        style: _textTheme.bodySmall!.copyWith(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w500)),
                    TextSpan(
                        text:
                            ' D-13, Pocket-5, Near RK Hospital, Ganesh Nagar, New Delhi-110092 ',
                        style: _textTheme.bodySmall!.copyWith(
                            color: AppColors.lightText,
                            fontWeight: FontWeight.w400))
                  ]))),
              SizedBox(height: 12),
              HeadingText(text: 'About Doctor'),
              SizedBox(height: 10),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 9),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(color: AppColors.borderColor)),
                  child: Text(
                      'Dr. Praveen Shukla is a top specialist at Max Hospital at India. He has achieved several awards and recognition for is contribution and service in his own field. He is available for private consultation.',
                      style: _textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightText))),
              SizedBox(height: 12),
              HeadingText(text: 'Education'),
              SizedBox(height: 10),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(color: AppColors.borderColor)),
                  child: Column(children: [
                    BulletPoint(
                        text:
                            'MBBS, University College of Medical Sciences & GTB Hospital, New delhi-1987'),
                    SizedBox(height: 2),
                    BulletPoint(
                        text:
                            'MS in Orthopedics, RNT Medical College, Udaipur, 1993')
                  ])),
              SizedBox(height: 24),
              HeadingText(text: 'Other Dentists'),
              SizedBox(height: 10),
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return DoctorListTile();
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  },
                  itemCount: 3)
            ])));
  }
}
