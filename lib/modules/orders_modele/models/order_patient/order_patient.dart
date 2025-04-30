import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_patient.freezed.dart';
part 'order_patient.g.dart';

@freezed
class OrderPatient with _$OrderPatient {
  const factory OrderPatient({
    required String name,
    required String id,
    required String gender,
    required String dob,
    @Default('') String mobile,
  }) = _OrderPatient;

  factory OrderPatient.fromJson(Map<String, dynamic> json) =>
      _$OrderPatientFromJson(json);
}
