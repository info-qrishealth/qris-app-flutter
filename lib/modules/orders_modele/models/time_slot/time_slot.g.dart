// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimeSlotImpl _$$TimeSlotImplFromJson(Map<String, dynamic> json) =>
    _$TimeSlotImpl(
      id: (json['id'] as num).toInt(),
      startingTime: json['starting_time'] as String,
      endingTime: json['ending_time'] as String,
      timeSlot: $enumDecode(_$TimeSlotEnumEnumMap, json['time_slot']),
      allowedBooking: (json['allowed_booking'] as num?)?.toInt(),
      disOrder: (json['dis_order'] as num).toInt(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$TimeSlotImplToJson(_$TimeSlotImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'starting_time': instance.startingTime,
      'ending_time': instance.endingTime,
      'time_slot': _$TimeSlotEnumEnumMap[instance.timeSlot]!,
      'allowed_booking': instance.allowedBooking,
      'dis_order': instance.disOrder,
      'status': instance.status,
    };

const _$TimeSlotEnumEnumMap = {
  TimeSlotEnum.morning: 'morning',
  TimeSlotEnum.noon: 'noon',
  TimeSlotEnum.evening: 'evening',
};
