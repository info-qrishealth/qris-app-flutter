// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_score_question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HealthScoreQuestionModelImpl _$$HealthScoreQuestionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HealthScoreQuestionModelImpl(
      option: json['option'] as String,
      marks: (json['marks'] as num).toInt(),
    );

Map<String, dynamic> _$$HealthScoreQuestionModelImplToJson(
        _$HealthScoreQuestionModelImpl instance) =>
    <String, dynamic>{
      'option': instance.option,
      'marks': instance.marks,
    };
