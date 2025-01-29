import 'package:qris_health/constants/enums/gender.dart';
import 'package:qris_health/modules/patients_module/models/patient/patient.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';

extension PatientExtension on Patient? {
  Gender? get genderEnum {
    return this?.gender == '0'
        ? Gender.OTHERS
        : this?.gender == '1'
            ? Gender.FEMALE
            : Gender.MALE;
  }

  bool get isUnderAge {
    final dob = this?.dob?.toDateTime;
    bool isUnderAge = false;

    if (dob != null) {
      final ageInYears = DateTime.now().difference(dob).inDays / 365.25;
      isUnderAge = ageInYears < 16;
    }

    return isUnderAge;
  }

  double? get bmi {
    if (this?.height == null || this?.weight == null) {
      return null;
    }

    double heightInMeters = this!.height! / 100;
    return this!.weight! / (heightInMeters * heightInMeters);
  }
}
