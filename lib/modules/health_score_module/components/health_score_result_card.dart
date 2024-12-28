import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/shared/components/underline_text.dart';
import 'package:qris_health/styles/app_colors.dart';

class HealthScoreResultCard extends StatelessWidget {
  HealthScoreResultCard({super.key});
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.primaryBlue.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: AppColors.primaryBlue.withOpacity(0.23), width: 0.7)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    UnderlineText(
                        text: 'BMI Score',
                        style: _textTheme.bodyMedium!.copyWith(
                            color: AppColors.primaryBlue,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppConstants.ubuntuFontFamily)),
                    SizedBox(height: 8),
                    IntrinsicHeight(
                        child: Row(children: [
                      Column(children: [
                        _buildHeightWeightCard(
                            title: 'Height',
                            color: AppColors.primaryPink.withOpacity(0.4),
                            value: '170 cm'),
                        SizedBox(height: 4),
                        _buildHeightWeightCard(
                            title: 'Weight',
                            color: AppColors.primaryBlue.withOpacity(0.24),
                            value: '72 kg'),
                      ]),
                      SizedBox(width: 6),
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                  color: AppColors.primaryBlue,
                                  borderRadius: BorderRadius.circular(6)),
                              child: Column(children: [
                                Text('Body Mass Index',
                                    style: _textTheme.labelSmall!.copyWith(
                                        color: Colors.white, fontSize: 10)),
                                Spacer(),
                                Text('24.9',
                                    style: _textTheme.headlineSmall!.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontFamily:
                                            AppConstants.latoFontFamily)),
                                Spacer(),
                                Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFABFE78),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Text('Healthy Weight',
                                        style: _textTheme.labelSmall!.copyWith(
                                            fontSize: 9,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w400)))
                              ])))
                    ])),
                  ])),
              SizedBox(width: 16),
              Column(children: [
                UnderlineText(
                    text: 'Health Score',
                    style: _textTheme.bodyMedium!.copyWith(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppConstants.ubuntuFontFamily)),
                SizedBox(height: 8),
                Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 6, color: Color(0xFFABFE78))),
                    child: Column(children: [
                      Text('85',
                          style: _textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.w700)),
                      SizedBox(height: 4),
                      Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Color(0xFFABFE78),
                              borderRadius: BorderRadius.circular(6)),
                          child: Text('Excellent',
                              style: _textTheme.labelSmall!.copyWith(
                                  color: AppColors.black,
                                  fontSize: 9,
                                  fontWeight: FontWeight.w400)))
                    ]))
              ])
            ]));
  }

  Widget _buildHeightWeightCard(
      {required String title, required Color color, required String value}) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(6), color: color),
        child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text(title,
              style: _textTheme.labelSmall!.copyWith(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 10)),
          SizedBox(width: 6),
          Column(children: [
            Image.asset('assets/images/icons/health_score_icons/scale_icon.png',
                height: 12),
            SizedBox(height: 2),
            Text(value,
                style: _textTheme.labelSmall!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor,
                    fontSize: 10))
          ])
        ]));
  }
}
