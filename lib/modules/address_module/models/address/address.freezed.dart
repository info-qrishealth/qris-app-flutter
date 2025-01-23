// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  String? get house => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_1')
  String? get address1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_2')
  String? get address2 => throw _privateConstructorUsedError;
  String? get landmark => throw _privateConstructorUsedError;
  String? get pincode => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'dis_order')
  int? get disOrder => throw _privateConstructorUsedError;

  /// Serializes this Address to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'user_id') String? userId,
      String? house,
      @JsonKey(name: 'address_1') String? address1,
      @JsonKey(name: 'address_2') String? address2,
      String? landmark,
      String? pincode,
      String? state,
      int? status,
      @JsonKey(name: 'dis_order') int? disOrder});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? house = freezed,
    Object? address1 = freezed,
    Object? address2 = freezed,
    Object? landmark = freezed,
    Object? pincode = freezed,
    Object? state = freezed,
    Object? status = freezed,
    Object? disOrder = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      house: freezed == house
          ? _value.house
          : house // ignore: cast_nullable_to_non_nullable
              as String?,
      address1: freezed == address1
          ? _value.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String?,
      address2: freezed == address2
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String?,
      landmark: freezed == landmark
          ? _value.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
      pincode: freezed == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      disOrder: freezed == disOrder
          ? _value.disOrder
          : disOrder // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressImplCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$AddressImplCopyWith(
          _$AddressImpl value, $Res Function(_$AddressImpl) then) =
      __$$AddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'user_id') String? userId,
      String? house,
      @JsonKey(name: 'address_1') String? address1,
      @JsonKey(name: 'address_2') String? address2,
      String? landmark,
      String? pincode,
      String? state,
      int? status,
      @JsonKey(name: 'dis_order') int? disOrder});
}

/// @nodoc
class __$$AddressImplCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$AddressImpl>
    implements _$$AddressImplCopyWith<$Res> {
  __$$AddressImplCopyWithImpl(
      _$AddressImpl _value, $Res Function(_$AddressImpl) _then)
      : super(_value, _then);

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? house = freezed,
    Object? address1 = freezed,
    Object? address2 = freezed,
    Object? landmark = freezed,
    Object? pincode = freezed,
    Object? state = freezed,
    Object? status = freezed,
    Object? disOrder = freezed,
  }) {
    return _then(_$AddressImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      house: freezed == house
          ? _value.house
          : house // ignore: cast_nullable_to_non_nullable
              as String?,
      address1: freezed == address1
          ? _value.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String?,
      address2: freezed == address2
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String?,
      landmark: freezed == landmark
          ? _value.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
      pincode: freezed == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      disOrder: freezed == disOrder
          ? _value.disOrder
          : disOrder // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressImpl implements _Address {
  const _$AddressImpl(
      {this.id,
      @JsonKey(name: 'user_id') this.userId,
      this.house,
      @JsonKey(name: 'address_1') this.address1,
      @JsonKey(name: 'address_2') this.address2,
      this.landmark,
      this.pincode,
      this.state,
      this.status,
      @JsonKey(name: 'dis_order') this.disOrder});

  factory _$AddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  final String? house;
  @override
  @JsonKey(name: 'address_1')
  final String? address1;
  @override
  @JsonKey(name: 'address_2')
  final String? address2;
  @override
  final String? landmark;
  @override
  final String? pincode;
  @override
  final String? state;
  @override
  final int? status;
  @override
  @JsonKey(name: 'dis_order')
  final int? disOrder;

  @override
  String toString() {
    return 'Address(id: $id, userId: $userId, house: $house, address1: $address1, address2: $address2, landmark: $landmark, pincode: $pincode, state: $state, status: $status, disOrder: $disOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.house, house) || other.house == house) &&
            (identical(other.address1, address1) ||
                other.address1 == address1) &&
            (identical(other.address2, address2) ||
                other.address2 == address2) &&
            (identical(other.landmark, landmark) ||
                other.landmark == landmark) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.disOrder, disOrder) ||
                other.disOrder == disOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, house, address1,
      address2, landmark, pincode, state, status, disOrder);

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      __$$AddressImplCopyWithImpl<_$AddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressImplToJson(
      this,
    );
  }
}

abstract class _Address implements Address {
  const factory _Address(
      {final int? id,
      @JsonKey(name: 'user_id') final String? userId,
      final String? house,
      @JsonKey(name: 'address_1') final String? address1,
      @JsonKey(name: 'address_2') final String? address2,
      final String? landmark,
      final String? pincode,
      final String? state,
      final int? status,
      @JsonKey(name: 'dis_order') final int? disOrder}) = _$AddressImpl;

  factory _Address.fromJson(Map<String, dynamic> json) = _$AddressImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  String? get house;
  @override
  @JsonKey(name: 'address_1')
  String? get address1;
  @override
  @JsonKey(name: 'address_2')
  String? get address2;
  @override
  String? get landmark;
  @override
  String? get pincode;
  @override
  String? get state;
  @override
  int? get status;
  @override
  @JsonKey(name: 'dis_order')
  int? get disOrder;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
