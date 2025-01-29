// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_score_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HealthScoreResModelImpl _$$HealthScoreResModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HealthScoreResModelImpl(
      id: (json['id'] as num?)?.toInt(),
      userName: json['user_name'] as String?,
      userId: json['user_id'] as String?,
      userData: json['user_data'] as String?,
      bmi: json['bmi'] as String?,
      height: json['height'] as String?,
      weight: json['weight'] as String?,
      healthScore: json['health_score'] as String?,
      scoreStatus: json['score_status'] as String?,
      scoreColor: json['score_color'] as String?,
      patientId: json['patient_id'] as String?,
      status: json['status'] as String? ?? '1',
    );

Map<String, dynamic> _$$HealthScoreResModelImplToJson(
        _$HealthScoreResModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_name': instance.userName,
      'user_id': instance.userId,
      'user_data': instance.userData,
      'bmi': instance.bmi,
      'height': instance.height,
      'weight': instance.weight,
      'health_score': instance.healthScore,
      'score_status': instance.scoreStatus,
      'score_color': instance.scoreColor,
      'patient_id': instance.patientId,
      'status': instance.status,
    };
