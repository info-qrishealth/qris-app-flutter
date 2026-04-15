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
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'items')
  List<CartItem> get cartTests => throw _privateConstructorUsedError;
  DateTime? get collectionDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'hardCopy')
  bool? get shouldGetHardCopy => throw _privateConstructorUsedError;
  bool? get redeemCoins => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  Address? get selectedAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'slot')
  TimeSlot? get timeSlot => throw _privateConstructorUsedError;
  @JsonKey(name: 'coupon')
  Coupon? get appliedCoupon => throw _privateConstructorUsedError;
  int? get cartTestPrices => throw _privateConstructorUsedError;
  int? get baseCartValue => throw _privateConstructorUsedError;
  int? get deliveryCharge => throw _privateConstructorUsedError;
  int? get hardCopyCharges => throw _privateConstructorUsedError;
  int? get cartFinalValue => throw _privateConstructorUsedError;
  int? get walletRedeemedAmount => throw _privateConstructorUsedError;
  int? get appliedCouponAmount => throw _privateConstructorUsedError;
  int? get redeemedQrisCoins => throw _privateConstructorUsedError;
  String? get sampleType => throw _privateConstructorUsedError;
  String? get tubeType => throw _privateConstructorUsedError;
  int? get totalCartValue => throw _privateConstructorUsedError;
  int? get collectionCharge => throw _privateConstructorUsedError;
  int? get availableWalletBalance => throw _privateConstructorUsedError;
  int? get availableQrisCoins => throw _privateConstructorUsedError;

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
      {int? userId,
      @JsonKey(name: 'items') List<CartItem> cartTests,
      DateTime? collectionDate,
      @JsonKey(name: 'hardCopy') bool? shouldGetHardCopy,
      bool? redeemCoins,
      @JsonKey(name: 'address') Address? selectedAddress,
      @JsonKey(name: 'slot') TimeSlot? timeSlot,
      @JsonKey(name: 'coupon') Coupon? appliedCoupon,
      int? cartTestPrices,
      int? baseCartValue,
      int? deliveryCharge,
      int? hardCopyCharges,
      int? cartFinalValue,
      int? walletRedeemedAmount,
      int? appliedCouponAmount,
      int? redeemedQrisCoins,
      String? sampleType,
      String? tubeType,
      int? totalCartValue,
      int? collectionCharge,
      int? availableWalletBalance,
      int? availableQrisCoins});

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
    Object? userId = freezed,
    Object? cartTests = null,
    Object? collectionDate = freezed,
    Object? shouldGetHardCopy = freezed,
    Object? redeemCoins = freezed,
    Object? selectedAddress = freezed,
    Object? timeSlot = freezed,
    Object? appliedCoupon = freezed,
    Object? cartTestPrices = freezed,
    Object? baseCartValue = freezed,
    Object? deliveryCharge = freezed,
    Object? hardCopyCharges = freezed,
    Object? cartFinalValue = freezed,
    Object? walletRedeemedAmount = freezed,
    Object? appliedCouponAmount = freezed,
    Object? redeemedQrisCoins = freezed,
    Object? sampleType = freezed,
    Object? tubeType = freezed,
    Object? totalCartValue = freezed,
    Object? collectionCharge = freezed,
    Object? availableWalletBalance = freezed,
    Object? availableQrisCoins = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      cartTests: null == cartTests
          ? _value.cartTests
          : cartTests // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      collectionDate: freezed == collectionDate
          ? _value.collectionDate
          : collectionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shouldGetHardCopy: freezed == shouldGetHardCopy
          ? _value.shouldGetHardCopy
          : shouldGetHardCopy // ignore: cast_nullable_to_non_nullable
              as bool?,
      redeemCoins: freezed == redeemCoins
          ? _value.redeemCoins
          : redeemCoins // ignore: cast_nullable_to_non_nullable
              as bool?,
      selectedAddress: freezed == selectedAddress
          ? _value.selectedAddress
          : selectedAddress // ignore: cast_nullable_to_non_nullable
              as Address?,
      timeSlot: freezed == timeSlot
          ? _value.timeSlot
          : timeSlot // ignore: cast_nullable_to_non_nullable
              as TimeSlot?,
      appliedCoupon: freezed == appliedCoupon
          ? _value.appliedCoupon
          : appliedCoupon // ignore: cast_nullable_to_non_nullable
              as Coupon?,
      cartTestPrices: freezed == cartTestPrices
          ? _value.cartTestPrices
          : cartTestPrices // ignore: cast_nullable_to_non_nullable
              as int?,
      baseCartValue: freezed == baseCartValue
          ? _value.baseCartValue
          : baseCartValue // ignore: cast_nullable_to_non_nullable
              as int?,
      deliveryCharge: freezed == deliveryCharge
          ? _value.deliveryCharge
          : deliveryCharge // ignore: cast_nullable_to_non_nullable
              as int?,
      hardCopyCharges: freezed == hardCopyCharges
          ? _value.hardCopyCharges
          : hardCopyCharges // ignore: cast_nullable_to_non_nullable
              as int?,
      cartFinalValue: freezed == cartFinalValue
          ? _value.cartFinalValue
          : cartFinalValue // ignore: cast_nullable_to_non_nullable
              as int?,
      walletRedeemedAmount: freezed == walletRedeemedAmount
          ? _value.walletRedeemedAmount
          : walletRedeemedAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      appliedCouponAmount: freezed == appliedCouponAmount
          ? _value.appliedCouponAmount
          : appliedCouponAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      redeemedQrisCoins: freezed == redeemedQrisCoins
          ? _value.redeemedQrisCoins
          : redeemedQrisCoins // ignore: cast_nullable_to_non_nullable
              as int?,
      sampleType: freezed == sampleType
          ? _value.sampleType
          : sampleType // ignore: cast_nullable_to_non_nullable
              as String?,
      tubeType: freezed == tubeType
          ? _value.tubeType
          : tubeType // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCartValue: freezed == totalCartValue
          ? _value.totalCartValue
          : totalCartValue // ignore: cast_nullable_to_non_nullable
              as int?,
      collectionCharge: freezed == collectionCharge
          ? _value.collectionCharge
          : collectionCharge // ignore: cast_nullable_to_non_nullable
              as int?,
      availableWalletBalance: freezed == availableWalletBalance
          ? _value.availableWalletBalance
          : availableWalletBalance // ignore: cast_nullable_to_non_nullable
              as int?,
      availableQrisCoins: freezed == availableQrisCoins
          ? _value.availableQrisCoins
          : availableQrisCoins // ignore: cast_nullable_to_non_nullable
              as int?,
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
      {int? userId,
      @JsonKey(name: 'items') List<CartItem> cartTests,
      DateTime? collectionDate,
      @JsonKey(name: 'hardCopy') bool? shouldGetHardCopy,
      bool? redeemCoins,
      @JsonKey(name: 'address') Address? selectedAddress,
      @JsonKey(name: 'slot') TimeSlot? timeSlot,
      @JsonKey(name: 'coupon') Coupon? appliedCoupon,
      int? cartTestPrices,
      int? baseCartValue,
      int? deliveryCharge,
      int? hardCopyCharges,
      int? cartFinalValue,
      int? walletRedeemedAmount,
      int? appliedCouponAmount,
      int? redeemedQrisCoins,
      String? sampleType,
      String? tubeType,
      int? totalCartValue,
      int? collectionCharge,
      int? availableWalletBalance,
      int? availableQrisCoins});

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
    Object? userId = freezed,
    Object? cartTests = null,
    Object? collectionDate = freezed,
    Object? shouldGetHardCopy = freezed,
    Object? redeemCoins = freezed,
    Object? selectedAddress = freezed,
    Object? timeSlot = freezed,
    Object? appliedCoupon = freezed,
    Object? cartTestPrices = freezed,
    Object? baseCartValue = freezed,
    Object? deliveryCharge = freezed,
    Object? hardCopyCharges = freezed,
    Object? cartFinalValue = freezed,
    Object? walletRedeemedAmount = freezed,
    Object? appliedCouponAmount = freezed,
    Object? redeemedQrisCoins = freezed,
    Object? sampleType = freezed,
    Object? tubeType = freezed,
    Object? totalCartValue = freezed,
    Object? collectionCharge = freezed,
    Object? availableWalletBalance = freezed,
    Object? availableQrisCoins = freezed,
  }) {
    return _then(_$CartImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      cartTests: null == cartTests
          ? _value.cartTests
          : cartTests // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      collectionDate: freezed == collectionDate
          ? _value.collectionDate
          : collectionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shouldGetHardCopy: freezed == shouldGetHardCopy
          ? _value.shouldGetHardCopy
          : shouldGetHardCopy // ignore: cast_nullable_to_non_nullable
              as bool?,
      redeemCoins: freezed == redeemCoins
          ? _value.redeemCoins
          : redeemCoins // ignore: cast_nullable_to_non_nullable
              as bool?,
      selectedAddress: freezed == selectedAddress
          ? _value.selectedAddress
          : selectedAddress // ignore: cast_nullable_to_non_nullable
              as Address?,
      timeSlot: freezed == timeSlot
          ? _value.timeSlot
          : timeSlot // ignore: cast_nullable_to_non_nullable
              as TimeSlot?,
      appliedCoupon: freezed == appliedCoupon
          ? _value.appliedCoupon
          : appliedCoupon // ignore: cast_nullable_to_non_nullable
              as Coupon?,
      cartTestPrices: freezed == cartTestPrices
          ? _value.cartTestPrices
          : cartTestPrices // ignore: cast_nullable_to_non_nullable
              as int?,
      baseCartValue: freezed == baseCartValue
          ? _value.baseCartValue
          : baseCartValue // ignore: cast_nullable_to_non_nullable
              as int?,
      deliveryCharge: freezed == deliveryCharge
          ? _value.deliveryCharge
          : deliveryCharge // ignore: cast_nullable_to_non_nullable
              as int?,
      hardCopyCharges: freezed == hardCopyCharges
          ? _value.hardCopyCharges
          : hardCopyCharges // ignore: cast_nullable_to_non_nullable
              as int?,
      cartFinalValue: freezed == cartFinalValue
          ? _value.cartFinalValue
          : cartFinalValue // ignore: cast_nullable_to_non_nullable
              as int?,
      walletRedeemedAmount: freezed == walletRedeemedAmount
          ? _value.walletRedeemedAmount
          : walletRedeemedAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      appliedCouponAmount: freezed == appliedCouponAmount
          ? _value.appliedCouponAmount
          : appliedCouponAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      redeemedQrisCoins: freezed == redeemedQrisCoins
          ? _value.redeemedQrisCoins
          : redeemedQrisCoins // ignore: cast_nullable_to_non_nullable
              as int?,
      sampleType: freezed == sampleType
          ? _value.sampleType
          : sampleType // ignore: cast_nullable_to_non_nullable
              as String?,
      tubeType: freezed == tubeType
          ? _value.tubeType
          : tubeType // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCartValue: freezed == totalCartValue
          ? _value.totalCartValue
          : totalCartValue // ignore: cast_nullable_to_non_nullable
              as int?,
      collectionCharge: freezed == collectionCharge
          ? _value.collectionCharge
          : collectionCharge // ignore: cast_nullable_to_non_nullable
              as int?,
      availableWalletBalance: freezed == availableWalletBalance
          ? _value.availableWalletBalance
          : availableWalletBalance // ignore: cast_nullable_to_non_nullable
              as int?,
      availableQrisCoins: freezed == availableQrisCoins
          ? _value.availableQrisCoins
          : availableQrisCoins // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartImpl implements _Cart {
  const _$CartImpl(
      {this.userId,
      @JsonKey(name: 'items') this.cartTests = const [],
      this.collectionDate,
      @JsonKey(name: 'hardCopy') this.shouldGetHardCopy,
      this.redeemCoins,
      @JsonKey(name: 'address') this.selectedAddress,
      @JsonKey(name: 'slot') this.timeSlot,
      @JsonKey(name: 'coupon') this.appliedCoupon,
      this.cartTestPrices,
      this.baseCartValue,
      this.deliveryCharge,
      this.hardCopyCharges,
      this.cartFinalValue,
      this.walletRedeemedAmount,
      this.appliedCouponAmount,
      this.redeemedQrisCoins,
      this.sampleType,
      this.tubeType,
      this.totalCartValue,
      this.collectionCharge,
      this.availableWalletBalance,
      this.availableQrisCoins});

  factory _$CartImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartImplFromJson(json);

  @override
  final int? userId;
  @override
  @JsonKey(name: 'items')
  final List<CartItem> cartTests;
  @override
  final DateTime? collectionDate;
  @override
  @JsonKey(name: 'hardCopy')
  final bool? shouldGetHardCopy;
  @override
  final bool? redeemCoins;
  @override
  @JsonKey(name: 'address')
  final Address? selectedAddress;
  @override
  @JsonKey(name: 'slot')
  final TimeSlot? timeSlot;
  @override
  @JsonKey(name: 'coupon')
  final Coupon? appliedCoupon;
  @override
  final int? cartTestPrices;
  @override
  final int? baseCartValue;
  @override
  final int? deliveryCharge;
  @override
  final int? hardCopyCharges;
  @override
  final int? cartFinalValue;
  @override
  final int? walletRedeemedAmount;
  @override
  final int? appliedCouponAmount;
  @override
  final int? redeemedQrisCoins;
  @override
  final String? sampleType;
  @override
  final String? tubeType;
  @override
  final int? totalCartValue;
  @override
  final int? collectionCharge;
  @override
  final int? availableWalletBalance;
  @override
  final int? availableQrisCoins;

  @override
  String toString() {
    return 'Cart(userId: $userId, cartTests: $cartTests, collectionDate: $collectionDate, shouldGetHardCopy: $shouldGetHardCopy, redeemCoins: $redeemCoins, selectedAddress: $selectedAddress, timeSlot: $timeSlot, appliedCoupon: $appliedCoupon, cartTestPrices: $cartTestPrices, baseCartValue: $baseCartValue, deliveryCharge: $deliveryCharge, hardCopyCharges: $hardCopyCharges, cartFinalValue: $cartFinalValue, walletRedeemedAmount: $walletRedeemedAmount, appliedCouponAmount: $appliedCouponAmount, redeemedQrisCoins: $redeemedQrisCoins, sampleType: $sampleType, tubeType: $tubeType, totalCartValue: $totalCartValue, collectionCharge: $collectionCharge, availableWalletBalance: $availableWalletBalance, availableQrisCoins: $availableQrisCoins)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other.cartTests, cartTests) &&
            (identical(other.collectionDate, collectionDate) ||
                other.collectionDate == collectionDate) &&
            (identical(other.shouldGetHardCopy, shouldGetHardCopy) ||
                other.shouldGetHardCopy == shouldGetHardCopy) &&
            (identical(other.redeemCoins, redeemCoins) ||
                other.redeemCoins == redeemCoins) &&
            (identical(other.selectedAddress, selectedAddress) ||
                other.selectedAddress == selectedAddress) &&
            (identical(other.timeSlot, timeSlot) ||
                other.timeSlot == timeSlot) &&
            (identical(other.appliedCoupon, appliedCoupon) ||
                other.appliedCoupon == appliedCoupon) &&
            (identical(other.cartTestPrices, cartTestPrices) ||
                other.cartTestPrices == cartTestPrices) &&
            (identical(other.baseCartValue, baseCartValue) ||
                other.baseCartValue == baseCartValue) &&
            (identical(other.deliveryCharge, deliveryCharge) ||
                other.deliveryCharge == deliveryCharge) &&
            (identical(other.hardCopyCharges, hardCopyCharges) ||
                other.hardCopyCharges == hardCopyCharges) &&
            (identical(other.cartFinalValue, cartFinalValue) ||
                other.cartFinalValue == cartFinalValue) &&
            (identical(other.walletRedeemedAmount, walletRedeemedAmount) ||
                other.walletRedeemedAmount == walletRedeemedAmount) &&
            (identical(other.appliedCouponAmount, appliedCouponAmount) ||
                other.appliedCouponAmount == appliedCouponAmount) &&
            (identical(other.redeemedQrisCoins, redeemedQrisCoins) ||
                other.redeemedQrisCoins == redeemedQrisCoins) &&
            (identical(other.sampleType, sampleType) ||
                other.sampleType == sampleType) &&
            (identical(other.tubeType, tubeType) ||
                other.tubeType == tubeType) &&
            (identical(other.totalCartValue, totalCartValue) ||
                other.totalCartValue == totalCartValue) &&
            (identical(other.collectionCharge, collectionCharge) ||
                other.collectionCharge == collectionCharge) &&
            (identical(other.availableWalletBalance, availableWalletBalance) ||
                other.availableWalletBalance == availableWalletBalance) &&
            (identical(other.availableQrisCoins, availableQrisCoins) ||
                other.availableQrisCoins == availableQrisCoins));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        userId,
        const DeepCollectionEquality().hash(cartTests),
        collectionDate,
        shouldGetHardCopy,
        redeemCoins,
        selectedAddress,
        timeSlot,
        appliedCoupon,
        cartTestPrices,
        baseCartValue,
        deliveryCharge,
        hardCopyCharges,
        cartFinalValue,
        walletRedeemedAmount,
        appliedCouponAmount,
        redeemedQrisCoins,
        sampleType,
        tubeType,
        totalCartValue,
        collectionCharge,
        availableWalletBalance,
        availableQrisCoins
      ]);

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
      {final int? userId,
      @JsonKey(name: 'items') final List<CartItem> cartTests,
      final DateTime? collectionDate,
      @JsonKey(name: 'hardCopy') final bool? shouldGetHardCopy,
      final bool? redeemCoins,
      @JsonKey(name: 'address') final Address? selectedAddress,
      @JsonKey(name: 'slot') final TimeSlot? timeSlot,
      @JsonKey(name: 'coupon') final Coupon? appliedCoupon,
      final int? cartTestPrices,
      final int? baseCartValue,
      final int? deliveryCharge,
      final int? hardCopyCharges,
      final int? cartFinalValue,
      final int? walletRedeemedAmount,
      final int? appliedCouponAmount,
      final int? redeemedQrisCoins,
      final String? sampleType,
      final String? tubeType,
      final int? totalCartValue,
      final int? collectionCharge,
      final int? availableWalletBalance,
      final int? availableQrisCoins}) = _$CartImpl;

  factory _Cart.fromJson(Map<String, dynamic> json) = _$CartImpl.fromJson;

  @override
  int? get userId;
  @override
  @JsonKey(name: 'items')
  List<CartItem> get cartTests;
  @override
  DateTime? get collectionDate;
  @override
  @JsonKey(name: 'hardCopy')
  bool? get shouldGetHardCopy;
  @override
  bool? get redeemCoins;
  @override
  @JsonKey(name: 'address')
  Address? get selectedAddress;
  @override
  @JsonKey(name: 'slot')
  TimeSlot? get timeSlot;
  @override
  @JsonKey(name: 'coupon')
  Coupon? get appliedCoupon;
  @override
  int? get cartTestPrices;
  @override
  int? get baseCartValue;
  @override
  int? get deliveryCharge;
  @override
  int? get hardCopyCharges;
  @override
  int? get cartFinalValue;
  @override
  int? get walletRedeemedAmount;
  @override
  int? get appliedCouponAmount;
  @override
  int? get redeemedQrisCoins;
  @override
  String? get sampleType;
  @override
  String? get tubeType;
  @override
  int? get totalCartValue;
  @override
  int? get collectionCharge;
  @override
  int? get availableWalletBalance;
  @override
  int? get availableQrisCoins;

  /// Create a copy of Cart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return _CartItem.fromJson(json);
}

