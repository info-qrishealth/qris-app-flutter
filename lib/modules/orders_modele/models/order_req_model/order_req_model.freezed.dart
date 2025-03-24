// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_req_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderReqModel _$OrderReqModelFromJson(Map<String, dynamic> json) {
  return _OrderReqModel.fromJson(json);
}

/// @nodoc
mixin _$OrderReqModel {
  int get userId => throw _privateConstructorUsedError;
  int get packagesAmount => throw _privateConstructorUsedError;
  int get collectionCharges => throw _privateConstructorUsedError;
  int get cartFinalValue => throw _privateConstructorUsedError;
  PaymentMode get paymentMode => throw _privateConstructorUsedError;
  String? get razorpayPaymentId => throw _privateConstructorUsedError;
  Coupon? get coupon => throw _privateConstructorUsedError;
  int get redeemedWalletAmount => throw _privateConstructorUsedError;
  int get redeemedQrisCoins => throw _privateConstructorUsedError;
  String? get paymentResponse => throw _privateConstructorUsedError;
  double get appliedCouponAmount => throw _privateConstructorUsedError;
  String get encodedProductData => throw _privateConstructorUsedError;
  String get slotDate => throw _privateConstructorUsedError;
  String get slotTime => throw _privateConstructorUsedError;
  String get pincode => throw _privateConstructorUsedError;
  String get encodedAddress => throw _privateConstructorUsedError;
  String? get encodedCouponData => throw _privateConstructorUsedError;
  String? get sampleType => throw _privateConstructorUsedError;
  String get hardCopyCharges => throw _privateConstructorUsedError;
  String? get referBy => throw _privateConstructorUsedError;

  /// Serializes this OrderReqModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderReqModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderReqModelCopyWith<OrderReqModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderReqModelCopyWith<$Res> {
  factory $OrderReqModelCopyWith(
          OrderReqModel value, $Res Function(OrderReqModel) then) =
      _$OrderReqModelCopyWithImpl<$Res, OrderReqModel>;
  @useResult
  $Res call(
      {int userId,
      int packagesAmount,
      int collectionCharges,
      int cartFinalValue,
      PaymentMode paymentMode,
      String? razorpayPaymentId,
      Coupon? coupon,
      int redeemedWalletAmount,
      int redeemedQrisCoins,
      String? paymentResponse,
      double appliedCouponAmount,
      String encodedProductData,
      String slotDate,
      String slotTime,
      String pincode,
      String encodedAddress,
      String? encodedCouponData,
      String? sampleType,
      String hardCopyCharges,
      String? referBy});

  $CouponCopyWith<$Res>? get coupon;
}

