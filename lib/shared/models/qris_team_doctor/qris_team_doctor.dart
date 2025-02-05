import 'package:freezed_annotation/freezed_annotation.dart';

part 'qris_team_doctor.freezed.dart';
part 'qris_team_doctor.g.dart';

@freezed
class QrisTeamDoctor with _$QrisTeamDoctor {
  const factory QrisTeamDoctor(
      {@JsonKey(name: 'id') required int id,
      @JsonKey(name: 'title') required String title,
      @JsonKey(name: 'rating') required int rating,
      @JsonKey(name: 'name') required String name,
      @JsonKey(name: 'attribute') required String attribute,
      @JsonKey(name: 'content') required String content,
      @JsonKey(name: 'pic') required String pic,
      @JsonKey(name: 'dis_order') required int disOrder,
      @JsonKey(name: 'status') required String status,
      @JsonKey(name: 'about') required String about,
      @JsonKey(name: 'women_wellness') required String womenWellness,
      String? speciality,
      String? bio}) = _QrisTeamDoctor;

  factory QrisTeamDoctor.fromJson(Map<String, dynamic> json) =>
      _$QrisTeamDoctorFromJson(json);
}
