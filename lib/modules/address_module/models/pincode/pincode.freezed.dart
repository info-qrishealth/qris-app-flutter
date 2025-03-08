// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pincode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Pincode _$PincodeFromJson(Map<String, dynamic> json) {
  return _Pincode.fromJson(json);
}

/// @nodoc
mixin _$Pincode {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'pincode')
  int get pincode => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_order')
  int get minOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_charge')
  int get deliveryCharge => throw _privateConstructorUsedError;
  @JsonKey(name: 'hard_copy_charge')
  int get hardCopyCharge => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;

  /// Serializes this Pincode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pincode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PincodeCopyWith<Pincode> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PincodeCopyWith<$Res> {
  factory $PincodeCopyWith(Pincode value, $Res Function(Pincode) then) =
      _$PincodeCopyWithImpl<$Res, Pincode>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'pincode') int pincode,
      @JsonKey(name: 'min_order') int minOrder,
      @JsonKey(name: 'delivery_charge') int deliveryCharge,
      @JsonKey(name: 'hard_copy_charge') int hardCopyCharge,
      @JsonKey(name: 'status') String status});
}

/// @nodoc
class _$PincodeCopyWithImpl<$Res, $Val extends Pincode>
    implements $PincodeCopyWith<$Res> {
  _$PincodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pincode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? pincode = null,
    Object? minOrder = null,
    Object? deliveryCharge = null,
    Object? hardCopyCharge = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      pincode: null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as int,
      minOrder: null == minOrder
          ? _value.minOrder
          : minOrder // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryCharge: null == deliveryCharge
          ? _value.deliveryCharge
          : deliveryCharge // ignore: cast_nullable_to_non_nullable
              as int,
      hardCopyCharge: null == hardCopyCharge
          ? _value.hardCopyCharge
          : hardCopyCharge // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PincodeImplCopyWith<$Res> implements $PincodeCopyWith<$Res> {
  factory _$$PincodeImplCopyWith(
          _$PincodeImpl value, $Res Function(_$PincodeImpl) then) =
      __$$PincodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'pincode') int pincode,
      @JsonKey(name: 'min_order') int minOrder,
      @JsonKey(name: 'delivery_charge') int deliveryCharge,
      @JsonKey(name: 'hard_copy_charge') int hardCopyCharge,
      @JsonKey(name: 'status') String status});
}

/// @nodoc
class __$$PincodeImplCopyWithImpl<$Res>
    extends _$PincodeCopyWithImpl<$Res, _$PincodeImpl>
    implements _$$PincodeImplCopyWith<$Res> {
  __$$PincodeImplCopyWithImpl(
      _$PincodeImpl _value, $Res Function(_$PincodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Pincode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? pincode = null,
    Object? minOrder = null,
    Object? deliveryCharge = null,
    Object? hardCopyCharge = null,
    Object? status = null,
  }) {
    return _then(_$PincodeImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      pincode: null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as int,
      minOrder: null == minOrder
          ? _value.minOrder
          : minOrder // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryCharge: null == deliveryCharge
          ? _value.deliveryCharge
          : deliveryCharge // ignore: cast_nullable_to_non_nullable
              as int,
      hardCopyCharge: null == hardCopyCharge
          ? _value.hardCopyCharge
          : hardCopyCharge // ignore: cast_nullable_to_non_nullable
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
class _$PincodeImpl implements _Pincode {
  _$PincodeImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'pincode') required this.pincode,
      @JsonKey(name: 'min_order') required this.minOrder,
      @JsonKey(name: 'delivery_charge') required this.deliveryCharge,
      @JsonKey(name: 'hard_copy_charge') required this.hardCopyCharge,
      @JsonKey(name: 'status') this.status = '1'});

  factory _$PincodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PincodeImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'pincode')
  final int pincode;
  @override
  @JsonKey(name: 'min_order')
  final int minOrder;
  @override
  @JsonKey(name: 'delivery_charge')
  final int deliveryCharge;
  @override
  @JsonKey(name: 'hard_copy_charge')
  final int hardCopyCharge;
  @override
  @JsonKey(name: 'status')
  final String status;

  @override
  String toString() {
    return 'Pincode(id: $id, pincode: $pincode, minOrder: $minOrder, deliveryCharge: $deliveryCharge, hardCopyCharge: $hardCopyCharge, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PincodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            (identical(other.minOrder, minOrder) ||
                other.minOrder == minOrder) &&
            (identical(other.deliveryCharge, deliveryCharge) ||
                other.deliveryCharge == deliveryCharge) &&
            (identical(other.hardCopyCharge, hardCopyCharge) ||
                other.hardCopyCharge == hardCopyCharge) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, pincode, minOrder,
      deliveryCharge, hardCopyCharge, status);

  /// Create a copy of Pincode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PincodeImplCopyWith<_$PincodeImpl> get copyWith =>
      __$$PincodeImplCopyWithImpl<_$PincodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PincodeImplToJson(
      this,
    );
  }
}

abstract class _Pincode implements Pincode {
  factory _Pincode(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'pincode') required final int pincode,
      @JsonKey(name: 'min_order') required final int minOrder,
      @JsonKey(name: 'delivery_charge') required final int deliveryCharge,
      @JsonKey(name: 'hard_copy_charge') required final int hardCopyCharge,
      @JsonKey(name: 'status') final String status}) = _$PincodeImpl;

  factory _Pincode.fromJson(Map<String, dynamic> json) = _$PincodeImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'pincode')
  int get pincode;
  @override
  @JsonKey(name: 'min_order')
  int get minOrder;
  @override
  @JsonKey(name: 'delivery_charge')
  int get deliveryCharge;
  @override
  @JsonKey(name: 'hard_copy_charge')
  int get hardCopyCharge;
  @override
  @JsonKey(name: 'status')
  String get status;

  /// Create a copy of Pincode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PincodeImplCopyWith<_$PincodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
