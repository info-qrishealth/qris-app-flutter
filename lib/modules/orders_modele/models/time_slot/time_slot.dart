import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qris_health/constants/enums/time_slot_enum.dart';

part 'time_slot.freezed.dart';
part 'time_slot.g.dart';

@freezed
class TimeSlot with _$TimeSlot {
  factory TimeSlot(
      {required int id,
      @JsonKey(name: 'starting_time') required String startingTime,
      @JsonKey(name: 'ending_time') required String endingTime,
      @JsonKey(name: 'time_slot') required TimeSlotEnum timeSlot,
      @JsonKey(name: 'allowed_booking') int? allowedBooking,
      @JsonKey(name: 'dis_order') required int disOrder,
      @JsonKey(name: 'status') required String status}) = _TimeSlot;

  factory TimeSlot.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotFromJson(json);
}
