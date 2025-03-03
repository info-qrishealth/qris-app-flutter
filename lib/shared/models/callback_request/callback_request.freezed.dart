// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'callback_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CallbackRequest _$CallbackRequestFromJson(Map<String, dynamic> json) {
  return _CallbackRequest.fromJson(json);
}

/// @nodoc
mixin _$CallbackRequest {
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;

  /// Serializes this CallbackRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CallbackRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CallbackRequestCopyWith<CallbackRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallbackRequestCopyWith<$Res> {
  factory $CallbackRequestCopyWith(
          CallbackRequest value, $Res Function(CallbackRequest) then) =
      _$CallbackRequestCopyWithImpl<$Res, CallbackRequest>;
  @useResult
  $Res call({String name, String phoneNumber, String query});
}

/// @nodoc
class _$CallbackRequestCopyWithImpl<$Res, $Val extends CallbackRequest>
    implements $CallbackRequestCopyWith<$Res> {
  _$CallbackRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CallbackRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phoneNumber = null,
    Object? query = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CallbackRequestImplCopyWith<$Res>
    implements $CallbackRequestCopyWith<$Res> {
  factory _$$CallbackRequestImplCopyWith(_$CallbackRequestImpl value,
          $Res Function(_$CallbackRequestImpl) then) =
      __$$CallbackRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String phoneNumber, String query});
}

/// @nodoc
class __$$CallbackRequestImplCopyWithImpl<$Res>
    extends _$CallbackRequestCopyWithImpl<$Res, _$CallbackRequestImpl>
    implements _$$CallbackRequestImplCopyWith<$Res> {
  __$$CallbackRequestImplCopyWithImpl(
      _$CallbackRequestImpl _value, $Res Function(_$CallbackRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CallbackRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phoneNumber = null,
    Object? query = null,
  }) {
    return _then(_$CallbackRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CallbackRequestImpl implements _CallbackRequest {
  const _$CallbackRequestImpl(
      {required this.name, required this.phoneNumber, required this.query});

  factory _$CallbackRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallbackRequestImplFromJson(json);

  @override
  final String name;
  @override
  final String phoneNumber;
  @override
  final String query;

  @override
  String toString() {
    return 'CallbackRequest(name: $name, phoneNumber: $phoneNumber, query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallbackRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.query, query) || other.query == query));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, phoneNumber, query);

  /// Create a copy of CallbackRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CallbackRequestImplCopyWith<_$CallbackRequestImpl> get copyWith =>
      __$$CallbackRequestImplCopyWithImpl<_$CallbackRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CallbackRequestImplToJson(
      this,
    );
  }
}

abstract class _CallbackRequest implements CallbackRequest {
  const factory _CallbackRequest(
      {required final String name,
      required final String phoneNumber,
      required final String query}) = _$CallbackRequestImpl;

  factory _CallbackRequest.fromJson(Map<String, dynamic> json) =
      _$CallbackRequestImpl.fromJson;

  @override
  String get name;
  @override
  String get phoneNumber;
  @override
  String get query;

  /// Create a copy of CallbackRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CallbackRequestImplCopyWith<_$CallbackRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
