import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/doctor_consultation_module/components/doctor_list_tile.dart';
import 'package:qris_health/modules/doctor_consultation_module/models/doctor/doctor.dart';
import 'package:qris_health/modules/doctor_consultation_module/models/doctor_category/doctor_category.dart';
import 'package:qris_health/modules/doctor_consultation_module/services/doctor_service.dart';
import 'package:qris_health/shared/components/bullet_point.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/common_divider.dart';
import 'package:qris_health/shared/components/common_network_image.dart';
import 'package:qris_health/shared/components/heading_text.dart';
import 'package:qris_health/shared/components/rating_container.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';
import 'package:qris_health/styles/app_colors.dart';

class DoctorInfoScreen extends StatefulWidget {
  final DoctorCategory selectedCategory;
  final Doctor doctor;
  const DoctorInfoScreen(
      {super.key, required this.doctor, required this.selectedCategory});

  @override
  State<DoctorInfoScreen> createState() => _DoctorInfoScreenState();
}

class _DoctorInfoScreenState extends State<DoctorInfoScreen> {
  final _textTheme = Get.textTheme;
  late Future<List<Doctor>> _doctorFuture;

  @override
  void initState() {
    super.initState();
    _doctorFuture = DoctorService.getDoctorsByCategory(
        categoryId: widget.selectedCategory.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: '${widget.doctor.docName}'),
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
                              child: CommonNetworkImage(
                                  name: '${widget.doctor.pic}',
                                  placeholderPath:
                                      'assets/images/placeholders/doctor_placeholder_2.png',
                                  fit: BoxFit.cover,
                                  height: 140,
                                  width: 140)),
                          if (widget.doctor.trusted == '1')
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
                              Text('${widget.doctor.docName}',
                                  style: _textTheme.headlineSmall!.copyWith(
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.w700)),
                              SizedBox(width: 10),
                              if (widget.doctor.verified == '1')
                                Image.asset(
                                    'assets/images/icons/verified_icon_2.png',
                                    height: 24),
                            ]),
                        SizedBox(height: 6),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                  child: Text(
                                      '${widget.selectedCategory.title}',
                                      style: _textTheme.bodyLarge!.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.black60))),
                              SizedBox(width: 8),
                              RatingContainer(
                                  ratings:
                                      '${double.tryParse('${widget.doctor.rating}')?.toStringAsFixed(1) ?? 0}'),
                            ]),
                        SizedBox(height: 4),
                        Text(
                            widget.doctor.educations
                                .map((education) => education.education)
                                .join(' | '),
                            style: _textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.6))),
                        SizedBox(height: 8),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: CommonDivider(height: 1)),
                        SizedBox(height: 8),
                        Text(
                            '${widget.doctor.docSpeciality?.replaceAll('|', ' | ')}',
                            style: _textTheme.bodyLarge!.copyWith(
                                color: AppColors.lightText,
                                fontWeight: FontWeight.w400,
                                height: 1.22),
                            textAlign: TextAlign.center),
                        SizedBox(height: 10),
                        Text(
                            '${widget.doctor.docExperience?.split(' ').firstOrNull ?? 'N/A'} years of experience',
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
                                  Text('₹${widget.doctor.fees}/-',
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
                        text: ' ${widget.doctor.docPhone?.trim()}\n',
                        style: _textTheme.bodySmall!.copyWith(
                            color: AppColors.lightText,
                            fontWeight: FontWeight.w400)),
                    TextSpan(
                        text: 'Address:-',
                        style: _textTheme.bodySmall!.copyWith(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w500)),
                    TextSpan(
                        text: widget.doctor.docAddress ?? 'N/A',
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
                  child: Text('${widget.doctor.description}',
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
                  child: Column(
                      children: widget.doctor.educations
                          .map((education) => BulletPoint(
                              text:
                                  '${education.education}${education.college.isNullOrEmpty ? '' : ', ${education.college}'}'))
                          .toList())),
              SizedBox(height: 24),
              HeadingText(text: 'Other ${widget.selectedCategory.title}'),
              SizedBox(height: 10),
              FutureBuilder<List<Doctor>>(
                  future: _doctorFuture,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Container();
                    final doctors = snapshot.data!;

                    return ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final doctor = doctors[index];

                          return DoctorListTile(
                              doctor: doctor,
                              doctorCategory: widget.selectedCategory);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 10);
                        },
                        itemCount: doctors.length > 5 ? 5 : doctors.length);
                  }),
            ])));
  }
}