/// @nodoc
mixin _$CartItem {
  int? get testId => throw _privateConstructorUsedError;
  List<int> get patientIds => throw _privateConstructorUsedError;
  TestPackageModel? get test => throw _privateConstructorUsedError;
  List<Patient> get patients => throw _privateConstructorUsedError;

  /// Serializes this CartItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartItemCopyWith<CartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemCopyWith<$Res> {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) then) =
      _$CartItemCopyWithImpl<$Res, CartItem>;
  @useResult
  $Res call(
      {int? testId,
      List<int> patientIds,
      TestPackageModel? test,
      List<Patient> patients});

  $TestPackageModelCopyWith<$Res>? get test;
}

/// @nodoc
class _$CartItemCopyWithImpl<$Res, $Val extends CartItem>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? testId = freezed,
    Object? patientIds = null,
    Object? test = freezed,
    Object? patients = null,
  }) {
    return _then(_value.copyWith(
      testId: freezed == testId
          ? _value.testId
          : testId // ignore: cast_nullable_to_non_nullable
              as int?,
      patientIds: null == patientIds
          ? _value.patientIds
          : patientIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      test: freezed == test
          ? _value.test
          : test // ignore: cast_nullable_to_non_nullable
              as TestPackageModel?,
      patients: null == patients
          ? _value.patients
          : patients // ignore: cast_nullable_to_non_nullable
              as List<Patient>,
    ) as $Val);
  }

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TestPackageModelCopyWith<$Res>? get test {
    if (_value.test == null) {
      return null;
    }

    return $TestPackageModelCopyWith<$Res>(_value.test!, (value) {
      return _then(_value.copyWith(test: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartItemImplCopyWith<$Res>
    implements $CartItemCopyWith<$Res> {
  factory _$$CartItemImplCopyWith(
          _$CartItemImpl value, $Res Function(_$CartItemImpl) then) =
      __$$CartItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? testId,
      List<int> patientIds,
      TestPackageModel? test,
      List<Patient> patients});

  @override
  $TestPackageModelCopyWith<$Res>? get test;
}

/// @nodoc
class __$$CartItemImplCopyWithImpl<$Res>
    extends _$CartItemCopyWithImpl<$Res, _$CartItemImpl>
    implements _$$CartItemImplCopyWith<$Res> {
  __$$CartItemImplCopyWithImpl(
      _$CartItemImpl _value, $Res Function(_$CartItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? testId = freezed,
    Object? patientIds = null,
    Object? test = freezed,
    Object? patients = null,
  }) {
    return _then(_$CartItemImpl(
      testId: freezed == testId
          ? _value.testId
          : testId // ignore: cast_nullable_to_non_nullable
              as int?,
      patientIds: null == patientIds
          ? _value._patientIds
          : patientIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      test: freezed == test
          ? _value.test
          : test // ignore: cast_nullable_to_non_nullable
              as TestPackageModel?,
      patients: null == patients
          ? _value._patients
          : patients // ignore: cast_nullable_to_non_nullable
              as List<Patient>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartItemImpl implements _CartItem {
  const _$CartItemImpl(
      {this.testId,
      final List<int> patientIds = const [],
      this.test,
      final List<Patient> patients = const []})
      : _patientIds = patientIds,
        _patients = patients;

  factory _$CartItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemImplFromJson(json);

  @override
  final int? testId;
  final List<int> _patientIds;
  @override
  @JsonKey()
  List<int> get patientIds {
    if (_patientIds is EqualUnmodifiableListView) return _patientIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_patientIds);
  }

  @override
  final TestPackageModel? test;
  final List<Patient> _patients;
  @override
  @JsonKey()
  List<Patient> get patients {
    if (_patients is EqualUnmodifiableListView) return _patients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_patients);
  }

  @override
  String toString() {
    return 'CartItem(testId: $testId, patientIds: $patientIds, test: $test, patients: $patients)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemImpl &&
            (identical(other.testId, testId) || other.testId == testId) &&
            const DeepCollectionEquality()
                .equals(other._patientIds, _patientIds) &&
            (identical(other.test, test) || other.test == test) &&
            const DeepCollectionEquality().equals(other._patients, _patients));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      testId,
      const DeepCollectionEquality().hash(_patientIds),
      test,
      const DeepCollectionEquality().hash(_patients));

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      __$$CartItemImplCopyWithImpl<_$CartItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemImplToJson(
      this,
    );
  }
}

abstract class _CartItem implements CartItem {
  const factory _CartItem(
      {final int? testId,
      final List<int> patientIds,
      final TestPackageModel? test,
      final List<Patient> patients}) = _$CartItemImpl;

  factory _CartItem.fromJson(Map<String, dynamic> json) =
      _$CartItemImpl.fromJson;

  @override
  int? get testId;
  @override
  List<int> get patientIds;
  @override
  TestPackageModel? get test;
  @override
  List<Patient> get patients;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
