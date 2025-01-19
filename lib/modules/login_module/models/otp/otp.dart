import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp.freezed.dart';
part 'otp.g.dart';

@freezed
class Otp with _$Otp {
  const factory Otp(
      {String? otpId,
      int? token,
      String? phoneNumber,
      DateTime? expiryDate}) = _Otp;

  factory Otp.fromJson(Map<String, dynamic> json) => _$OtpFromJson(json);
}
