import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/enums/gender.dart';
import 'package:qris_health/modules/health_score_module/models/health_score_res_model/health_score_res_model.dart';
import 'package:qris_health/modules/health_score_module/screens/health_score_intro_screen.dart';
import 'package:qris_health/modules/health_score_module/services/health_score_service.dart';
import 'package:qris_health/modules/patients_module/components/add_patient_bottom_sheet.dart';
import 'package:qris_health/modules/patients_module/cubits/patients_cubit/patients_cubit.dart';
import 'package:qris_health/modules/patients_module/extensions/patient_extension.dart';
import 'package:qris_health/modules/patients_module/models/patient/patient.dart';
import 'package:qris_health/shared/components/underline_text.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';
import 'package:qris_health/shared/utils/mixins/general_helper_mixin.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../../constants/app_constants.dart';

class PatientListTile extends StatefulWidget {
  final Patient? patient;
  final int index;
  const PatientListTile({super.key, required this.index, this.patient});

  @override
  State<PatientListTile> createState() => _PatientListTileState();
}

class _PatientListTileState extends State<PatientListTile>
    with GeneralHelperMixin {
  final _textTheme = Get.textTheme;
  Patient? _patient;
  late Future<HealthScoreResModel?> _healthScoreFuture;

  @override
  void initState() {
    super.initState();
    _healthScoreFuture = HealthScoreService.getPatientHealthScore(
        patientId: widget.patient!.id!.toString());
    _patient = widget.patient;
  }

  @override
  Widget build(BuildContext context) {
    double? bmi;

    final isUnderAge = _patient.isUnderAge;

    if (!isUnderAge && _patient?.weight != null && _patient?.height != null) {
      bmi = _patient.bmi;
    }

    final gender = _patient?.genderEnum;

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
                            Text('${_patient?.name}',
                                style: _textTheme.titleMedium!
                                    .copyWith(fontWeight: FontWeight.w600)),
                            SizedBox(width: 10),
                            if (_patient?.self == '1') _buildSelfChip(),
                          ]),
                          SizedBox(height: 4),
                          Row(children: [
                            Text(gender?.name.formattedEnumName ?? 'N/A',
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
                                _patient?.dob == null
                                    ? 'DOB N/A'
                                    : BlocProvider.of<PatientsCubit>(context)
                                            .getFormattedAgeOfPatient(
                                                patientId: _patient?.id) ??
                                        'N/A',
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

                                    BlocProvider.of<PatientsCubit>(context)
                                        .updatePatient(patient);
                                  }));
                        },
                        child: SvgPicture.asset(
                            'assets/images/icons/edit_icon.svg')),
                  ]))),
          FutureBuilder<HealthScoreResModel?>(
              future: _healthScoreFuture,
              builder: (context, snapshot) {
                final hasData = snapshot.hasData;
                final healthScore = snapshot.data;

                return IntrinsicHeight(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                      Expanded(
                          child: _buildInfoContainer(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12)),
                              title: 'BMI',
                              customDescription: isUnderAge
                                  ? null
                                  : bmi == null
                                      ? _buildUnderlineText(
                                          text: 'Know your BMI')
                                      : null,
                              value: bmi == null || isUnderAge
                                  ? 'NA'
                                  : bmi.toStringAsFixed(1),
                              descriptionText: isUnderAge
                                  ? '(Underage to calculate BMI)'
                                  : bmi == null
                                      ? null
                                      : '(${getBmiInfo(bmi: bmi).text})',
                              onTap: () => _navigate(isUnderAge: isUnderAge))),
                      VerticalDivider(
                          width: 1,
                          thickness: 0.4,
                          color: AppColors.primaryPink),
                      Expanded(
                          child: _buildInfoContainer(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(12)),
                              title: 'Health Score',
                              value: isUnderAge || !hasData
                                  ? 'NA'
                                  : snapshot.data?.healthScore ?? 'NA',
                              customDescription: isUnderAge
                                  ? null
                                  : healthScore == null
                                      ? _buildUnderlineText(
                                          text: 'Know your health score')
                                      : null,
                              descriptionText: isUnderAge
                                  ? '(Underage for health score)'
                                  : healthScore != null
                                      ? '(${snapshot.data?.scoreStatus ?? 'NA'})'
                                      : null,
                              onTap: () => _navigate(isUnderAge: isUnderAge))),
                    ]));
              }),
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
      required Function() onTap,
      Widget? customDescription,
      BorderRadius? borderRadius}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
              color: AppColors.primaryPink.withOpacity(0.12),
              borderRadius: borderRadius),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            RichText(
                text: TextSpan(
                    style: _textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryBlue),
                    children: [
                  TextSpan(text: '$title - '),
                  TextSpan(
                      text: value,
                      style: TextStyle(fontWeight: FontWeight.w800)),
                ])),
            SizedBox(height: 2),
            if (descriptionText != null)
              Text(descriptionText,
                  style: _textTheme.bodySmall!.copyWith(
                      color: AppColors.primaryBlue.withOpacity(0.65))),
            if (customDescription != null) customDescription
          ])),
    );
  }

  Widget _buildUnderlineText({required String text}) {
    return UnderlineText(
        text: text,
        underlineColor: AppColors.primaryPink,
        style: _textTheme.labelSmall!.copyWith(
            color: AppColors.primaryPink, fontWeight: FontWeight.w400));
  }

  Future<void> _navigate({required bool isUnderAge}) async {
    if (!isUnderAge) {
      await Navigator.of(context).push(
          CupertinoPageRoute(builder: (context) => HealthScoreIntroScreen()));

      _healthScoreFuture = HealthScoreService.getPatientHealthScore(
          patientId: widget.patient!.id!.toString());
      _patient = BlocProvider.of<PatientsCubit>(context)
          .getPatientByPatientId(patientId: _patient?.id);

      setState(() {});
    }
  }
}
