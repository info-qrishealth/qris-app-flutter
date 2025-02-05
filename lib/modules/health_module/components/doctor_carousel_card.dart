import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/shared/components/common_network_image.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';
import 'package:qris_health/shared/models/qris_team_doctor/qris_team_doctor.dart';
import 'package:qris_health/styles/app_colors.dart';

class DoctorCarouselCard extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final QrisTeamDoctor doctor;
  const DoctorCarouselCard(
      {super.key,
      required this.index,
      required this.selectedIndex,
      required this.doctor});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: index == selectedIndex
                ? AppColors.primaryBlue
                : AppColors.primaryBlue.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                  child: ClipOval(
                      child: CommonNetworkImage(
                          name: doctor.pic,
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover))),
              SizedBox(height: 8),
              Text(doctor.name,
                  style: textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w700, color: Colors.white),
                  textAlign: TextAlign.center),
              SizedBox(height: 4),
              Text(doctor.speciality ?? 'N/A',
                  style: textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500, color: Color(0xFFF597DF)),
                  textAlign: TextAlign.center),
              SizedBox(height: 8),
              Text(doctor.bio?.clean ?? 'N/A',
                  style: textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      height: 1.3),
                  textAlign: TextAlign.center)
            ]));
  }
}
