import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qris_health/modules/doctor_consultation_module/models/doctor_education/doctor_education.dart';

part 'doctor.freezed.dart';
part 'doctor.g.dart';

@freezed
class Doctor with _$Doctor {
  const factory Doctor({
    required int id,
    @JsonKey(name: 'doc_name') String? docName,
    @JsonKey(name: 'short_bio') String? shortBio,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'doc_speciality') String? docSpeciality,
    @JsonKey(name: 'pic') String? pic,
    @JsonKey(name: 'category') String? category,
    @JsonKey(name: 'doc_email') String? docEmail,
    @JsonKey(name: 'doc_experience') String? docExperience,
    @JsonKey(name: 'doc_phone') String? docPhone,
    @JsonKey(name: 'doctor_dob') String? doctorDob,
    @JsonKey(name: 'doc_address') String? docAddress,
    @JsonKey(name: 'doc_states') int? docStates,
    @JsonKey(name: 'doc_areas') int? docAreas,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'rating') String? rating,
    @JsonKey(name: 'review') String? review,
    @JsonKey(name: 'fees') String? fees,
    @JsonKey(name: 'education') String? education,
    @JsonKey(name: 'passing_year') String? passingYear,
    @JsonKey(name: 'trusted') String? trusted,
    @JsonKey(name: 'verified') String? verified,
    @JsonKey(name: 'slug') String? slug,
    @JsonKey(name: 'meta_title') String? metaTitle,
    @JsonKey(name: 'meta_key') String? metaKey,
    @JsonKey(name: 'meta_desc') String? metaDesc,
    @JsonKey(name: 'dis_order') int? disOrder,
    @JsonKey(name: 'uploaded_on') String? uploadedOn,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'mob_verified') String? mobVerified,
    @JsonKey(name: 'email_verified') String? emailVerified,
    @JsonKey(name: 'otp') String? otp,
    @Default([]) @JsonKey(name: 'educations') List<DoctorEducation> educations,
  }) = _Doctor;

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
}
