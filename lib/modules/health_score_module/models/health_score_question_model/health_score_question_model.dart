import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_score_question_model.freezed.dart';
part 'health_score_question_model.g.dart';

@freezed
class HealthScoreQuestionModel with _$HealthScoreQuestionModel {
  const factory HealthScoreQuestionModel(
      {required String option, required int marks}) = _HealthScoreQuestionModel;

  factory HealthScoreQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$HealthScoreQuestionModelFromJson(json);
}
