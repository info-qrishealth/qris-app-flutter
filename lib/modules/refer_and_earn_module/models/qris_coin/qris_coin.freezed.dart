// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qris_coin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QrisCoin _$QrisCoinFromJson(Map<String, dynamic> json) {
  return _QrisCoin.fromJson(json);
}

/// @nodoc
mixin _$QrisCoin {
  int get id => throw _privateConstructorUsedError;
  double get coins => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  String get dated => throw _privateConstructorUsedError;
  @JsonKey(name: 'txn_id')
  String get txnId => throw _privateConstructorUsedError;
  @JsonKey(name: 'txn_type')
  TransactionType get txnType => throw _privateConstructorUsedError;
  String get remark => throw _privateConstructorUsedError;

  /// Serializes this QrisCoin to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QrisCoin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QrisCoinCopyWith<QrisCoin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrisCoinCopyWith<$Res> {
  factory $QrisCoinCopyWith(QrisCoin value, $Res Function(QrisCoin) then) =
      _$QrisCoinCopyWithImpl<$Res, QrisCoin>;
  @useResult
  $Res call(
      {int id,
      double coins,
      @JsonKey(name: 'user_id') int? userId,
      String dated,
      @JsonKey(name: 'txn_id') String txnId,
      @JsonKey(name: 'txn_type') TransactionType txnType,
      String remark});
}

/// @nodoc
class _$QrisCoinCopyWithImpl<$Res, $Val extends QrisCoin>
    implements $QrisCoinCopyWith<$Res> {
  _$QrisCoinCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QrisCoin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? coins = null,
    Object? userId = freezed,
    Object? dated = null,
    Object? txnId = null,
    Object? txnType = null,
    Object? remark = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      coins: null == coins
          ? _value.coins
          : coins // ignore: cast_nullable_to_non_nullable
              as double,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      dated: null == dated
          ? _value.dated
          : dated // ignore: cast_nullable_to_non_nullable
              as String,
      txnId: null == txnId
          ? _value.txnId
          : txnId // ignore: cast_nullable_to_non_nullable
              as String,
      txnType: null == txnType
          ? _value.txnType
          : txnType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QrisCoinImplCopyWith<$Res>
    implements $QrisCoinCopyWith<$Res> {
  factory _$$QrisCoinImplCopyWith(
          _$QrisCoinImpl value, $Res Function(_$QrisCoinImpl) then) =
      __$$QrisCoinImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      double coins,
      @JsonKey(name: 'user_id') int? userId,
      String dated,
      @JsonKey(name: 'txn_id') String txnId,
      @JsonKey(name: 'txn_type') TransactionType txnType,
      String remark});
}

/// @nodoc
class __$$QrisCoinImplCopyWithImpl<$Res>
    extends _$QrisCoinCopyWithImpl<$Res, _$QrisCoinImpl>
    implements _$$QrisCoinImplCopyWith<$Res> {
  __$$QrisCoinImplCopyWithImpl(
      _$QrisCoinImpl _value, $Res Function(_$QrisCoinImpl) _then)
      : super(_value, _then);

  /// Create a copy of QrisCoin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? coins = null,
    Object? userId = freezed,
    Object? dated = null,
    Object? txnId = null,
    Object? txnType = null,
    Object? remark = null,
  }) {
    return _then(_$QrisCoinImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      coins: null == coins
          ? _value.coins
          : coins // ignore: cast_nullable_to_non_nullable
              as double,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      dated: null == dated
          ? _value.dated
          : dated // ignore: cast_nullable_to_non_nullable
              as String,
      txnId: null == txnId
          ? _value.txnId
          : txnId // ignore: cast_nullable_to_non_nullable
              as String,
      txnType: null == txnType
          ? _value.txnType
          : txnType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QrisCoinImpl implements _QrisCoin {
  const _$QrisCoinImpl(
      {required this.id,
      required this.coins,
      @JsonKey(name: 'user_id') this.userId,
      required this.dated,
      @JsonKey(name: 'txn_id') required this.txnId,
      @JsonKey(name: 'txn_type') required this.txnType,
      required this.remark});

  factory _$QrisCoinImpl.fromJson(Map<String, dynamic> json) =>
      _$$QrisCoinImplFromJson(json);

  @override
  final int id;
  @override
  final double coins;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  final String dated;
  @override
  @JsonKey(name: 'txn_id')
  final String txnId;
  @override
  @JsonKey(name: 'txn_type')
  final TransactionType txnType;
  @override
  final String remark;

  @override
  String toString() {
    return 'QrisCoin(id: $id, coins: $coins, userId: $userId, dated: $dated, txnId: $txnId, txnType: $txnType, remark: $remark)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrisCoinImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.coins, coins) || other.coins == coins) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.dated, dated) || other.dated == dated) &&
            (identical(other.txnId, txnId) || other.txnId == txnId) &&
            (identical(other.txnType, txnType) || other.txnType == txnType) &&
            (identical(other.remark, remark) || other.remark == remark));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, coins, userId, dated, txnId, txnType, remark);

  /// Create a copy of QrisCoin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QrisCoinImplCopyWith<_$QrisCoinImpl> get copyWith =>
      __$$QrisCoinImplCopyWithImpl<_$QrisCoinImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QrisCoinImplToJson(
      this,
    );
  }
}

abstract class _QrisCoin implements QrisCoin {
  const factory _QrisCoin(
      {required final int id,
      required final double coins,
      @JsonKey(name: 'user_id') final int? userId,
      required final String dated,
      @JsonKey(name: 'txn_id') required final String txnId,
      @JsonKey(name: 'txn_type') required final TransactionType txnType,
      required final String remark}) = _$QrisCoinImpl;

  factory _QrisCoin.fromJson(Map<String, dynamic> json) =
      _$QrisCoinImpl.fromJson;

  @override
  int get id;
  @override
  double get coins;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  String get dated;
  @override
  @JsonKey(name: 'txn_id')
  String get txnId;
  @override
  @JsonKey(name: 'txn_type')
  TransactionType get txnType;
  @override
  String get remark;

  /// Create a copy of QrisCoin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QrisCoinImplCopyWith<_$QrisCoinImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
