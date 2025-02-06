import 'package:freezed_annotation/freezed_annotation.dart';

part 'wellness_answer.freezed.dart';
part 'wellness_answer.g.dart';

@freezed
class WellnessAnswer with _$WellnessAnswer {
  factory WellnessAnswer(
      {int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'order_id') int? orderId,
      @JsonKey(name: 'ptnt_id') String? ptntId,
      @JsonKey(name: 'prd_id') String? prdId,
      @JsonKey(name: 'question_id') required int questionId,
      @JsonKey(name: 'question') required String question,
      @JsonKey(name: 'answer') required String answer}) = _WellnessAnswer;

  factory WellnessAnswer.fromJson(Map<String, dynamic> json) =>
      _$WellnessAnswerFromJson(json);
}
