// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationToken _$NotificationTokenFromJson(Map<String, dynamic> json) {
  return _NotificationToken.fromJson(json);
}

/// @nodoc
mixin _$NotificationToken {
  int? get userId => throw _privateConstructorUsedError;
  int? get phleboId => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  int get platform => throw _privateConstructorUsedError;
  String get deviceIdentifier => throw _privateConstructorUsedError;

  /// Serializes this NotificationToken to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationTokenCopyWith<NotificationToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationTokenCopyWith<$Res> {
  factory $NotificationTokenCopyWith(
          NotificationToken value, $Res Function(NotificationToken) then) =
      _$NotificationTokenCopyWithImpl<$Res, NotificationToken>;
  @useResult
  $Res call(
      {int? userId,
      int? phleboId,
      String token,
      int platform,
      String deviceIdentifier});
}

/// @nodoc
class _$NotificationTokenCopyWithImpl<$Res, $Val extends NotificationToken>
    implements $NotificationTokenCopyWith<$Res> {
  _$NotificationTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? phleboId = freezed,
    Object? token = null,
    Object? platform = null,
    Object? deviceIdentifier = null,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      phleboId: freezed == phleboId
          ? _value.phleboId
          : phleboId // ignore: cast_nullable_to_non_nullable
              as int?,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as int,
      deviceIdentifier: null == deviceIdentifier
          ? _value.deviceIdentifier
          : deviceIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationTokenImplCopyWith<$Res>
    implements $NotificationTokenCopyWith<$Res> {
  factory _$$NotificationTokenImplCopyWith(_$NotificationTokenImpl value,
          $Res Function(_$NotificationTokenImpl) then) =
      __$$NotificationTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? userId,
      int? phleboId,
      String token,
      int platform,
      String deviceIdentifier});
}

/// @nodoc
class __$$NotificationTokenImplCopyWithImpl<$Res>
    extends _$NotificationTokenCopyWithImpl<$Res, _$NotificationTokenImpl>
    implements _$$NotificationTokenImplCopyWith<$Res> {
  __$$NotificationTokenImplCopyWithImpl(_$NotificationTokenImpl _value,
      $Res Function(_$NotificationTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? phleboId = freezed,
    Object? token = null,
    Object? platform = null,
    Object? deviceIdentifier = null,
  }) {
    return _then(_$NotificationTokenImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      phleboId: freezed == phleboId
          ? _value.phleboId
          : phleboId // ignore: cast_nullable_to_non_nullable
              as int?,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as int,
      deviceIdentifier: null == deviceIdentifier
          ? _value.deviceIdentifier
          : deviceIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$NotificationTokenImpl implements _NotificationToken {
  const _$NotificationTokenImpl(
      {this.userId,
      this.phleboId,
      required this.token,
      required this.platform,
      required this.deviceIdentifier});

  factory _$NotificationTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationTokenImplFromJson(json);

  @override
  final int? userId;
  @override
  final int? phleboId;
  @override
  final String token;
  @override
  final int platform;
  @override
  final String deviceIdentifier;

  @override
  String toString() {
    return 'NotificationToken(userId: $userId, phleboId: $phleboId, token: $token, platform: $platform, deviceIdentifier: $deviceIdentifier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationTokenImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.phleboId, phleboId) ||
                other.phleboId == phleboId) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.deviceIdentifier, deviceIdentifier) ||
                other.deviceIdentifier == deviceIdentifier));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, userId, phleboId, token, platform, deviceIdentifier);

  /// Create a copy of NotificationToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationTokenImplCopyWith<_$NotificationTokenImpl> get copyWith =>
      __$$NotificationTokenImplCopyWithImpl<_$NotificationTokenImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationTokenImplToJson(
      this,
    );
  }
}

abstract class _NotificationToken implements NotificationToken {
  const factory _NotificationToken(
      {final int? userId,
      final int? phleboId,
      required final String token,
      required final int platform,
      required final String deviceIdentifier}) = _$NotificationTokenImpl;

  factory _NotificationToken.fromJson(Map<String, dynamic> json) =
      _$NotificationTokenImpl.fromJson;

  @override
  int? get userId;
  @override
  int? get phleboId;
  @override
  String get token;
  @override
  int get platform;
  @override
  String get deviceIdentifier;

  /// Create a copy of NotificationToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationTokenImplCopyWith<_$NotificationTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
