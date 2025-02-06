// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wellness_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WellnessQuestionImpl _$$WellnessQuestionImplFromJson(
        Map<String, dynamic> json) =>
    _$WellnessQuestionImpl(
      id: (json['id'] as num).toInt(),
      prdId: json['prd_id'] as String,
      questionType: QuestionnaireTypeExtension.fromString(
          json['question_type'] as String),
      questionTitle: json['question_title'] as String,
      options: json['options'] as String,
      disOrder: (json['dis_order'] as num).toInt(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$WellnessQuestionImplToJson(
        _$WellnessQuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prd_id': instance.prdId,
      'question_type': _toJson(instance.questionType),
      'question_title': instance.questionTitle,
      'options': instance.options,
      'dis_order': instance.disOrder,
      'status': instance.status,
    };
