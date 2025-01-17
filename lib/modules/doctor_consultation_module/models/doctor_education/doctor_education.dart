import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_education.freezed.dart';
part 'doctor_education.g.dart';

@freezed
class DoctorEducation with _$DoctorEducation {
  const factory DoctorEducation(
      {@JsonKey(name: 'id') required int id,
      @JsonKey(name: 'doc_id') int? docId,
      String? education,
      String? college}) = _DoctorEducation;

  factory DoctorEducation.fromJson(Map<String, dynamic> json) =>
      _$DoctorEducationFromJson(json);
}
