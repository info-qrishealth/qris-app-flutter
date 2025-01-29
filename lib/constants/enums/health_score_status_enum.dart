import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qris_health/styles/app_colors.dart';

enum HealthScoreStatusEnum { Poor, Average, Good, Excellent }

extension HealthScoreStatusExtension on HealthScoreStatusEnum {
  Color? get color {
    switch (this) {
      case HealthScoreStatusEnum.Poor:
        return AppColors.red;
      case HealthScoreStatusEnum.Average:
        return Colors.amber;
      case HealthScoreStatusEnum.Good:
        return Colors.orange;
      case HealthScoreStatusEnum.Excellent:
        return AppColors.green;
    }
  }
}
