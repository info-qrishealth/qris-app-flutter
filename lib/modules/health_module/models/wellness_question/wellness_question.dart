import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../constants/enums/questionnaire_type.dart';

part 'wellness_question.freezed.dart';
part 'wellness_question.g.dart';

@freezed
class WellnessQuestion with _$WellnessQuestion {
  const factory WellnessQuestion(
      {@JsonKey(name: 'id') required int id,
      @JsonKey(name: 'prd_id') required String prdId,
      @JsonKey(
          fromJson: QuestionnaireTypeExtension.fromString,
          toJson: _toJson,
          name: 'question_type')
      required QuestionnaireType questionType,
      @JsonKey(name: 'question_title') required String questionTitle,
      @JsonKey(name: 'options') required String options,
      @JsonKey(name: 'dis_order') required int disOrder,
      @JsonKey(name: 'status') required String status}) = _WellnessQuestion;

  factory WellnessQuestion.fromJson(Map<String, dynamic> json) =>
      _$WellnessQuestionFromJson(json);
}

String _toJson(QuestionnaireType type) => type.toString();
