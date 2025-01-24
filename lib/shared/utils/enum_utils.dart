import 'package:qris_health/constants/enums/gender.dart';

class EnumUtils {
  static Gender? getGenderFromNumberString({required String? number}) {
    final num = int.tryParse('$number');

    switch (num) {
      case 1:
        return Gender.MALE;

      case 2:
        return Gender.FEMALE;

      case 3:
        return Gender.OTHERS;

      default:
        return null;
    }
  }
}