/// @nodoc
class _$OrderReqModelCopyWithImpl<$Res, $Val extends OrderReqModel>
    implements $OrderReqModelCopyWith<$Res> {
  _$OrderReqModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderReqModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? packagesAmount = null,
    Object? collectionCharges = null,
    Object? cartFinalValue = null,
    Object? paymentMode = null,
    Object? razorpayPaymentId = freezed,
    Object? coupon = freezed,
    Object? redeemedWalletAmount = null,
    Object? redeemedQrisCoins = null,
    Object? paymentResponse = freezed,
    Object? appliedCouponAmount = null,
    Object? encodedProductData = null,
    Object? slotDate = null,
    Object? slotTime = null,
    Object? pincode = null,
    Object? encodedAddress = null,
    Object? encodedCouponData = freezed,
    Object? sampleType = freezed,
    Object? hardCopyCharges = null,
    Object? referBy = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      packagesAmount: null == packagesAmount
          ? _value.packagesAmount
          : packagesAmount // ignore: cast_nullable_to_non_nullable
              as int,
      collectionCharges: null == collectionCharges
          ? _value.collectionCharges
          : collectionCharges // ignore: cast_nullable_to_non_nullable
              as int,
      cartFinalValue: null == cartFinalValue
          ? _value.cartFinalValue
          : cartFinalValue // ignore: cast_nullable_to_non_nullable
              as int,
      paymentMode: null == paymentMode
          ? _value.paymentMode
          : paymentMode // ignore: cast_nullable_to_non_nullable
              as PaymentMode,
      razorpayPaymentId: freezed == razorpayPaymentId
          ? _value.razorpayPaymentId
          : razorpayPaymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      coupon: freezed == coupon
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as Coupon?,
      redeemedWalletAmount: null == redeemedWalletAmount
          ? _value.redeemedWalletAmount
          : redeemedWalletAmount // ignore: cast_nullable_to_non_nullable
              as int,
      redeemedQrisCoins: null == redeemedQrisCoins
          ? _value.redeemedQrisCoins
          : redeemedQrisCoins // ignore: cast_nullable_to_non_nullable
              as int,
      paymentResponse: freezed == paymentResponse
          ? _value.paymentResponse
          : paymentResponse // ignore: cast_nullable_to_non_nullable
              as String?,
      appliedCouponAmount: null == appliedCouponAmount
          ? _value.appliedCouponAmount
          : appliedCouponAmount // ignore: cast_nullable_to_non_nullable
              as double,
      encodedProductData: null == encodedProductData
          ? _value.encodedProductData
          : encodedProductData // ignore: cast_nullable_to_non_nullable
              as String,
      slotDate: null == slotDate
          ? _value.slotDate
          : slotDate // ignore: cast_nullable_to_non_nullable
              as String,
      slotTime: null == slotTime
          ? _value.slotTime
          : slotTime // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String,
      encodedAddress: null == encodedAddress
          ? _value.encodedAddress
          : encodedAddress // ignore: cast_nullable_to_non_nullable
              as String,
      encodedCouponData: freezed == encodedCouponData
          ? _value.encodedCouponData
          : encodedCouponData // ignore: cast_nullable_to_non_nullable
              as String?,
      sampleType: freezed == sampleType
          ? _value.sampleType
          : sampleType // ignore: cast_nullable_to_non_nullable
              as String?,
      hardCopyCharges: null == hardCopyCharges
          ? _value.hardCopyCharges
          : hardCopyCharges // ignore: cast_nullable_to_non_nullable
              as String,
      referBy: freezed == referBy
          ? _value.referBy
          : referBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of OrderReqModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CouponCopyWith<$Res>? get coupon {
    if (_value.coupon == null) {
      return null;
    }

    return $CouponCopyWith<$Res>(_value.coupon!, (value) {
      return _then(_value.copyWith(coupon: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderReqModelImplCopyWith<$Res>
    implements $OrderReqModelCopyWith<$Res> {
  factory _$$OrderReqModelImplCopyWith(
          _$OrderReqModelImpl value, $Res Function(_$OrderReqModelImpl) then) =
      __$$OrderReqModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int userId,
      int packagesAmount,
      int collectionCharges,
      int cartFinalValue,
      PaymentMode paymentMode,
      String? razorpayPaymentId,
      Coupon? coupon,
      int redeemedWalletAmount,
      int redeemedQrisCoins,
      String? paymentResponse,
      double appliedCouponAmount,
      String encodedProductData,
      String slotDate,
      String slotTime,
      String pincode,
      String encodedAddress,
      String? encodedCouponData,
      String? sampleType,
      String hardCopyCharges,
      String? referBy});

  @override
  $CouponCopyWith<$Res>? get coupon;
}

/// @nodoc
class __$$OrderReqModelImplCopyWithImpl<$Res>
    extends _$OrderReqModelCopyWithImpl<$Res, _$OrderReqModelImpl>
    implements _$$OrderReqModelImplCopyWith<$Res> {
  __$$OrderReqModelImplCopyWithImpl(
      _$OrderReqModelImpl _value, $Res Function(_$OrderReqModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderReqModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? packagesAmount = null,
    Object? collectionCharges = null,
    Object? cartFinalValue = null,
    Object? paymentMode = null,
    Object? razorpayPaymentId = freezed,
    Object? coupon = freezed,
    Object? redeemedWalletAmount = null,
    Object? redeemedQrisCoins = null,
    Object? paymentResponse = freezed,
    Object? appliedCouponAmount = null,
    Object? encodedProductData = null,
    Object? slotDate = null,
    Object? slotTime = null,
    Object? pincode = null,
    Object? encodedAddress = null,
    Object? encodedCouponData = freezed,
    Object? sampleType = freezed,
    Object? hardCopyCharges = null,
    Object? referBy = freezed,
  }) {
    return _then(_$OrderReqModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      packagesAmount: null == packagesAmount
          ? _value.packagesAmount
          : packagesAmount // ignore: cast_nullable_to_non_nullable
              as int,
      collectionCharges: null == collectionCharges
          ? _value.collectionCharges
          : collectionCharges // ignore: cast_nullable_to_non_nullable
              as int,
      cartFinalValue: null == cartFinalValue
          ? _value.cartFinalValue
          : cartFinalValue // ignore: cast_nullable_to_non_nullable
              as int,
      paymentMode: null == paymentMode
          ? _value.paymentMode
          : paymentMode // ignore: cast_nullable_to_non_nullable
              as PaymentMode,
      razorpayPaymentId: freezed == razorpayPaymentId
          ? _value.razorpayPaymentId
          : razorpayPaymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      coupon: freezed == coupon
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as Coupon?,
      redeemedWalletAmount: null == redeemedWalletAmount
          ? _value.redeemedWalletAmount
          : redeemedWalletAmount // ignore: cast_nullable_to_non_nullable
              as int,
      redeemedQrisCoins: null == redeemedQrisCoins
          ? _value.redeemedQrisCoins
          : redeemedQrisCoins // ignore: cast_nullable_to_non_nullable
              as int,
      paymentResponse: freezed == paymentResponse
          ? _value.paymentResponse
          : paymentResponse // ignore: cast_nullable_to_non_nullable
              as String?,
      appliedCouponAmount: null == appliedCouponAmount
          ? _value.appliedCouponAmount
          : appliedCouponAmount // ignore: cast_nullable_to_non_nullable
              as double,
      encodedProductData: null == encodedProductData
          ? _value.encodedProductData
          : encodedProductData // ignore: cast_nullable_to_non_nullable
              as String,
      slotDate: null == slotDate
          ? _value.slotDate
          : slotDate // ignore: cast_nullable_to_non_nullable
              as String,
      slotTime: null == slotTime
          ? _value.slotTime
          : slotTime // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String,
      encodedAddress: null == encodedAddress
          ? _value.encodedAddress
          : encodedAddress // ignore: cast_nullable_to_non_nullable
              as String,
      encodedCouponData: freezed == encodedCouponData
          ? _value.encodedCouponData
          : encodedCouponData // ignore: cast_nullable_to_non_nullable
              as String?,
      sampleType: freezed == sampleType
          ? _value.sampleType
          : sampleType // ignore: cast_nullable_to_non_nullable
              as String?,
      hardCopyCharges: null == hardCopyCharges
          ? _value.hardCopyCharges
          : hardCopyCharges // ignore: cast_nullable_to_non_nullable
              as String,
      referBy: freezed == referBy
          ? _value.referBy
          : referBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderReqModelImpl implements _OrderReqModel {
  const _$OrderReqModelImpl(
      {required this.userId,
      this.packagesAmount = 0,
      this.collectionCharges = 0,
      this.cartFinalValue = 0,
      required this.paymentMode,
      this.razorpayPaymentId,
      this.coupon,
      this.redeemedWalletAmount = 0,
      this.redeemedQrisCoins = 0,
      this.paymentResponse,
      required this.appliedCouponAmount,
      required this.encodedProductData,
      required this.slotDate,
      required this.slotTime,
      required this.pincode,
      required this.encodedAddress,
      this.encodedCouponData,
      this.sampleType,
      this.hardCopyCharges = '0',
      this.referBy});

  factory _$OrderReqModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderReqModelImplFromJson(json);

  @override
  final int userId;
  @override
  @JsonKey()
  final int packagesAmount;
  @override
  @JsonKey()
  final int collectionCharges;
  @override
  @JsonKey()
  final int cartFinalValue;
  @override
  final PaymentMode paymentMode;
  @override
  final String? razorpayPaymentId;
  @override
  final Coupon? coupon;
  @override
  @JsonKey()
  final int redeemedWalletAmount;
  @override
  @JsonKey()
  final int redeemedQrisCoins;
  @override
  final String? paymentResponse;
  @override
  final double appliedCouponAmount;
  @override
  final String encodedProductData;
  @override
  final String slotDate;
  @override
  final String slotTime;
  @override
  final String pincode;
  @override
  final String encodedAddress;
  @override
  final String? encodedCouponData;
  @override
  final String? sampleType;
  @override
  @JsonKey()
  final String hardCopyCharges;
  @override
  final String? referBy;

  @override
  String toString() {
    return 'OrderReqModel(userId: $userId, packagesAmount: $packagesAmount, collectionCharges: $collectionCharges, cartFinalValue: $cartFinalValue, paymentMode: $paymentMode, razorpayPaymentId: $razorpayPaymentId, coupon: $coupon, redeemedWalletAmount: $redeemedWalletAmount, redeemedQrisCoins: $redeemedQrisCoins, paymentResponse: $paymentResponse, appliedCouponAmount: $appliedCouponAmount, encodedProductData: $encodedProductData, slotDate: $slotDate, slotTime: $slotTime, pincode: $pincode, encodedAddress: $encodedAddress, encodedCouponData: $encodedCouponData, sampleType: $sampleType, hardCopyCharges: $hardCopyCharges, referBy: $referBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderReqModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.packagesAmount, packagesAmount) ||
                other.packagesAmount == packagesAmount) &&
            (identical(other.collectionCharges, collectionCharges) ||
                other.collectionCharges == collectionCharges) &&
            (identical(other.cartFinalValue, cartFinalValue) ||
                other.cartFinalValue == cartFinalValue) &&
            (identical(other.paymentMode, paymentMode) ||
                other.paymentMode == paymentMode) &&
            (identical(other.razorpayPaymentId, razorpayPaymentId) ||
                other.razorpayPaymentId == razorpayPaymentId) &&
            (identical(other.coupon, coupon) || other.coupon == coupon) &&
            (identical(other.redeemedWalletAmount, redeemedWalletAmount) ||
                other.redeemedWalletAmount == redeemedWalletAmount) &&
            (identical(other.redeemedQrisCoins, redeemedQrisCoins) ||
                other.redeemedQrisCoins == redeemedQrisCoins) &&
            (identical(other.paymentResponse, paymentResponse) ||
                other.paymentResponse == paymentResponse) &&
            (identical(other.appliedCouponAmount, appliedCouponAmount) ||
                other.appliedCouponAmount == appliedCouponAmount) &&
            (identical(other.encodedProductData, encodedProductData) ||
                other.encodedProductData == encodedProductData) &&
            (identical(other.slotDate, slotDate) ||
                other.slotDate == slotDate) &&
            (identical(other.slotTime, slotTime) ||
                other.slotTime == slotTime) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            (identical(other.encodedAddress, encodedAddress) ||
                other.encodedAddress == encodedAddress) &&
            (identical(other.encodedCouponData, encodedCouponData) ||
                other.encodedCouponData == encodedCouponData) &&
            (identical(other.sampleType, sampleType) ||
                other.sampleType == sampleType) &&
            (identical(other.hardCopyCharges, hardCopyCharges) ||
                other.hardCopyCharges == hardCopyCharges) &&
            (identical(other.referBy, referBy) || other.referBy == referBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        userId,
        packagesAmount,
        collectionCharges,
        cartFinalValue,
        paymentMode,
        razorpayPaymentId,
        coupon,
        redeemedWalletAmount,
        redeemedQrisCoins,
        paymentResponse,
        appliedCouponAmount,
        encodedProductData,
        slotDate,
        slotTime,
        pincode,
        encodedAddress,
        encodedCouponData,
        sampleType,
        hardCopyCharges,
        referBy
      ]);

  /// Create a copy of OrderReqModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderReqModelImplCopyWith<_$OrderReqModelImpl> get copyWith =>
      __$$OrderReqModelImplCopyWithImpl<_$OrderReqModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderReqModelImplToJson(
      this,
    );
  }
}

abstract class _OrderReqModel implements OrderReqModel {
  const factory _OrderReqModel(
      {required final int userId,
      final int packagesAmount,
      final int collectionCharges,
      final int cartFinalValue,
      required final PaymentMode paymentMode,
      final String? razorpayPaymentId,
      final Coupon? coupon,
      final int redeemedWalletAmount,
      final int redeemedQrisCoins,
      final String? paymentResponse,
      required final double appliedCouponAmount,
      required final String encodedProductData,
      required final String slotDate,
      required final String slotTime,
      required final String pincode,
      required final String encodedAddress,
      final String? encodedCouponData,
      final String? sampleType,
      final String hardCopyCharges,
      final String? referBy}) = _$OrderReqModelImpl;

  factory _OrderReqModel.fromJson(Map<String, dynamic> json) =
      _$OrderReqModelImpl.fromJson;

  @override
  int get userId;
  @override
  int get packagesAmount;
  @override
  int get collectionCharges;
  @override
  int get cartFinalValue;
  @override
  PaymentMode get paymentMode;
  @override
  String? get razorpayPaymentId;
  @override
  Coupon? get coupon;
  @override
  int get redeemedWalletAmount;
  @override
  int get redeemedQrisCoins;
  @override
  String? get paymentResponse;
  @override
  double get appliedCouponAmount;
  @override
  String get encodedProductData;
  @override
  String get slotDate;
  @override
  String get slotTime;
  @override
  String get pincode;
  @override
  String get encodedAddress;
  @override
  String? get encodedCouponData;
  @override
  String? get sampleType;
  @override
  String get hardCopyCharges;
  @override
  String? get referBy;

  /// Create a copy of OrderReqModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderReqModelImplCopyWith<_$OrderReqModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
