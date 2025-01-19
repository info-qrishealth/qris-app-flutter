import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User(
      {int? id,
      @JsonKey(name: 'title') int? title,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'user_id') required String userId,
      @JsonKey(name: 'password') String? password,
      @JsonKey(name: 'dob') required String dob,
      @JsonKey(name: 'gender') required String gender,
      @JsonKey(name: 'referral_code') String? referralCode,
      @JsonKey(name: 'refer_code') String? referCode}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
