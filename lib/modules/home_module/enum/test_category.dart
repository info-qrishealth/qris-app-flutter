import 'package:flutter/material.dart';
import 'package:qris_health/generated/assets.dart';

enum TestCategory {
  bloodTest,
  mri,
  pharmacy,
  icuCare,
  mentalWellness,
  doctorConsultation
}

extension TestCategoryExtension on TestCategory {
  String get svgPath {
    switch (this) {
      case TestCategory.bloodTest:
        return 'assets/images/icons/test_categories_icon/blood_test.png';

      case TestCategory.mri:
        return 'assets/images/icons/test_categories_icon/mri.png';

      case TestCategory.doctorConsultation:
        return 'assets/images/icons/test_categories_icon/doctor.png';

      case TestCategory.mentalWellness:
        return 'assets/images/icons/test_categories_icon/mental_wellness.png';

      case TestCategory.pharmacy:
        return Assets.testCategoriesIconPharmacy;

      case TestCategory.icuCare:
        return Assets.testCategoriesIconIcuCare;
    }
  }

  String get formattedName {
    switch (this) {
      case TestCategory.bloodTest:
        return 'Blood Tests';

      case TestCategory.mri:
        return 'Scans (MRI, CT,Ultrasound)';

      case TestCategory.doctorConsultation:
        return 'Doctor Consultation';

      case TestCategory.mentalWellness:
        return 'Mental Wellness';

      case TestCategory.pharmacy:
        return 'Pharmacy';

      case TestCategory.icuCare:
        return 'ICU Care';
    }
  }

  Color get backgroundColor {
    switch (this) {
      case TestCategory.bloodTest:
        return Color(0x72FE9B97);
      case TestCategory.mri:
        return Color(0x7281C7CC);
      case TestCategory.doctorConsultation:
        return Color(0x7297FEE3);
      case TestCategory.mentalWellness:
        return Color(0x72F38EE3);
      case TestCategory.pharmacy:
        return Color(0x72C0CC81);
      case TestCategory.icuCare:
        return Color(0x72D389FF);
    }
  }
}
