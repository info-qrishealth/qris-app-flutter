import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_score_res_model.freezed.dart';
part 'health_score_res_model.g.dart';

@freezed
class HealthScoreResModel with _$HealthScoreResModel {
  factory HealthScoreResModel(
          {int? id,
          @JsonKey(name: 'user_name') String? userName,
          @JsonKey(name: 'user_id') String? userId,
          @JsonKey(name: 'user_data') String? userData,
          @JsonKey(name: 'bmi') String? bmi,
          @JsonKey(name: 'height') String? height,
          @JsonKey(name: 'weight') String? weight,
          @JsonKey(name: 'health_score') String? healthScore,
          @JsonKey(name: 'score_status') String? scoreStatus,
          @JsonKey(name: 'score_color') String? scoreColor,
          @JsonKey(name: 'patient_id') String? patientId,
          @JsonKey(name: 'status') @Default('1') String status}) =
      _HealthScoreResModel;

  factory HealthScoreResModel.fromJson(Map<String, dynamic> json) =>
      _$HealthScoreResModelFromJson(json);
}
