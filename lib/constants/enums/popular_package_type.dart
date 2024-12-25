import 'package:qris_health/shared/extensions/string_extension.dart';

enum PopularPackageType {
  ALCOHOLISM,
  SLEEPLESSNESS,
  JUNK_FOOD,
  MEDICINE_OVERUSE,
  STRESS,
  ANGER,
  SMOKING,
  ZERO_EXERCISE,
  HEART,
  HYPERTENSION,
  INFECTIONS,
  JOINTS,
  LIVER,
  PREGNANCY,
  THYROID,
  DIABETES,
  FULL_BODY_CHECKUP,
  HORMONES,
  IMMUNITY,
  KIDNEY,
  VITAMINS,
  ALLERGY,
  CANCER,
  ACIDITY,
  FEVER
}

extension PopularPackageTypeExtension on PopularPackageType {
  String get formattedName {
    if (this == PopularPackageType.JOINTS) {
      return 'Joints/Arthritis';
    } else if (this == PopularPackageType.ACIDITY) {
      return "Acidity/Digestion";
    }

    return name.formattedEnumName!;
  }

  String get assetPath {
    switch (this) {
      case PopularPackageType.ALCOHOLISM:
        return 'assets/images/icons/popular_packages_type/alcholism.png';

      case PopularPackageType.SLEEPLESSNESS:
        return 'assets/images/icons/popular_packages_type/sleepiness.png';

      case PopularPackageType.JUNK_FOOD:
        return 'assets/images/icons/popular_packages_type/junk_food_icon.png';

      case PopularPackageType.MEDICINE_OVERUSE:
        return 'assets/images/icons/popular_packages_type/medicine_overdue_icon.png';

      case PopularPackageType.STRESS:
        return 'assets/images/icons/popular_packages_type/stress_icon.png';

      case PopularPackageType.ANGER:
        return 'assets/images/icons/popular_packages_type/anger_icon.png';

      case PopularPackageType.SMOKING:
        return 'assets/images/icons/popular_packages_type/smoking_icon.png';

      case PopularPackageType.ZERO_EXERCISE:
        return 'assets/images/icons/popular_packages_type/zero_icon.png';

      case PopularPackageType.HEART:
        return 'assets/images/icons/popular_packages_type/heart_icon.png';

      case PopularPackageType.HYPERTENSION:
        return 'assets/images/icons/popular_packages_type/hyper_tension_icon.png';

      case PopularPackageType.INFECTIONS:
        return 'assets/images/icons/popular_packages_type/infection_icon.png';

      case PopularPackageType.JOINTS:
        return 'assets/images/icons/popular_packages_type/joints_icon.png';

      case PopularPackageType.LIVER:
        return 'assets/images/icons/popular_packages_type/liver_icon.png';

      case PopularPackageType.PREGNANCY:
        return 'assets/images/icons/popular_packages_type/pregnancy_icon.png';

      case PopularPackageType.THYROID:
        return 'assets/images/icons/popular_packages_type/thyroid_icon.png';

      case PopularPackageType.DIABETES:
        return 'assets/images/icons/popular_packages_type/diabetis_icon.png';

      case PopularPackageType.FULL_BODY_CHECKUP:
        return 'assets/images/icons/popular_packages_type/full_body_checkup_icon.png';

      case PopularPackageType.HORMONES:
        return 'assets/images/icons/popular_packages_type/hormones_icon.png';

      case PopularPackageType.IMMUNITY:
        return 'assets/images/icons/popular_packages_type/immunity_icon.png';

      case PopularPackageType.KIDNEY:
        return 'assets/images/icons/popular_packages_type/kidney_icon.png';

      case PopularPackageType.VITAMINS:
        return 'assets/images/icons/popular_packages_type/vitamin_icon.png';

      case PopularPackageType.ALLERGY:
        return 'assets/images/icons/popular_packages_type/allergy_icon.png';

      case PopularPackageType.CANCER:
        return 'assets/images/icons/popular_packages_type/cancer_icon.png';

      case PopularPackageType.ACIDITY:
        return 'assets/images/icons/popular_packages_type/acidity_icon.png';

      case PopularPackageType.FEVER:
        return 'assets/images/icons/popular_packages_type/fever_icon.png';
    }
  }
}
