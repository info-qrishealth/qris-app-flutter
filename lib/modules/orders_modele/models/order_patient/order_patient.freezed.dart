// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_patient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderPatient _$OrderPatientFromJson(Map<String, dynamic> json) {
  return _OrderPatient.fromJson(json);
}

/// @nodoc
mixin _$OrderPatient {
  String get name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get dob => throw _privateConstructorUsedError;
  String get mobile => throw _privateConstructorUsedError;

  /// Serializes this OrderPatient to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderPatient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderPatientCopyWith<OrderPatient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderPatientCopyWith<$Res> {
  factory $OrderPatientCopyWith(
          OrderPatient value, $Res Function(OrderPatient) then) =
      _$OrderPatientCopyWithImpl<$Res, OrderPatient>;
  @useResult
  $Res call({String name, String id, String gender, String dob, String mobile});
}

/// @nodoc
class _$OrderPatientCopyWithImpl<$Res, $Val extends OrderPatient>
    implements $OrderPatientCopyWith<$Res> {
  _$OrderPatientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderPatient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? gender = null,
    Object? dob = null,
    Object? mobile = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderPatientImplCopyWith<$Res>
    implements $OrderPatientCopyWith<$Res> {
  factory _$$OrderPatientImplCopyWith(
          _$OrderPatientImpl value, $Res Function(_$OrderPatientImpl) then) =
      __$$OrderPatientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String id, String gender, String dob, String mobile});
}

/// @nodoc
class __$$OrderPatientImplCopyWithImpl<$Res>
    extends _$OrderPatientCopyWithImpl<$Res, _$OrderPatientImpl>
    implements _$$OrderPatientImplCopyWith<$Res> {
  __$$OrderPatientImplCopyWithImpl(
      _$OrderPatientImpl _value, $Res Function(_$OrderPatientImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderPatient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? gender = null,
    Object? dob = null,
    Object? mobile = null,
  }) {
    return _then(_$OrderPatientImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderPatientImpl implements _OrderPatient {
  const _$OrderPatientImpl(
      {required this.name,
      required this.id,
      required this.gender,
      required this.dob,
      this.mobile = ''});

  factory _$OrderPatientImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderPatientImplFromJson(json);

  @override
  final String name;
  @override
  final String id;
  @override
  final String gender;
  @override
  final String dob;
  @override
  @JsonKey()
  final String mobile;

  @override
  String toString() {
    return 'OrderPatient(name: $name, id: $id, gender: $gender, dob: $dob, mobile: $mobile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderPatientImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.mobile, mobile) || other.mobile == mobile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, id, gender, dob, mobile);

  /// Create a copy of OrderPatient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderPatientImplCopyWith<_$OrderPatientImpl> get copyWith =>
      __$$OrderPatientImplCopyWithImpl<_$OrderPatientImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderPatientImplToJson(
      this,
    );
  }
}

abstract class _OrderPatient implements OrderPatient {
  const factory _OrderPatient(
      {required final String name,
      required final String id,
      required final String gender,
      required final String dob,
      final String mobile}) = _$OrderPatientImpl;

  factory _OrderPatient.fromJson(Map<String, dynamic> json) =
      _$OrderPatientImpl.fromJson;

  @override
  String get name;
  @override
  String get id;
  @override
  String get gender;
  @override
  String get dob;
  @override
  String get mobile;

  /// Create a copy of OrderPatient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderPatientImplCopyWith<_$OrderPatientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
