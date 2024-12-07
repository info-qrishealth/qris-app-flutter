import 'package:flutter/material.dart';

enum TestCategory {
  bloodTest,
  mri,
  healthScore,
  doctorConsultation,
  mentalWellness,
  menHealth,
  womenHealth,
  viewReports
}

extension TestCategoryExtension on TestCategory {
  String get svgPath {
    switch (this) {
      case TestCategory.bloodTest:
        return 'assets/images/icons/test_categories_icon/blood_test.png';

      case TestCategory.mri:
        return 'assets/images/icons/test_categories_icon/mri.png';

      case TestCategory.healthScore:
        return 'assets/images/icons/test_categories_icon/health_score.png';

      case TestCategory.doctorConsultation:
        return 'assets/images/icons/test_categories_icon/doctor.png';

      case TestCategory.mentalWellness:
        return 'assets/images/icons/test_categories_icon/mental_wellness.png';

      case TestCategory.menHealth:
        return 'assets/images/icons/test_categories_icon/men_health.png';

      case TestCategory.womenHealth:
        return 'assets/images/icons/test_categories_icon/women_health.png';

      case TestCategory.viewReports:
        return 'assets/images/icons/test_categories_icon/reports.png';
    }
  }

  String get formattedName {
    switch (this) {
      case TestCategory.bloodTest:
        return 'Blood Tests';

      case TestCategory.mri:
        return 'Scans (MRI, CT,Ultrasound)';

      case TestCategory.healthScore:
        return 'Health Score';

      case TestCategory.doctorConsultation:
        return 'Doctor Consultation';

      case TestCategory.mentalWellness:
        return 'Mental Wellness';

      case TestCategory.menHealth:
        return 'Men Health';

      case TestCategory.womenHealth:
        return 'Women Health';

      case TestCategory.viewReports:
        return 'View reports';
    }
  }

  Color get backgroundColor {
    switch (this) {
      case TestCategory.bloodTest:
        return Color(0x72FE9B97);
      case TestCategory.mri:
        return Color(0x7281C7CC);
      case TestCategory.healthScore:
        return Color(0x72C0CC81);
      case TestCategory.doctorConsultation:
        return Color(0x72FFBF7B);
      case TestCategory.mentalWellness:
        return Color(0x72D389FF);
      case TestCategory.menHealth:
        return Color(0x7297FE97);
      case TestCategory.womenHealth:
        return Color(0x72F38EE3);
      case TestCategory.viewReports:
        return Color(0x72B67BFF);
    }
  }
}
