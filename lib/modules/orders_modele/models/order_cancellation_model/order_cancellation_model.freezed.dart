// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_cancellation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderCancellationModel _$OrderCancellationModelFromJson(
    Map<String, dynamic> json) {
  return _OrderCancellationModel.fromJson(json);
}

/// @nodoc
mixin _$OrderCancellationModel {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_id')
  String get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  String get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'txn_id')
  String get txnId => throw _privateConstructorUsedError;
  @JsonKey(name: 'cancellation_remark')
  String get cancellationRemark => throw _privateConstructorUsedError;
  @JsonKey(name: 'cancellation_comment')
  String get cancellationComment => throw _privateConstructorUsedError;

  /// Serializes this OrderCancellationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderCancellationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCancellationModelCopyWith<OrderCancellationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCancellationModelCopyWith<$Res> {
  factory $OrderCancellationModelCopyWith(OrderCancellationModel value,
          $Res Function(OrderCancellationModel) then) =
      _$OrderCancellationModelCopyWithImpl<$Res, OrderCancellationModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'doctor_id') String doctorId,
      @JsonKey(name: 'order_id') String orderId,
      @JsonKey(name: 'txn_id') String txnId,
      @JsonKey(name: 'cancellation_remark') String cancellationRemark,
      @JsonKey(name: 'cancellation_comment') String cancellationComment});
}

/// @nodoc
class _$OrderCancellationModelCopyWithImpl<$Res,
        $Val extends OrderCancellationModel>
    implements $OrderCancellationModelCopyWith<$Res> {
  _$OrderCancellationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderCancellationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? doctorId = null,
    Object? orderId = null,
    Object? txnId = null,
    Object? cancellationRemark = null,
    Object? cancellationComment = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      txnId: null == txnId
          ? _value.txnId
          : txnId // ignore: cast_nullable_to_non_nullable
              as String,
      cancellationRemark: null == cancellationRemark
          ? _value.cancellationRemark
          : cancellationRemark // ignore: cast_nullable_to_non_nullable
              as String,
      cancellationComment: null == cancellationComment
          ? _value.cancellationComment
          : cancellationComment // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderCancellationModelImplCopyWith<$Res>
    implements $OrderCancellationModelCopyWith<$Res> {
  factory _$$OrderCancellationModelImplCopyWith(
          _$OrderCancellationModelImpl value,
          $Res Function(_$OrderCancellationModelImpl) then) =
      __$$OrderCancellationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'doctor_id') String doctorId,
      @JsonKey(name: 'order_id') String orderId,
      @JsonKey(name: 'txn_id') String txnId,
      @JsonKey(name: 'cancellation_remark') String cancellationRemark,
      @JsonKey(name: 'cancellation_comment') String cancellationComment});
}

/// @nodoc
class __$$OrderCancellationModelImplCopyWithImpl<$Res>
    extends _$OrderCancellationModelCopyWithImpl<$Res,
        _$OrderCancellationModelImpl>
    implements _$$OrderCancellationModelImplCopyWith<$Res> {
  __$$OrderCancellationModelImplCopyWithImpl(
      _$OrderCancellationModelImpl _value,
      $Res Function(_$OrderCancellationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderCancellationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? doctorId = null,
    Object? orderId = null,
    Object? txnId = null,
    Object? cancellationRemark = null,
    Object? cancellationComment = null,
  }) {
    return _then(_$OrderCancellationModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      txnId: null == txnId
          ? _value.txnId
          : txnId // ignore: cast_nullable_to_non_nullable
              as String,
      cancellationRemark: null == cancellationRemark
          ? _value.cancellationRemark
          : cancellationRemark // ignore: cast_nullable_to_non_nullable
              as String,
      cancellationComment: null == cancellationComment
          ? _value.cancellationComment
          : cancellationComment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderCancellationModelImpl implements _OrderCancellationModel {
  const _$OrderCancellationModelImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'doctor_id') required this.doctorId,
      @JsonKey(name: 'order_id') required this.orderId,
      @JsonKey(name: 'txn_id') required this.txnId,
      @JsonKey(name: 'cancellation_remark') required this.cancellationRemark,
      @JsonKey(name: 'cancellation_comment')
      required this.cancellationComment});

  factory _$OrderCancellationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderCancellationModelImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'doctor_id')
  final String doctorId;
  @override
  @JsonKey(name: 'order_id')
  final String orderId;
  @override
  @JsonKey(name: 'txn_id')
  final String txnId;
  @override
  @JsonKey(name: 'cancellation_remark')
  final String cancellationRemark;
  @override
  @JsonKey(name: 'cancellation_comment')
  final String cancellationComment;

  @override
  String toString() {
    return 'OrderCancellationModel(userId: $userId, doctorId: $doctorId, orderId: $orderId, txnId: $txnId, cancellationRemark: $cancellationRemark, cancellationComment: $cancellationComment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderCancellationModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.txnId, txnId) || other.txnId == txnId) &&
            (identical(other.cancellationRemark, cancellationRemark) ||
                other.cancellationRemark == cancellationRemark) &&
            (identical(other.cancellationComment, cancellationComment) ||
                other.cancellationComment == cancellationComment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, doctorId, orderId, txnId,
      cancellationRemark, cancellationComment);

  /// Create a copy of OrderCancellationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderCancellationModelImplCopyWith<_$OrderCancellationModelImpl>
      get copyWith => __$$OrderCancellationModelImplCopyWithImpl<
          _$OrderCancellationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderCancellationModelImplToJson(
      this,
    );
  }
}

abstract class _OrderCancellationModel implements OrderCancellationModel {
  const factory _OrderCancellationModel(
          {@JsonKey(name: 'user_id') required final String userId,
          @JsonKey(name: 'doctor_id') required final String doctorId,
          @JsonKey(name: 'order_id') required final String orderId,
          @JsonKey(name: 'txn_id') required final String txnId,
          @JsonKey(name: 'cancellation_remark')
          required final String cancellationRemark,
          @JsonKey(name: 'cancellation_comment')
          required final String cancellationComment}) =
      _$OrderCancellationModelImpl;

  factory _OrderCancellationModel.fromJson(Map<String, dynamic> json) =
      _$OrderCancellationModelImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'doctor_id')
  String get doctorId;
  @override
  @JsonKey(name: 'order_id')
  String get orderId;
  @override
  @JsonKey(name: 'txn_id')
  String get txnId;
  @override
  @JsonKey(name: 'cancellation_remark')
  String get cancellationRemark;
  @override
  @JsonKey(name: 'cancellation_comment')
  String get cancellationComment;

  /// Create a copy of OrderCancellationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderCancellationModelImplCopyWith<_$OrderCancellationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
