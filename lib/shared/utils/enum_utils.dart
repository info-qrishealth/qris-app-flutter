import 'package:qris_health/constants/enums/gender.dart';
import 'package:qris_health/constants/enums/married_title.dart';

class EnumUtils {
  static Gender? getGenderFromNumberString({required String? number}) {
    final num = int.tryParse('$number');

    switch (num) {
      case 1:
        return Gender.FEMALE;
      case 2:
        return Gender.MALE;
      case 3:
        return Gender.OTHERS;
      default:
        return null;
    }
  }

  static MarriedTitle? getMarriedStatusNumberFromString(
      {required String? number}) {
    final num = int.tryParse('$number');

    switch (num) {
      case 0:
        return MarriedTitle.MR;

      case 1:
        return MarriedTitle.MRS;

      case 2:
        return MarriedTitle.MS;

      case 3:
        return MarriedTitle.MST;

      case 4:
        return MarriedTitle.Baby;

      default:
        return null;
    }
  }
}
