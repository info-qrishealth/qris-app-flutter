// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OtpImpl _$$OtpImplFromJson(Map<String, dynamic> json) => _$OtpImpl(
      otpId: json['otpId'] as String?,
      token: (json['token'] as num?)?.toInt(),
      phoneNumber: json['phoneNumber'] as String?,
      expiryDate: json['expiryDate'] == null
          ? null
          : DateTime.parse(json['expiryDate'] as String),
    );

Map<String, dynamic> _$$OtpImplToJson(_$OtpImpl instance) => <String, dynamic>{
      'otpId': instance.otpId,
      'token': instance.token,
      'phoneNumber': instance.phoneNumber,
      'expiryDate': instance.expiryDate?.toIso8601String(),
    };
