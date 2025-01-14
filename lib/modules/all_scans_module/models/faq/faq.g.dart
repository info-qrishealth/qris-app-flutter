// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FaqImpl _$$FaqImplFromJson(Map<String, dynamic> json) => _$FaqImpl(
      id: (json['id'] as num).toInt(),
      testId: (json['test_id'] as num).toInt(),
      question: json['question'] as String,
      answer: json['answer'] as String,
      disOrder: (json['dis_order'] as num).toInt(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$FaqImplToJson(_$FaqImpl instance) => <String, dynamic>{
      'id': instance.id,
      'test_id': instance.testId,
      'question': instance.question,
      'answer': instance.answer,
      'dis_order': instance.disOrder,
      'status': instance.status,
    };
