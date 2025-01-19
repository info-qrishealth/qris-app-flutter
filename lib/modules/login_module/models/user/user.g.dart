// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num?)?.toInt(),
      title: (json['title'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      userId: json['user_id'] as String,
      password: json['password'] as String?,
      dob: json['dob'] as String,
      gender: json['gender'] as String,
      regOn: json['reg_on'] as String?,
      referralCode: json['referral_code'] as String?,
      referCode: json['refer_code'] as String?,
      firstTxn: json['first_txn'] as String?,
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'user_id': instance.userId,
      'password': instance.password,
      'dob': instance.dob,
      'gender': instance.gender,
      'reg_on': instance.regOn,
      'referral_code': instance.referralCode,
      'refer_code': instance.referCode,
      'first_txn': instance.firstTxn,
      'status': instance.status,
    };
