// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_education.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DoctorEducation _$DoctorEducationFromJson(Map<String, dynamic> json) {
  return _DoctorEducation.fromJson(json);
}

/// @nodoc
mixin _$DoctorEducation {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'doc_id')
  int? get docId => throw _privateConstructorUsedError;
  String? get education => throw _privateConstructorUsedError;
  String? get college => throw _privateConstructorUsedError;

  /// Serializes this DoctorEducation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoctorEducation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorEducationCopyWith<DoctorEducation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorEducationCopyWith<$Res> {
  factory $DoctorEducationCopyWith(
          DoctorEducation value, $Res Function(DoctorEducation) then) =
      _$DoctorEducationCopyWithImpl<$Res, DoctorEducation>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'doc_id') int? docId,
      String? education,
      String? college});
}

/// @nodoc
class _$DoctorEducationCopyWithImpl<$Res, $Val extends DoctorEducation>
    implements $DoctorEducationCopyWith<$Res> {
  _$DoctorEducationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorEducation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? docId = freezed,
    Object? education = freezed,
    Object? college = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      docId: freezed == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as int?,
      education: freezed == education
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as String?,
      college: freezed == college
          ? _value.college
          : college // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DoctorEducationImplCopyWith<$Res>
    implements $DoctorEducationCopyWith<$Res> {
  factory _$$DoctorEducationImplCopyWith(_$DoctorEducationImpl value,
          $Res Function(_$DoctorEducationImpl) then) =
      __$$DoctorEducationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'doc_id') int? docId,
      String? education,
      String? college});
}

/// @nodoc
class __$$DoctorEducationImplCopyWithImpl<$Res>
    extends _$DoctorEducationCopyWithImpl<$Res, _$DoctorEducationImpl>
    implements _$$DoctorEducationImplCopyWith<$Res> {
  __$$DoctorEducationImplCopyWithImpl(
      _$DoctorEducationImpl _value, $Res Function(_$DoctorEducationImpl) _then)
      : super(_value, _then);

  /// Create a copy of DoctorEducation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? docId = freezed,
    Object? education = freezed,
    Object? college = freezed,
  }) {
    return _then(_$DoctorEducationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      docId: freezed == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as int?,
      education: freezed == education
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as String?,
      college: freezed == college
          ? _value.college
          : college // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorEducationImpl implements _DoctorEducation {
  const _$DoctorEducationImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'doc_id') this.docId,
      this.education,
      this.college});

  factory _$DoctorEducationImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorEducationImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'doc_id')
  final int? docId;
  @override
  final String? education;
  @override
  final String? college;

  @override
  String toString() {
    return 'DoctorEducation(id: $id, docId: $docId, education: $education, college: $college)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorEducationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.docId, docId) || other.docId == docId) &&
            (identical(other.education, education) ||
                other.education == education) &&
            (identical(other.college, college) || other.college == college));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, docId, education, college);

  /// Create a copy of DoctorEducation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorEducationImplCopyWith<_$DoctorEducationImpl> get copyWith =>
      __$$DoctorEducationImplCopyWithImpl<_$DoctorEducationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorEducationImplToJson(
      this,
    );
  }
}

abstract class _DoctorEducation implements DoctorEducation {
  const factory _DoctorEducation(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'doc_id') final int? docId,
      final String? education,
      final String? college}) = _$DoctorEducationImpl;

  factory _DoctorEducation.fromJson(Map<String, dynamic> json) =
      _$DoctorEducationImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'doc_id')
  int? get docId;
  @override
  String? get education;
  @override
  String? get college;

  /// Create a copy of DoctorEducation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorEducationImplCopyWith<_$DoctorEducationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
