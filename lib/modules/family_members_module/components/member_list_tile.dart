import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/shared/components/underline_text.dart';
import 'package:qris_health/styles/app_colors.dart';

class MemberListTile extends StatelessWidget {
  final int index;
  MemberListTile({super.key, required this.index});
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    final shouldShow = index % 2 == 0;

    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.black.withOpacity(0.09)),
            borderRadius: BorderRadius.circular(12)),
        child: Column(children: [
          Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(),
              child: IntrinsicHeight(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                    Image.asset(
                        'assets/images/placeholders/male_placeholder.png',
                        height: 35),
                    SizedBox(width: 12),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                          Row(children: [
                            Text('Puneet Bajaj',
                                style: _textTheme.titleMedium!
                                    .copyWith(fontWeight: FontWeight.w600)),
                            SizedBox(width: 10),
                            if (index == 0) _buildSelfChip(),
                          ]),
                          SizedBox(height: 4),
                          Row(children: [
                            Text('Male',
                                style: _textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.lightSubTextColor)),
                            SizedBox(width: 8),
                            Container(
                                margin: EdgeInsets.only(top: 2),
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                    color: AppColors.black,
                                    shape: BoxShape.circle)),
                            SizedBox(width: 8),
                            Text('37Y 5M 10D',
                                style: _textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.lightSubTextColor)),
                          ]),
                        ])),
                    VerticalDivider(
                        color: Colors.black.withOpacity(0.7), width: 1),
                    SizedBox(width: 8),
                    SvgPicture.asset('assets/images/icons/edit_icon.svg'),
                  ]))),
          Row(children: [
            Expanded(
                child: _buildInfoContainer(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(12)),
                    title: 'BMI',
                    customDescription: shouldShow
                        ? _buildUnderlineText(text: 'Know your BMI')
                        : null,
                    value: shouldShow ? 'NA' : '24.9',
                    descriptionText: shouldShow ? null : '(Healthy Weight)')),
            Expanded(
                child: _buildInfoContainer(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(12)),
                    title: 'Health Score',
                    value: shouldShow ? 'NA' : '85',
                    customDescription: shouldShow
                        ? _buildUnderlineText(text: 'Know your health score')
                        : null,
                    descriptionText: shouldShow ? null : '(Excellent)')),
          ]),
        ]));
  }

  Widget _buildSelfChip() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Color(0xFFFFF7B6)),
        child: Text('Self',
            style: _textTheme.labelSmall!.copyWith(
                fontWeight: FontWeight.w500, color: Color(0xFFB6A400))));
  }

  Widget _buildInfoContainer(
      {required String title,
      required String value,
      required String? descriptionText,
      Widget? customDescription,
      BorderRadius? borderRadius}) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: AppColors.primaryPink.withOpacity(0.12),
            borderRadius: borderRadius),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          RichText(
              text: TextSpan(
                  style: _textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryBlue),
                  children: [
                TextSpan(text: '$title - '),
                TextSpan(
                    text: value, style: TextStyle(fontWeight: FontWeight.w800)),
              ])),
          SizedBox(height: 2),
          if (descriptionText != null)
            Text(descriptionText,
                style: _textTheme.bodySmall!
                    .copyWith(color: AppColors.primaryBlue.withOpacity(0.65))),
          if (customDescription != null) customDescription
        ]));
  }

  Widget _buildUnderlineText({required String text}) {
    return UnderlineText(
        text: text,
        underlineColor: AppColors.primaryPink,
        style: _textTheme.labelSmall!.copyWith(
            color: AppColors.primaryPink, fontWeight: FontWeight.w400));
  }
}
