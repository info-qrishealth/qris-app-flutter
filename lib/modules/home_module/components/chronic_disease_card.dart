import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      child: Row(
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
                const SizedBox(height: 12),
                SizedBox(
                  height: 28,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Explore Chronic Care Packages',
                      style: textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w700, color: Colors.white),
                    ),
                  ),
                )
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
    );
  }
}
