import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/styles/app_colors.dart';

class DoctorCarouselCard extends StatelessWidget {
  final int index;
  final int selectedIndex;
  const DoctorCarouselCard(
      {super.key, required this.index, required this.selectedIndex});

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
              Image.asset('assets/images/placeholders/doctor_placeholder.png',
                  height: 80, width: 80),
              SizedBox(height: 8),
              Text('Dr. Vikas Khanna',
                  style: textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w700, color: Colors.white),
                  textAlign: TextAlign.center),
              SizedBox(height: 4),
              Text('MD (Critical care & Medicine)',
                  style: textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500, color: Color(0xFFF597DF)),
                  textAlign: TextAlign.center),
              SizedBox(height: 8),
              Text(
                  'Pioneer in introducing low cost yet best critical care in India, Dr. Abhimanyu is the co-founder of Qris Health. He is proficient in Intensive Care, Infectious disease management & lifestyle disorder management',
                  style: textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      height: 1.3),
                  textAlign: TextAlign.center)
            ]));
  }
}
