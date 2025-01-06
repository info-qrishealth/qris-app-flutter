import 'package:flutter/material.dart';

enum SpecialistType {
  psychologist,
  opthalmologist,
  dentists,
  cardiologist,
  heartSpecialist,
  noseSpecialist,
  pulmonologist,
  nephrology
}

extension SpecialistTypeExtension on SpecialistType {
  Color get backgroundColor {
    switch (this) {
      case SpecialistType.psychologist:
        return Color(0x72FE9B97);
      case SpecialistType.opthalmologist:
        return Color(0x7281C7CC);
      case SpecialistType.dentists:
        return Color(0x72DFFF30);
      case SpecialistType.cardiologist:
        return Color(0x72FFBF7B);
      case SpecialistType.heartSpecialist:
        return Color(0x72D389FF);
      case SpecialistType.noseSpecialist:
        return Color(0x7297FE97);
      case SpecialistType.pulmonologist:
        return Color(0x72F38EE3);
      case SpecialistType.nephrology:
        return Color(0x72B67BFF);
    }
  }

  String get imagePath {
    switch (this) {
      case SpecialistType.psychologist:
        return 'assets/images/icons/doctor_specialist_type_icons/psychologist.png';
      case SpecialistType.opthalmologist:
        return 'assets/images/icons/doctor_specialist_type_icons/opthalmologist.png';
      case SpecialistType.dentists:
        return 'assets/images/icons/doctor_specialist_type_icons/dentist.png';
      case SpecialistType.cardiologist:
        return 'assets/images/icons/doctor_specialist_type_icons/cardiologist.png';
      case SpecialistType.heartSpecialist:
        return 'assets/images/icons/doctor_specialist_type_icons/heart_specialist.png';
      case SpecialistType.noseSpecialist:
        return 'assets/images/icons/doctor_specialist_type_icons/nose_specialist.png';
      case SpecialistType.pulmonologist:
        return 'assets/images/icons/doctor_specialist_type_icons/pulmonologist_specialist.png';
      case SpecialistType.nephrology:
        return 'assets/images/icons/doctor_specialist_type_icons/kidney_specialist.png';
    }
  }
}
