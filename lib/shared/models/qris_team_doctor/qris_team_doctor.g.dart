// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qris_team_doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QrisTeamDoctorImpl _$$QrisTeamDoctorImplFromJson(Map<String, dynamic> json) =>
    _$QrisTeamDoctorImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      rating: (json['rating'] as num).toInt(),
      name: json['name'] as String,
      attribute: json['attribute'] as String,
      content: json['content'] as String,
      pic: json['pic'] as String,
      disOrder: (json['dis_order'] as num).toInt(),
      status: json['status'] as String,
      about: json['about'] as String,
      womenWellness: json['women_wellness'] as String,
      speciality: json['speciality'] as String?,
      bio: json['bio'] as String?,
    );

Map<String, dynamic> _$$QrisTeamDoctorImplToJson(
        _$QrisTeamDoctorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'rating': instance.rating,
      'name': instance.name,
      'attribute': instance.attribute,
      'content': instance.content,
      'pic': instance.pic,
      'dis_order': instance.disOrder,
      'status': instance.status,
      'about': instance.about,
      'women_wellness': instance.womenWellness,
      'speciality': instance.speciality,
      'bio': instance.bio,
    };
