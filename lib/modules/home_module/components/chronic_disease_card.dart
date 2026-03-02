import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/modules/home_module/screens/chronic_disease_screen.dart';

import '../../../generated/assets.dart';
import '../../../styles/app_colors.dart';

class ChronicDiseaseCard extends StatelessWidget {
  const ChronicDiseaseCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue.withOpacity(0.03),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chronic disease wellness',
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryPink,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Comprehensive test packages designed for regular monitoring and health management.',
                      style: textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 4),
              Image.asset(
                Assets.illustrationsChronicDiseaseImage,
                width: 120,
                fit: BoxFit.contain,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              SizedBox(
                height: 28,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => ChronicDiseaseScreen()));
                  },
                  child: Text(
                    'Explore Chronic Care Packages',
                    style: textTheme.bodySmall!.copyWith(
                        fontSize: Platform.isAndroid
                            ? (textTheme.bodySmall!.fontSize ?? 12) - 2
                            : null,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
