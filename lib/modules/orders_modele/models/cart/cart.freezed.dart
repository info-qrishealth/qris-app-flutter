// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Cart _$CartFromJson(Map<String, dynamic> json) {
  return _Cart.fromJson(json);
}

/// @nodoc
mixin _$Cart {
  List<CartTest> get cartTests => throw _privateConstructorUsedError;
  Address? get selectedAddress => throw _privateConstructorUsedError;
  TimeSlot? get timeSlot => throw _privateConstructorUsedError;
  DateTime? get collectionDate => throw _privateConstructorUsedError;
  Coupon? get appliedCoupon => throw _privateConstructorUsedError;

  /// Serializes this Cart to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Cart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartCopyWith<Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) =
      _$CartCopyWithImpl<$Res, Cart>;
  @useResult
  $Res call(
      {List<CartTest> cartTests,
      Address? selectedAddress,
      TimeSlot? timeSlot,
      DateTime? collectionDate,
      Coupon? appliedCoupon});

  $AddressCopyWith<$Res>? get selectedAddress;
  $TimeSlotCopyWith<$Res>? get timeSlot;
  $CouponCopyWith<$Res>? get appliedCoupon;
}

/// @nodoc
class _$CartCopyWithImpl<$Res, $Val extends Cart>
    implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Cart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartTests = null,
    Object? selectedAddress = freezed,
    Object? timeSlot = freezed,
    Object? collectionDate = freezed,
    Object? appliedCoupon = freezed,
  }) {
    return _then(_value.copyWith(
      cartTests: null == cartTests
          ? _value.cartTests
          : cartTests // ignore: cast_nullable_to_non_nullable
              as List<CartTest>,
      selectedAddress: freezed == selectedAddress
          ? _value.selectedAddress
          : selectedAddress // ignore: cast_nullable_to_non_nullable
              as Address?,
      timeSlot: freezed == timeSlot
          ? _value.timeSlot
          : timeSlot // ignore: cast_nullable_to_non_nullable
              as TimeSlot?,
      collectionDate: freezed == collectionDate
          ? _value.collectionDate
          : collectionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      appliedCoupon: freezed == appliedCoupon
          ? _value.appliedCoupon
          : appliedCoupon // ignore: cast_nullable_to_non_nullable
              as Coupon?,
    ) as $Val);
  }

  /// Create a copy of Cart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get selectedAddress {
    if (_value.selectedAddress == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.selectedAddress!, (value) {
      return _then(_value.copyWith(selectedAddress: value) as $Val);
    });
  }

  /// Create a copy of Cart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimeSlotCopyWith<$Res>? get timeSlot {
    if (_value.timeSlot == null) {
      return null;
    }

    return $TimeSlotCopyWith<$Res>(_value.timeSlot!, (value) {
      return _then(_value.copyWith(timeSlot: value) as $Val);
    });
  }

  /// Create a copy of Cart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CouponCopyWith<$Res>? get appliedCoupon {
    if (_value.appliedCoupon == null) {
      return null;
    }

    return $CouponCopyWith<$Res>(_value.appliedCoupon!, (value) {
      return _then(_value.copyWith(appliedCoupon: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartImplCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$$CartImplCopyWith(
          _$CartImpl value, $Res Function(_$CartImpl) then) =
      __$$CartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CartTest> cartTests,
      Address? selectedAddress,
      TimeSlot? timeSlot,
      DateTime? collectionDate,
      Coupon? appliedCoupon});

  @override
  $AddressCopyWith<$Res>? get selectedAddress;
  @override
  $TimeSlotCopyWith<$Res>? get timeSlot;
  @override
  $CouponCopyWith<$Res>? get appliedCoupon;
}

/// @nodoc
class __$$CartImplCopyWithImpl<$Res>
    extends _$CartCopyWithImpl<$Res, _$CartImpl>
    implements _$$CartImplCopyWith<$Res> {
  __$$CartImplCopyWithImpl(_$CartImpl _value, $Res Function(_$CartImpl) _then)
      : super(_value, _then);

  /// Create a copy of Cart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartTests = null,
    Object? selectedAddress = freezed,
    Object? timeSlot = freezed,
    Object? collectionDate = freezed,
    Object? appliedCoupon = freezed,
  }) {
    return _then(_$CartImpl(
      cartTests: null == cartTests
          ? _value._cartTests
          : cartTests // ignore: cast_nullable_to_non_nullable
              as List<CartTest>,
      selectedAddress: freezed == selectedAddress
          ? _value.selectedAddress
          : selectedAddress // ignore: cast_nullable_to_non_nullable
              as Address?,
      timeSlot: freezed == timeSlot
          ? _value.timeSlot
          : timeSlot // ignore: cast_nullable_to_non_nullable
              as TimeSlot?,
      collectionDate: freezed == collectionDate
          ? _value.collectionDate
          : collectionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      appliedCoupon: freezed == appliedCoupon
          ? _value.appliedCoupon
          : appliedCoupon // ignore: cast_nullable_to_non_nullable
              as Coupon?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartImpl implements _Cart {
  const _$CartImpl(
      {required final List<CartTest> cartTests,
      this.selectedAddress,
      this.timeSlot,
      this.collectionDate,
      this.appliedCoupon})
      : _cartTests = cartTests;

  factory _$CartImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartImplFromJson(json);

  final List<CartTest> _cartTests;
  @override
  List<CartTest> get cartTests {
    if (_cartTests is EqualUnmodifiableListView) return _cartTests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartTests);
  }

  @override
  final Address? selectedAddress;
  @override
  final TimeSlot? timeSlot;
  @override
  final DateTime? collectionDate;
  @override
  final Coupon? appliedCoupon;

  @override
  String toString() {
    return 'Cart(cartTests: $cartTests, selectedAddress: $selectedAddress, timeSlot: $timeSlot, collectionDate: $collectionDate, appliedCoupon: $appliedCoupon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartImpl &&
            const DeepCollectionEquality()
                .equals(other._cartTests, _cartTests) &&
            (identical(other.selectedAddress, selectedAddress) ||
                other.selectedAddress == selectedAddress) &&
            (identical(other.timeSlot, timeSlot) ||
                other.timeSlot == timeSlot) &&
            (identical(other.collectionDate, collectionDate) ||
                other.collectionDate == collectionDate) &&
            (identical(other.appliedCoupon, appliedCoupon) ||
                other.appliedCoupon == appliedCoupon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cartTests),
      selectedAddress,
      timeSlot,
      collectionDate,
      appliedCoupon);

  /// Create a copy of Cart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      __$$CartImplCopyWithImpl<_$CartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartImplToJson(
      this,
    );
  }
}

