// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wellness_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WellnessAnswerImpl _$$WellnessAnswerImplFromJson(Map<String, dynamic> json) =>
    _$WellnessAnswerImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      orderId: (json['order_id'] as num?)?.toInt(),
      ptntId: json['ptnt_id'] as String?,
      prdId: json['prd_id'] as String?,
      questionId: (json['question_id'] as num).toInt(),
      question: json['question'] as String,
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$$WellnessAnswerImplToJson(
        _$WellnessAnswerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'order_id': instance.orderId,
      'ptnt_id': instance.ptntId,
      'prd_id': instance.prdId,
      'question_id': instance.questionId,
      'question': instance.question,
      'answer': instance.answer,
    };
