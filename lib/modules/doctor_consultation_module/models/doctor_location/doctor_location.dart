import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_location.freezed.dart';
part 'doctor_location.g.dart';

@freezed
class DoctorLocation with _$DoctorLocation {
  const factory DoctorLocation({
    required int id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'city_id') int? cityId,
    @JsonKey(name: 'slug') String? slug,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    @JsonKey(name: 'status') required String status,
  }) = _DoctorLocation;

  factory DoctorLocation.fromJson(Map<String, dynamic> json) =>
      _$DoctorLocationFromJson(json);
}
