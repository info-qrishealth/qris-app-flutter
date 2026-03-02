// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'free_consultation_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FreeConsultationRequest _$FreeConsultationRequestFromJson(
    Map<String, dynamic> json) {
  return _FreeConsultationRequest.fromJson(json);
}

/// @nodoc
mixin _$FreeConsultationRequest {
  @JsonKey(name: 'orderId')
  int get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'patientIds')
  List<String> get patientIds => throw _privateConstructorUsedError;

  /// Serializes this FreeConsultationRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FreeConsultationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FreeConsultationRequestCopyWith<FreeConsultationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreeConsultationRequestCopyWith<$Res> {
  factory $FreeConsultationRequestCopyWith(FreeConsultationRequest value,
          $Res Function(FreeConsultationRequest) then) =
      _$FreeConsultationRequestCopyWithImpl<$Res, FreeConsultationRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'orderId') int orderId,
      @JsonKey(name: 'patientIds') List<String> patientIds});
}

/// @nodoc
class _$FreeConsultationRequestCopyWithImpl<$Res,
        $Val extends FreeConsultationRequest>
    implements $FreeConsultationRequestCopyWith<$Res> {
  _$FreeConsultationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FreeConsultationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? patientIds = null,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      patientIds: null == patientIds
          ? _value.patientIds
          : patientIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FreeConsultationRequestImplCopyWith<$Res>
    implements $FreeConsultationRequestCopyWith<$Res> {
  factory _$$FreeConsultationRequestImplCopyWith(
          _$FreeConsultationRequestImpl value,
          $Res Function(_$FreeConsultationRequestImpl) then) =
      __$$FreeConsultationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'orderId') int orderId,
      @JsonKey(name: 'patientIds') List<String> patientIds});
}

/// @nodoc
class __$$FreeConsultationRequestImplCopyWithImpl<$Res>
    extends _$FreeConsultationRequestCopyWithImpl<$Res,
        _$FreeConsultationRequestImpl>
    implements _$$FreeConsultationRequestImplCopyWith<$Res> {
  __$$FreeConsultationRequestImplCopyWithImpl(
      _$FreeConsultationRequestImpl _value,
      $Res Function(_$FreeConsultationRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of FreeConsultationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? patientIds = null,
  }) {
    return _then(_$FreeConsultationRequestImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      patientIds: null == patientIds
          ? _value._patientIds
          : patientIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FreeConsultationRequestImpl implements _FreeConsultationRequest {
  const _$FreeConsultationRequestImpl(
      {@JsonKey(name: 'orderId') required this.orderId,
      @JsonKey(name: 'patientIds') required final List<String> patientIds})
      : _patientIds = patientIds;

  factory _$FreeConsultationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$FreeConsultationRequestImplFromJson(json);

  @override
  @JsonKey(name: 'orderId')
  final int orderId;
  final List<String> _patientIds;
  @override
  @JsonKey(name: 'patientIds')
  List<String> get patientIds {
    if (_patientIds is EqualUnmodifiableListView) return _patientIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_patientIds);
  }

  @override
  String toString() {
    return 'FreeConsultationRequest(orderId: $orderId, patientIds: $patientIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FreeConsultationRequestImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            const DeepCollectionEquality()
                .equals(other._patientIds, _patientIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, orderId, const DeepCollectionEquality().hash(_patientIds));

  /// Create a copy of FreeConsultationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FreeConsultationRequestImplCopyWith<_$FreeConsultationRequestImpl>
      get copyWith => __$$FreeConsultationRequestImplCopyWithImpl<
          _$FreeConsultationRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FreeConsultationRequestImplToJson(
      this,
    );
  }
}

abstract class _FreeConsultationRequest implements FreeConsultationRequest {
  const factory _FreeConsultationRequest(
      {@JsonKey(name: 'orderId') required final int orderId,
      @JsonKey(name: 'patientIds')
      required final List<String> patientIds}) = _$FreeConsultationRequestImpl;

  factory _FreeConsultationRequest.fromJson(Map<String, dynamic> json) =
      _$FreeConsultationRequestImpl.fromJson;

  @override
  @JsonKey(name: 'orderId')
  int get orderId;
  @override
  @JsonKey(name: 'patientIds')
  List<String> get patientIds;

  /// Create a copy of FreeConsultationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FreeConsultationRequestImplCopyWith<_$FreeConsultationRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
