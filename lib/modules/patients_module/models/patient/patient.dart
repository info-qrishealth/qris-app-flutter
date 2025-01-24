import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient.freezed.dart';
part 'patient.g.dart';

@freezed
class Patient with _$Patient {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Patient({
    int? id,
    int? title,
    String? name,
    String? email,
    String? mobile,
    String? gender,
    String? dob,
    String? time,
    String? userId,
    String? doctorId,
    String? self,
    String? regOn,
    String? state,
    String? address,
    String? zip,
    String? timeSlot,
    String? date,
    String? status,
    String? disOrder,
    String? paymentStatus,
    String? orderId,
    String? txnId,
    String? paymentMode,
    String? totalAmount,
    String? discount,
    int? orderTime,
    String? oVStatus,
    int? height,
    int? weight,
  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);
}
