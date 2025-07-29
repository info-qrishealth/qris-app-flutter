import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/generated/assets.dart';
import 'package:qris_health/modules/health_score_module/screens/health_score_intro_screen.dart';
import 'package:qris_health/styles/app_colors.dart';

class HealthScoreCard extends StatelessWidget {
  const HealthScoreCard({super.key});

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
                  'Understand Your Health Score!',
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryBlue,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Your health score provides a quick overview of your well-being and make healthcare decisions.',
                  style: textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryBlue,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 28,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => HealthScoreIntroScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                    ),
                    child: Text(
                      'Explore Your Health Report',
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
            Assets.illustrationsBmiImage,
            width: 120,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
