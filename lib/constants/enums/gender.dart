enum Gender { MALE, FEMALE, OTHERS }

extension GenderExtension on Gender {
  String get imagePath {
    switch (this) {
      case Gender.MALE:
        return 'assets/images/icons/gender/male_icon.svg';

      case Gender.FEMALE:
        return 'assets/images/icons/gender/female_icon.svg';

      case Gender.OTHERS:
        return 'assets/images/icons/gender/others_icon.svg';
    }
  }
}
