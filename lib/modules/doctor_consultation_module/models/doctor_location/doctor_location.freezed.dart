// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DoctorLocation _$DoctorLocationFromJson(Map<String, dynamic> json) {
  return _DoctorLocation.fromJson(json);
}

/// @nodoc
mixin _$DoctorLocation {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'city_id')
  int? get cityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'slug')
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  String? get deletedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;

  /// Serializes this DoctorLocation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoctorLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorLocationCopyWith<DoctorLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorLocationCopyWith<$Res> {
  factory $DoctorLocationCopyWith(
          DoctorLocation value, $Res Function(DoctorLocation) then) =
      _$DoctorLocationCopyWithImpl<$Res, DoctorLocation>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'city_id') int? cityId,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'deleted_at') String? deletedAt,
      @JsonKey(name: 'status') String status});
}

/// @nodoc
class _$DoctorLocationCopyWithImpl<$Res, $Val extends DoctorLocation>
    implements $DoctorLocationCopyWith<$Res> {
  _$DoctorLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? cityId = freezed,
    Object? slug = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      cityId: freezed == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as int?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DoctorLocationImplCopyWith<$Res>
    implements $DoctorLocationCopyWith<$Res> {
  factory _$$DoctorLocationImplCopyWith(_$DoctorLocationImpl value,
          $Res Function(_$DoctorLocationImpl) then) =
      __$$DoctorLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'city_id') int? cityId,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'deleted_at') String? deletedAt,
      @JsonKey(name: 'status') String status});
}

/// @nodoc
class __$$DoctorLocationImplCopyWithImpl<$Res>
    extends _$DoctorLocationCopyWithImpl<$Res, _$DoctorLocationImpl>
    implements _$$DoctorLocationImplCopyWith<$Res> {
  __$$DoctorLocationImplCopyWithImpl(
      _$DoctorLocationImpl _value, $Res Function(_$DoctorLocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of DoctorLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? cityId = freezed,
    Object? slug = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? status = null,
  }) {
    return _then(_$DoctorLocationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      cityId: freezed == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as int?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorLocationImpl implements _DoctorLocation {
  const _$DoctorLocationImpl(
      {required this.id,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'city_id') this.cityId,
      @JsonKey(name: 'slug') this.slug,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'deleted_at') this.deletedAt,
      @JsonKey(name: 'status') required this.status});

  factory _$DoctorLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorLocationImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'city_id')
  final int? cityId;
  @override
  @JsonKey(name: 'slug')
  final String? slug;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  @JsonKey(name: 'deleted_at')
  final String? deletedAt;
  @override
  @JsonKey(name: 'status')
  final String status;

  @override
  String toString() {
    return 'DoctorLocation(id: $id, title: $title, cityId: $cityId, slug: $slug, updatedAt: $updatedAt, deletedAt: $deletedAt, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorLocationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.cityId, cityId) || other.cityId == cityId) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, cityId, slug, updatedAt, deletedAt, status);

  /// Create a copy of DoctorLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorLocationImplCopyWith<_$DoctorLocationImpl> get copyWith =>
      __$$DoctorLocationImplCopyWithImpl<_$DoctorLocationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorLocationImplToJson(
      this,
    );
  }
}

abstract class _DoctorLocation implements DoctorLocation {
  const factory _DoctorLocation(
          {required final int id,
          @JsonKey(name: 'title') final String? title,
          @JsonKey(name: 'city_id') final int? cityId,
          @JsonKey(name: 'slug') final String? slug,
          @JsonKey(name: 'updated_at') final String? updatedAt,
          @JsonKey(name: 'deleted_at') final String? deletedAt,
          @JsonKey(name: 'status') required final String status}) =
      _$DoctorLocationImpl;

  factory _DoctorLocation.fromJson(Map<String, dynamic> json) =
      _$DoctorLocationImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'city_id')
  int? get cityId;
  @override
  @JsonKey(name: 'slug')
  String? get slug;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  @JsonKey(name: 'deleted_at')
  String? get deletedAt;
  @override
  @JsonKey(name: 'status')
  String get status;

  /// Create a copy of DoctorLocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorLocationImplCopyWith<_$DoctorLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
