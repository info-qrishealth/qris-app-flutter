// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationTokenImpl _$$NotificationTokenImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationTokenImpl(
      userId: (json['user_id'] as num?)?.toInt(),
      phleboId: (json['phlebo_id'] as num?)?.toInt(),
      token: json['token'] as String,
      platform: (json['platform'] as num).toInt(),
      deviceIdentifier: json['device_identifier'] as String,
    );

Map<String, dynamic> _$$NotificationTokenImplToJson(
        _$NotificationTokenImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'phlebo_id': instance.phleboId,
      'token': instance.token,
      'platform': instance.platform,
      'device_identifier': instance.deviceIdentifier,
    };
