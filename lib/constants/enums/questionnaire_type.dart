enum QuestionnaireType { SINGLE, MULTI, TEXTAREA, DATE }

extension QuestionnaireTypeExtension on QuestionnaireType {
  static QuestionnaireType fromString(String value) {
    switch (value) {
      case '1':
        return QuestionnaireType.SINGLE;
      case '2':
        return QuestionnaireType.MULTI;
      case '5':
        return QuestionnaireType.TEXTAREA;
      case '6':
        return QuestionnaireType.DATE;
      default:
        throw ArgumentError('Invalid question type value: $value');
    }
  }

  int toInt() {
    switch (this) {
      case QuestionnaireType.SINGLE:
        return 1;
      case QuestionnaireType.MULTI:
        return 2;
      case QuestionnaireType.TEXTAREA:
        return 5;
      case QuestionnaireType.DATE:
        return 6;
    }
  }
}