abstract class _Cart implements Cart {
  const factory _Cart(
      {required final List<CartTest> cartTests,
      final Address? selectedAddress,
      final TimeSlot? timeSlot,
      final DateTime? collectionDate,
      final Coupon? appliedCoupon}) = _$CartImpl;

  factory _Cart.fromJson(Map<String, dynamic> json) = _$CartImpl.fromJson;

  @override
  List<CartTest> get cartTests;
  @override
  Address? get selectedAddress;
  @override
  TimeSlot? get timeSlot;
  @override
  DateTime? get collectionDate;
  @override
  Coupon? get appliedCoupon;

  /// Create a copy of Cart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartTest _$CartTestFromJson(Map<String, dynamic> json) {
  return _CartTest.fromJson(json);
}

/// @nodoc
mixin _$CartTest {
  int get testId => throw _privateConstructorUsedError;
  List<int> get patientIds => throw _privateConstructorUsedError;

  /// Serializes this CartTest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartTest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartTestCopyWith<CartTest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartTestCopyWith<$Res> {
  factory $CartTestCopyWith(CartTest value, $Res Function(CartTest) then) =
      _$CartTestCopyWithImpl<$Res, CartTest>;
  @useResult
  $Res call({int testId, List<int> patientIds});
}

/// @nodoc
class _$CartTestCopyWithImpl<$Res, $Val extends CartTest>
    implements $CartTestCopyWith<$Res> {
  _$CartTestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartTest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? testId = null,
    Object? patientIds = null,
  }) {
    return _then(_value.copyWith(
      testId: null == testId
          ? _value.testId
          : testId // ignore: cast_nullable_to_non_nullable
              as int,
      patientIds: null == patientIds
          ? _value.patientIds
          : patientIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartTestImplCopyWith<$Res>
    implements $CartTestCopyWith<$Res> {
  factory _$$CartTestImplCopyWith(
          _$CartTestImpl value, $Res Function(_$CartTestImpl) then) =
      __$$CartTestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int testId, List<int> patientIds});
}

/// @nodoc
class __$$CartTestImplCopyWithImpl<$Res>
    extends _$CartTestCopyWithImpl<$Res, _$CartTestImpl>
    implements _$$CartTestImplCopyWith<$Res> {
  __$$CartTestImplCopyWithImpl(
      _$CartTestImpl _value, $Res Function(_$CartTestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartTest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? testId = null,
    Object? patientIds = null,
  }) {
    return _then(_$CartTestImpl(
      testId: null == testId
          ? _value.testId
          : testId // ignore: cast_nullable_to_non_nullable
              as int,
      patientIds: null == patientIds
          ? _value._patientIds
          : patientIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartTestImpl implements _CartTest {
  const _$CartTestImpl(
      {required this.testId, required final List<int> patientIds})
      : _patientIds = patientIds;

  factory _$CartTestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartTestImplFromJson(json);

  @override
  final int testId;
  final List<int> _patientIds;
  @override
  List<int> get patientIds {
    if (_patientIds is EqualUnmodifiableListView) return _patientIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_patientIds);
  }

  @override
  String toString() {
    return 'CartTest(testId: $testId, patientIds: $patientIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartTestImpl &&
            (identical(other.testId, testId) || other.testId == testId) &&
            const DeepCollectionEquality()
                .equals(other._patientIds, _patientIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, testId, const DeepCollectionEquality().hash(_patientIds));

  /// Create a copy of CartTest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartTestImplCopyWith<_$CartTestImpl> get copyWith =>
      __$$CartTestImplCopyWithImpl<_$CartTestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartTestImplToJson(
      this,
    );
  }
}

abstract class _CartTest implements CartTest {
  const factory _CartTest(
      {required final int testId,
      required final List<int> patientIds}) = _$CartTestImpl;

  factory _CartTest.fromJson(Map<String, dynamic> json) =
      _$CartTestImpl.fromJson;

  @override
  int get testId;
  @override
  List<int> get patientIds;

  /// Create a copy of CartTest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartTestImplCopyWith<_$CartTestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
