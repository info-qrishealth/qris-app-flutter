import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/doctor_consultation_module/models/doctor/doctor.dart';
import 'package:qris_health/modules/doctor_consultation_module/models/doctor_category/doctor_category.dart';
import 'package:qris_health/modules/doctor_consultation_module/screens/doctor_info_screen.dart';
import 'package:qris_health/shared/components/common_divider.dart';
import 'package:qris_health/shared/components/common_network_image.dart';
import 'package:qris_health/shared/components/underline_text.dart';
import 'package:qris_health/shared/utils/mixins/general_helper_mixin.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../../shared/components/rating_container.dart';

class DoctorListTile extends StatelessWidget with GeneralHelperMixin {
  final Doctor doctor;
  final DoctorCategory doctorCategory;
  DoctorListTile(
      {super.key, required this.doctor, required this.doctorCategory});
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor, width: 0.85),
            borderRadius: BorderRadius.circular(14)),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
              width: 100,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(clipBehavior: Clip.none, children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CommonNetworkImage(
                              placeholderPath:
                                  'assets/images/placeholders/doctor_placeholder_2.png',
                              name: '${doctor.pic}',
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover)),
                      Positioned(
                          left: -5,
                          bottom: 8,
                          child: Stack(alignment: Alignment.center, children: [
                            SvgPicture.asset(
                                'assets/images/icons/experience_strip.svg',
                                height: 16),
                            Padding(
                                padding: const EdgeInsets.only(top: 1.5),
                                child: Text(
                                    '${doctor.docExperience?.split(' ').firstOrNull}+ Year Experience',
                                    style: TextStyle(
                                        fontSize: 8.19,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)))
                          ])),
                    ]),
                    SizedBox(height: 4),
                    Text('${doctorCategory.title}',
                        textAlign: TextAlign.center,
                        style: _textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.6))),
                    SizedBox(height: 8),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      RatingContainer(
                          ratings:
                              '${double.tryParse('${doctor.rating}')?.toStringAsFixed(1) ?? 0}'),
                      SizedBox(width: 4),
                      Flexible(
                          child: Text(
                              '(${int.tryParse(doctor.review ?? '') ?? '0'} reviews)',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: AppConstants.latoFontFamily)))
                    ])
                  ])),
          SizedBox(width: 10),
          Expanded(
              flex: 2,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(children: [
                      Flexible(
                          child: Text('${doctor.docName?.trim()}',
                              style: _textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black.withOpacity(0.6)))),
                      SizedBox(width: 4),
                      if (doctor.verified == '1')
                        Image.asset('assets/images/icons/verified_icon_2.png',
                            height: 16)
                    ]),
                    SizedBox(height: 4),
                    if (doctor.trusted == '1')
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                          decoration: BoxDecoration(
                              color: AppColors.primaryBlue,
                              borderRadius: BorderRadius.circular(85)),
                          child: Text('Most Trusted',
                              style: _textTheme.labelSmall!.copyWith(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white))),
                    SizedBox(height: 8),
                    CommonDivider(height: 1),
                    SizedBox(height: 8),
                    Text(
                        doctor.educations
                            .map((education) => education.education)
                            .join(' | '),
                        style: _textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.6))),
                    SizedBox(height: 10),
                    Row(children: [
                      UnderlineText(
                          text: 'Consultation Fees',
                          underlineColor: AppColors.primaryPink,
                          style: _textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontFamily: AppConstants.ubuntuFontFamily,
                              color: AppColors.primaryPink)),
                      SizedBox(width: 6),
                      Text('₹${doctor.fees}',
                          style: _textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w800,
                              color: AppColors.lightText)),
                    ]),
                    SizedBox(height: 10),
                    Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                            color: AppColors.borderColor,
                            borderRadius: BorderRadius.circular(100)),
                        child: IntrinsicHeight(
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                              GestureDetector(
                                  onTap: () async {
                                    await openDialPad(
                                        phoneNumber: '${doctor.docPhone}');
                                  },
                                  child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.primaryBlue
                                              .withOpacity(0.3)),
                                      child: Image.asset(
                                          'assets/images/icons/call_icon.png',
                                          height: 20))),
                              SizedBox(width: 8),
                              Expanded(
                                  child: SizedBox(
                                      height: 32,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                CupertinoPageRoute(
                                                    builder: (context) =>
                                                        DoctorInfoScreen(
                                                            doctor: doctor,
                                                            selectedCategory:
                                                                doctorCategory)));
                                          },
                                          child: Text('View Profile',
                                              style: _textTheme.bodyLarge!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white))))),
                            ])))
                  ]))
        ]));
  }
}
