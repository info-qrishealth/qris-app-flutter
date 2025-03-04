// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_slot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TimeSlot _$TimeSlotFromJson(Map<String, dynamic> json) {
  return _TimeSlot.fromJson(json);
}

/// @nodoc
mixin _$TimeSlot {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'starting_time')
  String get startingTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'ending_time')
  String get endingTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_slot')
  TimeSlotEnum get timeSlot => throw _privateConstructorUsedError;
  @JsonKey(name: 'allowed_booking')
  int? get allowedBooking => throw _privateConstructorUsedError;
  @JsonKey(name: 'dis_order')
  int get disOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;

  /// Serializes this TimeSlot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeSlotCopyWith<TimeSlot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeSlotCopyWith<$Res> {
  factory $TimeSlotCopyWith(TimeSlot value, $Res Function(TimeSlot) then) =
      _$TimeSlotCopyWithImpl<$Res, TimeSlot>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'starting_time') String startingTime,
      @JsonKey(name: 'ending_time') String endingTime,
      @JsonKey(name: 'time_slot') TimeSlotEnum timeSlot,
      @JsonKey(name: 'allowed_booking') int? allowedBooking,
      @JsonKey(name: 'dis_order') int disOrder,
      @JsonKey(name: 'status') String status});
}

/// @nodoc
class _$TimeSlotCopyWithImpl<$Res, $Val extends TimeSlot>
    implements $TimeSlotCopyWith<$Res> {
  _$TimeSlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startingTime = null,
    Object? endingTime = null,
    Object? timeSlot = null,
    Object? allowedBooking = freezed,
    Object? disOrder = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      startingTime: null == startingTime
          ? _value.startingTime
          : startingTime // ignore: cast_nullable_to_non_nullable
              as String,
      endingTime: null == endingTime
          ? _value.endingTime
          : endingTime // ignore: cast_nullable_to_non_nullable
              as String,
      timeSlot: null == timeSlot
          ? _value.timeSlot
          : timeSlot // ignore: cast_nullable_to_non_nullable
              as TimeSlotEnum,
      allowedBooking: freezed == allowedBooking
          ? _value.allowedBooking
          : allowedBooking // ignore: cast_nullable_to_non_nullable
              as int?,
      disOrder: null == disOrder
          ? _value.disOrder
          : disOrder // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeSlotImplCopyWith<$Res>
    implements $TimeSlotCopyWith<$Res> {
  factory _$$TimeSlotImplCopyWith(
          _$TimeSlotImpl value, $Res Function(_$TimeSlotImpl) then) =
      __$$TimeSlotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'starting_time') String startingTime,
      @JsonKey(name: 'ending_time') String endingTime,
      @JsonKey(name: 'time_slot') TimeSlotEnum timeSlot,
      @JsonKey(name: 'allowed_booking') int? allowedBooking,
      @JsonKey(name: 'dis_order') int disOrder,
      @JsonKey(name: 'status') String status});
}

/// @nodoc
class __$$TimeSlotImplCopyWithImpl<$Res>
    extends _$TimeSlotCopyWithImpl<$Res, _$TimeSlotImpl>
    implements _$$TimeSlotImplCopyWith<$Res> {
  __$$TimeSlotImplCopyWithImpl(
      _$TimeSlotImpl _value, $Res Function(_$TimeSlotImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startingTime = null,
    Object? endingTime = null,
    Object? timeSlot = null,
    Object? allowedBooking = freezed,
    Object? disOrder = null,
    Object? status = null,
  }) {
    return _then(_$TimeSlotImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      startingTime: null == startingTime
          ? _value.startingTime
          : startingTime // ignore: cast_nullable_to_non_nullable
              as String,
      endingTime: null == endingTime
          ? _value.endingTime
          : endingTime // ignore: cast_nullable_to_non_nullable
              as String,
      timeSlot: null == timeSlot
          ? _value.timeSlot
          : timeSlot // ignore: cast_nullable_to_non_nullable
              as TimeSlotEnum,
      allowedBooking: freezed == allowedBooking
          ? _value.allowedBooking
          : allowedBooking // ignore: cast_nullable_to_non_nullable
              as int?,
      disOrder: null == disOrder
          ? _value.disOrder
          : disOrder // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeSlotImpl implements _TimeSlot {
  _$TimeSlotImpl(
      {required this.id,
      @JsonKey(name: 'starting_time') required this.startingTime,
      @JsonKey(name: 'ending_time') required this.endingTime,
      @JsonKey(name: 'time_slot') required this.timeSlot,
      @JsonKey(name: 'allowed_booking') this.allowedBooking,
      @JsonKey(name: 'dis_order') required this.disOrder,
      @JsonKey(name: 'status') required this.status});

  factory _$TimeSlotImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeSlotImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'starting_time')
  final String startingTime;
  @override
  @JsonKey(name: 'ending_time')
  final String endingTime;
  @override
  @JsonKey(name: 'time_slot')
  final TimeSlotEnum timeSlot;
  @override
  @JsonKey(name: 'allowed_booking')
  final int? allowedBooking;
  @override
  @JsonKey(name: 'dis_order')
  final int disOrder;
  @override
  @JsonKey(name: 'status')
  final String status;

  @override
  String toString() {
    return 'TimeSlot(id: $id, startingTime: $startingTime, endingTime: $endingTime, timeSlot: $timeSlot, allowedBooking: $allowedBooking, disOrder: $disOrder, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeSlotImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startingTime, startingTime) ||
                other.startingTime == startingTime) &&
            (identical(other.endingTime, endingTime) ||
                other.endingTime == endingTime) &&
            (identical(other.timeSlot, timeSlot) ||
                other.timeSlot == timeSlot) &&
            (identical(other.allowedBooking, allowedBooking) ||
                other.allowedBooking == allowedBooking) &&
            (identical(other.disOrder, disOrder) ||
                other.disOrder == disOrder) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, startingTime, endingTime,
      timeSlot, allowedBooking, disOrder, status);

  /// Create a copy of TimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeSlotImplCopyWith<_$TimeSlotImpl> get copyWith =>
      __$$TimeSlotImplCopyWithImpl<_$TimeSlotImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeSlotImplToJson(
      this,
    );
  }
}

abstract class _TimeSlot implements TimeSlot {
  factory _TimeSlot(
      {required final int id,
      @JsonKey(name: 'starting_time') required final String startingTime,
      @JsonKey(name: 'ending_time') required final String endingTime,
      @JsonKey(name: 'time_slot') required final TimeSlotEnum timeSlot,
      @JsonKey(name: 'allowed_booking') final int? allowedBooking,
      @JsonKey(name: 'dis_order') required final int disOrder,
      @JsonKey(name: 'status') required final String status}) = _$TimeSlotImpl;

  factory _TimeSlot.fromJson(Map<String, dynamic> json) =
      _$TimeSlotImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'starting_time')
  String get startingTime;
  @override
  @JsonKey(name: 'ending_time')
  String get endingTime;
  @override
  @JsonKey(name: 'time_slot')
  TimeSlotEnum get timeSlot;
  @override
  @JsonKey(name: 'allowed_booking')
  int? get allowedBooking;
  @override
  @JsonKey(name: 'dis_order')
  int get disOrder;
  @override
  @JsonKey(name: 'status')
  String get status;

  /// Create a copy of TimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeSlotImplCopyWith<_$TimeSlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
