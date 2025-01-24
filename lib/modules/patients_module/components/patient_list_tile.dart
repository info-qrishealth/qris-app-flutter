import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/enums/gender.dart';
import 'package:qris_health/modules/patients_module/components/add_patient_bottom_sheet.dart';
import 'package:qris_health/modules/patients_module/models/patient/patient.dart';
import 'package:qris_health/shared/components/underline_text.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../../constants/app_constants.dart';

class PatientListTile extends StatefulWidget {
  final Patient? patient;
  final int index;
  const PatientListTile({super.key, required this.index, this.patient});

  @override
  State<PatientListTile> createState() => _PatientListTileState();
}

class _PatientListTileState extends State<PatientListTile> {
  final _textTheme = Get.textTheme;
  Patient? _patient;

  @override
  void initState() {
    super.initState();
    _patient = widget.patient;
  }

  @override
  Widget build(BuildContext context) {
    double? bmi;
    if (_patient?.weight != null && _patient?.height != null) {
      bmi = _calculateBMI(
          _patient!.height!.toDouble(), _patient!.weight!.toDouble());
    }

    final gender = _patient?.gender == '0'
        ? Gender.OTHERS
        : _patient?.gender == '1'
            ? Gender.FEMALE
            : Gender.MALE;

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
                        gender == Gender.MALE
                            ? 'assets/images/placeholders/male_placeholder.png'
                            : 'assets/images/placeholders/female_placeholder.png',
                        height: 35),
                    SizedBox(width: 12),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                          Row(children: [
                            Text('${widget.patient?.name}',
                                style: _textTheme.titleMedium!
                                    .copyWith(fontWeight: FontWeight.w600)),
                            SizedBox(width: 10),
                            if (_patient?.self == '1') _buildSelfChip(),
                          ]),
                          SizedBox(height: 4),
                          Row(children: [
                            Text(gender.name.formattedEnumName ?? 'N/A',
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
                            Text(
                                widget.patient?.dob == null
                                    ? 'DOB N/A'
                                    : _formatDateDifference(
                                        widget.patient!.dob.toDateTime!,
                                        DateTime.now()),
                                style: _textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.lightSubTextColor)),
                          ]),
                        ])),
                    VerticalDivider(
                        color: Colors.black.withOpacity(0.7), width: 1),
                    SizedBox(width: 8),
                    InkWell(
                        onTap: () async {
                          await showModalBottomSheet(
                              isScrollControlled: true,
                              constraints: AppConstants.bottomSheetConstraints,
                              context: context,
                              builder: (context) => AddPatientBottomSheet(
                                  patient: _patient,
                                  getAddedPatient: null,
                                  getUpdatedPatient: (patient) {
                                    setState(() {
                                      _patient = patient;
                                    });
                                  }));
                        },
                        child: SvgPicture.asset(
                            'assets/images/icons/edit_icon.svg')),
                  ]))),
          Row(children: [
            Expanded(
                child: _buildInfoContainer(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(12)),
                    title: 'BMI',
                    customDescription: bmi == null
                        ? _buildUnderlineText(text: 'Know your BMI')
                        : null,
                    value: bmi == null ? 'NA' : bmi.toStringAsFixed(1),
                    descriptionText:
                        bmi == null ? null : '(${_getBmiText(bmi: bmi)})')),
            Expanded(
                child: _buildInfoContainer(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(12)),
                    title: 'Health Score',
                    value: true ? 'NA' : '85',
                    customDescription: true
                        ? _buildUnderlineText(text: 'Know your health score')
                        : null,
                    descriptionText: true ? null : '(Excellent)')),
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

  String _formatDateDifference(DateTime from, DateTime to) {
    if (from.isAfter(to)) {
      DateTime temp = from;
      from = to;
      to = temp;
    }

    int years = to.year - from.year;
    int months = to.month - from.month;
    int days = to.day - from.day;

    if (days < 0) {
      final previousMonth = DateTime(to.year, to.month - 1, from.day);
      days = to.difference(previousMonth).inDays;
      months -= 1;
    }
    if (months < 0) {
      months += 12;
      years -= 1;
    }

    return '${years}Y ${months}M ${days}D';
  }

  double _calculateBMI(double heightInCm, double weightInKg) {
    double heightInMeters = heightInCm / 100;
    return weightInKg / (heightInMeters * heightInMeters);
  }

  String _getBmiText({required double bmi}) {
    if (bmi < 18.5) {
      return 'Under Weight';
    } else if (bmi > 18.5 && bmi < 24.9) {
      return 'Normal Weight';
    } else if (bmi > 24.9 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }
}
