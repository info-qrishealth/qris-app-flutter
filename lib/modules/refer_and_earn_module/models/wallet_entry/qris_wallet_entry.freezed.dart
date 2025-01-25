// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qris_wallet_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QrisWalletEntry _$QrisWalletEntryFromJson(Map<String, dynamic> json) {
  return _QrisWalletEntry.fromJson(json);
}

/// @nodoc
mixin _$QrisWalletEntry {
  int get id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  String get dated => throw _privateConstructorUsedError;
  @JsonKey(name: 'txn_id')
  String? get txnId => throw _privateConstructorUsedError;
  @JsonKey(name: 'txn_type')
  TransactionType get txnType => throw _privateConstructorUsedError;
  String? get remark => throw _privateConstructorUsedError;

  /// Serializes this QrisWalletEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QrisWalletEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QrisWalletEntryCopyWith<QrisWalletEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrisWalletEntryCopyWith<$Res> {
  factory $QrisWalletEntryCopyWith(
          QrisWalletEntry value, $Res Function(QrisWalletEntry) then) =
      _$QrisWalletEntryCopyWithImpl<$Res, QrisWalletEntry>;
  @useResult
  $Res call(
      {int id,
      double amount,
      @JsonKey(name: 'user_id') int? userId,
      String dated,
      @JsonKey(name: 'txn_id') String? txnId,
      @JsonKey(name: 'txn_type') TransactionType txnType,
      String? remark});
}

/// @nodoc
class _$QrisWalletEntryCopyWithImpl<$Res, $Val extends QrisWalletEntry>
    implements $QrisWalletEntryCopyWith<$Res> {
  _$QrisWalletEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QrisWalletEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? userId = freezed,
    Object? dated = null,
    Object? txnId = freezed,
    Object? txnType = null,
    Object? remark = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      dated: null == dated
          ? _value.dated
          : dated // ignore: cast_nullable_to_non_nullable
              as String,
      txnId: freezed == txnId
          ? _value.txnId
          : txnId // ignore: cast_nullable_to_non_nullable
              as String?,
      txnType: null == txnType
          ? _value.txnType
          : txnType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      remark: freezed == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QrisWalletEntryImplCopyWith<$Res>
    implements $QrisWalletEntryCopyWith<$Res> {
  factory _$$QrisWalletEntryImplCopyWith(_$QrisWalletEntryImpl value,
          $Res Function(_$QrisWalletEntryImpl) then) =
      __$$QrisWalletEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      double amount,
      @JsonKey(name: 'user_id') int? userId,
      String dated,
      @JsonKey(name: 'txn_id') String? txnId,
      @JsonKey(name: 'txn_type') TransactionType txnType,
      String? remark});
}

/// @nodoc
class __$$QrisWalletEntryImplCopyWithImpl<$Res>
    extends _$QrisWalletEntryCopyWithImpl<$Res, _$QrisWalletEntryImpl>
    implements _$$QrisWalletEntryImplCopyWith<$Res> {
  __$$QrisWalletEntryImplCopyWithImpl(
      _$QrisWalletEntryImpl _value, $Res Function(_$QrisWalletEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of QrisWalletEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? userId = freezed,
    Object? dated = null,
    Object? txnId = freezed,
    Object? txnType = null,
    Object? remark = freezed,
  }) {
    return _then(_$QrisWalletEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      dated: null == dated
          ? _value.dated
          : dated // ignore: cast_nullable_to_non_nullable
              as String,
      txnId: freezed == txnId
          ? _value.txnId
          : txnId // ignore: cast_nullable_to_non_nullable
              as String?,
      txnType: null == txnType
          ? _value.txnType
          : txnType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      remark: freezed == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QrisWalletEntryImpl implements _QrisWalletEntry {
  const _$QrisWalletEntryImpl(
      {required this.id,
      required this.amount,
      @JsonKey(name: 'user_id') this.userId,
      required this.dated,
      @JsonKey(name: 'txn_id') this.txnId,
      @JsonKey(name: 'txn_type') required this.txnType,
      this.remark});

  factory _$QrisWalletEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$QrisWalletEntryImplFromJson(json);

  @override
  final int id;
  @override
  final double amount;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  final String dated;
  @override
  @JsonKey(name: 'txn_id')
  final String? txnId;
  @override
  @JsonKey(name: 'txn_type')
  final TransactionType txnType;
  @override
  final String? remark;

  @override
  String toString() {
    return 'QrisWalletEntry(id: $id, amount: $amount, userId: $userId, dated: $dated, txnId: $txnId, txnType: $txnType, remark: $remark)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrisWalletEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.dated, dated) || other.dated == dated) &&
            (identical(other.txnId, txnId) || other.txnId == txnId) &&
            (identical(other.txnType, txnType) || other.txnType == txnType) &&
            (identical(other.remark, remark) || other.remark == remark));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, amount, userId, dated, txnId, txnType, remark);

  /// Create a copy of QrisWalletEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QrisWalletEntryImplCopyWith<_$QrisWalletEntryImpl> get copyWith =>
      __$$QrisWalletEntryImplCopyWithImpl<_$QrisWalletEntryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QrisWalletEntryImplToJson(
      this,
    );
  }
}

abstract class _QrisWalletEntry implements QrisWalletEntry {
  const factory _QrisWalletEntry(
      {required final int id,
      required final double amount,
      @JsonKey(name: 'user_id') final int? userId,
      required final String dated,
      @JsonKey(name: 'txn_id') final String? txnId,
      @JsonKey(name: 'txn_type') required final TransactionType txnType,
      final String? remark}) = _$QrisWalletEntryImpl;

  factory _QrisWalletEntry.fromJson(Map<String, dynamic> json) =
      _$QrisWalletEntryImpl.fromJson;

  @override
  int get id;
  @override
  double get amount;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  String get dated;
  @override
  @JsonKey(name: 'txn_id')
  String? get txnId;
  @override
  @JsonKey(name: 'txn_type')
  TransactionType get txnType;
  @override
  String? get remark;

  /// Create a copy of QrisWalletEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QrisWalletEntryImplCopyWith<_$QrisWalletEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
