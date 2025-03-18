// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coupon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Coupon _$CouponFromJson(Map<String, dynamic> json) {
  return _Coupon.fromJson(json);
}

/// @nodoc
mixin _$Coupon {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'coupan_code')
  String get couponCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'coupan_price')
  double get couponPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_mode')
  CouponDiscountType get discountMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'coupan_limit')
  int get couponLimit => throw _privateConstructorUsedError;
  @JsonKey(name: 'coupan_start_date')
  DateTime get couponStartDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'coupan_end_date')
  DateTime get couponEndDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'short_desc')
  String get shortDesc => throw _privateConstructorUsedError;
  int get display => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_action')
  CouponType get discountAction => throw _privateConstructorUsedError;
  @JsonKey(name: 'cart_value')
  double get cartValue => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  int get visibility => throw _privateConstructorUsedError;
  @JsonKey(name: 'one_time')
  int get oneTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_order')
  String get firstOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'sc_cashback')
  int get scCashback => throw _privateConstructorUsedError;
  @JsonKey(name: 'cb_discount_type')
  CouponDiscountType get cbDiscountType => throw _privateConstructorUsedError;
  @JsonKey(name: 'cb_coupon_amt')
  double get cbCouponAmt => throw _privateConstructorUsedError;
  @JsonKey(name: 'sc_cashdiscount')
  int get scCashDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'cd_discount_type')
  CouponDiscountType get cdDiscountType => throw _privateConstructorUsedError;
  @JsonKey(name: 'cd_coupon_amt')
  double get cdCouponAmt => throw _privateConstructorUsedError;
  @JsonKey(name: 'for120days')
  String get for120days => throw _privateConstructorUsedError;
  @JsonKey(name: 'applicable')
  CouponApplicableType get applicable => throw _privateConstructorUsedError;

  /// Serializes this Coupon to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Coupon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CouponCopyWith<Coupon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponCopyWith<$Res> {
  factory $CouponCopyWith(Coupon value, $Res Function(Coupon) then) =
      _$CouponCopyWithImpl<$Res, Coupon>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'coupan_code') String couponCode,
      @JsonKey(name: 'coupan_price') double couponPrice,
      @JsonKey(name: 'discount_mode') CouponDiscountType discountMode,
      @JsonKey(name: 'coupan_limit') int couponLimit,
      @JsonKey(name: 'coupan_start_date') DateTime couponStartDate,
      @JsonKey(name: 'coupan_end_date') DateTime couponEndDate,
      @JsonKey(name: 'short_desc') String shortDesc,
      int display,
      @JsonKey(name: 'discount_action') CouponType discountAction,
      @JsonKey(name: 'cart_value') double cartValue,
      int status,
      int visibility,
      @JsonKey(name: 'one_time') int oneTime,
      @JsonKey(name: 'first_order') String firstOrder,
      @JsonKey(name: 'sc_cashback') int scCashback,
      @JsonKey(name: 'cb_discount_type') CouponDiscountType cbDiscountType,
      @JsonKey(name: 'cb_coupon_amt') double cbCouponAmt,
      @JsonKey(name: 'sc_cashdiscount') int scCashDiscount,
      @JsonKey(name: 'cd_discount_type') CouponDiscountType cdDiscountType,
      @JsonKey(name: 'cd_coupon_amt') double cdCouponAmt,
      @JsonKey(name: 'for120days') String for120days,
      @JsonKey(name: 'applicable') CouponApplicableType applicable});
}

/// @nodoc
class _$CouponCopyWithImpl<$Res, $Val extends Coupon>
    implements $CouponCopyWith<$Res> {
  _$CouponCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Coupon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? couponCode = null,
    Object? couponPrice = null,
    Object? discountMode = null,
    Object? couponLimit = null,
    Object? couponStartDate = null,
    Object? couponEndDate = null,
    Object? shortDesc = null,
    Object? display = null,
    Object? discountAction = null,
    Object? cartValue = null,
    Object? status = null,
    Object? visibility = null,
    Object? oneTime = null,
    Object? firstOrder = null,
    Object? scCashback = null,
    Object? cbDiscountType = null,
    Object? cbCouponAmt = null,
    Object? scCashDiscount = null,
    Object? cdDiscountType = null,
    Object? cdCouponAmt = null,
    Object? for120days = null,
    Object? applicable = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      couponCode: null == couponCode
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String,
      couponPrice: null == couponPrice
          ? _value.couponPrice
          : couponPrice // ignore: cast_nullable_to_non_nullable
              as double,
      discountMode: null == discountMode
          ? _value.discountMode
          : discountMode // ignore: cast_nullable_to_non_nullable
              as CouponDiscountType,
      couponLimit: null == couponLimit
          ? _value.couponLimit
          : couponLimit // ignore: cast_nullable_to_non_nullable
              as int,
      couponStartDate: null == couponStartDate
          ? _value.couponStartDate
          : couponStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      couponEndDate: null == couponEndDate
          ? _value.couponEndDate
          : couponEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      shortDesc: null == shortDesc
          ? _value.shortDesc
          : shortDesc // ignore: cast_nullable_to_non_nullable
              as String,
      display: null == display
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as int,
      discountAction: null == discountAction
          ? _value.discountAction
          : discountAction // ignore: cast_nullable_to_non_nullable
              as CouponType,
      cartValue: null == cartValue
          ? _value.cartValue
          : cartValue // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as int,
      oneTime: null == oneTime
          ? _value.oneTime
          : oneTime // ignore: cast_nullable_to_non_nullable
              as int,
      firstOrder: null == firstOrder
          ? _value.firstOrder
          : firstOrder // ignore: cast_nullable_to_non_nullable
              as String,
      scCashback: null == scCashback
          ? _value.scCashback
          : scCashback // ignore: cast_nullable_to_non_nullable
              as int,
      cbDiscountType: null == cbDiscountType
          ? _value.cbDiscountType
          : cbDiscountType // ignore: cast_nullable_to_non_nullable
              as CouponDiscountType,
      cbCouponAmt: null == cbCouponAmt
          ? _value.cbCouponAmt
          : cbCouponAmt // ignore: cast_nullable_to_non_nullable
              as double,
      scCashDiscount: null == scCashDiscount
          ? _value.scCashDiscount
          : scCashDiscount // ignore: cast_nullable_to_non_nullable
              as int,
      cdDiscountType: null == cdDiscountType
          ? _value.cdDiscountType
          : cdDiscountType // ignore: cast_nullable_to_non_nullable
              as CouponDiscountType,
      cdCouponAmt: null == cdCouponAmt
          ? _value.cdCouponAmt
          : cdCouponAmt // ignore: cast_nullable_to_non_nullable
              as double,
      for120days: null == for120days
          ? _value.for120days
          : for120days // ignore: cast_nullable_to_non_nullable
              as String,
      applicable: null == applicable
          ? _value.applicable
          : applicable // ignore: cast_nullable_to_non_nullable
              as CouponApplicableType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CouponImplCopyWith<$Res> implements $CouponCopyWith<$Res> {
  factory _$$CouponImplCopyWith(
          _$CouponImpl value, $Res Function(_$CouponImpl) then) =
      __$$CouponImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'coupan_code') String couponCode,
      @JsonKey(name: 'coupan_price') double couponPrice,
      @JsonKey(name: 'discount_mode') CouponDiscountType discountMode,
      @JsonKey(name: 'coupan_limit') int couponLimit,
      @JsonKey(name: 'coupan_start_date') DateTime couponStartDate,
      @JsonKey(name: 'coupan_end_date') DateTime couponEndDate,
      @JsonKey(name: 'short_desc') String shortDesc,
      int display,
      @JsonKey(name: 'discount_action') CouponType discountAction,
      @JsonKey(name: 'cart_value') double cartValue,
      int status,
      int visibility,
      @JsonKey(name: 'one_time') int oneTime,
      @JsonKey(name: 'first_order') String firstOrder,
      @JsonKey(name: 'sc_cashback') int scCashback,
      @JsonKey(name: 'cb_discount_type') CouponDiscountType cbDiscountType,
      @JsonKey(name: 'cb_coupon_amt') double cbCouponAmt,
      @JsonKey(name: 'sc_cashdiscount') int scCashDiscount,
      @JsonKey(name: 'cd_discount_type') CouponDiscountType cdDiscountType,
      @JsonKey(name: 'cd_coupon_amt') double cdCouponAmt,
      @JsonKey(name: 'for120days') String for120days,
      @JsonKey(name: 'applicable') CouponApplicableType applicable});
}

/// @nodoc
class __$$CouponImplCopyWithImpl<$Res>
    extends _$CouponCopyWithImpl<$Res, _$CouponImpl>
    implements _$$CouponImplCopyWith<$Res> {
  __$$CouponImplCopyWithImpl(
      _$CouponImpl _value, $Res Function(_$CouponImpl) _then)
      : super(_value, _then);

  /// Create a copy of Coupon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? couponCode = null,
    Object? couponPrice = null,
    Object? discountMode = null,
    Object? couponLimit = null,
    Object? couponStartDate = null,
    Object? couponEndDate = null,
    Object? shortDesc = null,
    Object? display = null,
    Object? discountAction = null,
    Object? cartValue = null,
    Object? status = null,
    Object? visibility = null,
    Object? oneTime = null,
    Object? firstOrder = null,
    Object? scCashback = null,
    Object? cbDiscountType = null,
    Object? cbCouponAmt = null,
    Object? scCashDiscount = null,
    Object? cdDiscountType = null,
    Object? cdCouponAmt = null,
    Object? for120days = null,
    Object? applicable = null,
  }) {
    return _then(_$CouponImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      couponCode: null == couponCode
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String,
      couponPrice: null == couponPrice
          ? _value.couponPrice
          : couponPrice // ignore: cast_nullable_to_non_nullable
              as double,
      discountMode: null == discountMode
          ? _value.discountMode
          : discountMode // ignore: cast_nullable_to_non_nullable
              as CouponDiscountType,
      couponLimit: null == couponLimit
          ? _value.couponLimit
          : couponLimit // ignore: cast_nullable_to_non_nullable
              as int,
      couponStartDate: null == couponStartDate
          ? _value.couponStartDate
          : couponStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      couponEndDate: null == couponEndDate
          ? _value.couponEndDate
          : couponEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      shortDesc: null == shortDesc
          ? _value.shortDesc
          : shortDesc // ignore: cast_nullable_to_non_nullable
              as String,
      display: null == display
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as int,
      discountAction: null == discountAction
          ? _value.discountAction
          : discountAction // ignore: cast_nullable_to_non_nullable
              as CouponType,
      cartValue: null == cartValue
          ? _value.cartValue
          : cartValue // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as int,
      oneTime: null == oneTime
          ? _value.oneTime
          : oneTime // ignore: cast_nullable_to_non_nullable
              as int,
      firstOrder: null == firstOrder
          ? _value.firstOrder
          : firstOrder // ignore: cast_nullable_to_non_nullable
              as String,
      scCashback: null == scCashback
          ? _value.scCashback
          : scCashback // ignore: cast_nullable_to_non_nullable
              as int,
      cbDiscountType: null == cbDiscountType
          ? _value.cbDiscountType
          : cbDiscountType // ignore: cast_nullable_to_non_nullable
              as CouponDiscountType,
      cbCouponAmt: null == cbCouponAmt
          ? _value.cbCouponAmt
          : cbCouponAmt // ignore: cast_nullable_to_non_nullable
              as double,
      scCashDiscount: null == scCashDiscount
          ? _value.scCashDiscount
          : scCashDiscount // ignore: cast_nullable_to_non_nullable
              as int,
      cdDiscountType: null == cdDiscountType
          ? _value.cdDiscountType
          : cdDiscountType // ignore: cast_nullable_to_non_nullable
              as CouponDiscountType,
      cdCouponAmt: null == cdCouponAmt
          ? _value.cdCouponAmt
          : cdCouponAmt // ignore: cast_nullable_to_non_nullable
              as double,
      for120days: null == for120days
          ? _value.for120days
          : for120days // ignore: cast_nullable_to_non_nullable
              as String,
      applicable: null == applicable
          ? _value.applicable
          : applicable // ignore: cast_nullable_to_non_nullable
              as CouponApplicableType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CouponImpl implements _Coupon {
  _$CouponImpl(
      {required this.id,
      @JsonKey(name: 'coupan_code') required this.couponCode,
      @JsonKey(name: 'coupan_price') required this.couponPrice,
      @JsonKey(name: 'discount_mode') required this.discountMode,
      @JsonKey(name: 'coupan_limit') required this.couponLimit,
      @JsonKey(name: 'coupan_start_date') required this.couponStartDate,
      @JsonKey(name: 'coupan_end_date') required this.couponEndDate,
      @JsonKey(name: 'short_desc') required this.shortDesc,
      required this.display,
      @JsonKey(name: 'discount_action') required this.discountAction,
      @JsonKey(name: 'cart_value') required this.cartValue,
      required this.status,
      required this.visibility,
      @JsonKey(name: 'one_time') required this.oneTime,
      @JsonKey(name: 'first_order') required this.firstOrder,
      @JsonKey(name: 'sc_cashback') required this.scCashback,
      @JsonKey(name: 'cb_discount_type') required this.cbDiscountType,
      @JsonKey(name: 'cb_coupon_amt') required this.cbCouponAmt,
      @JsonKey(name: 'sc_cashdiscount') required this.scCashDiscount,
      @JsonKey(name: 'cd_discount_type') required this.cdDiscountType,
      @JsonKey(name: 'cd_coupon_amt') required this.cdCouponAmt,
      @JsonKey(name: 'for120days') required this.for120days,
      @JsonKey(name: 'applicable') required this.applicable});

  factory _$CouponImpl.fromJson(Map<String, dynamic> json) =>
      _$$CouponImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'coupan_code')
  final String couponCode;
  @override
  @JsonKey(name: 'coupan_price')
  final double couponPrice;
  @override
  @JsonKey(name: 'discount_mode')
  final CouponDiscountType discountMode;
  @override
  @JsonKey(name: 'coupan_limit')
  final int couponLimit;
  @override
  @JsonKey(name: 'coupan_start_date')
  final DateTime couponStartDate;
  @override
  @JsonKey(name: 'coupan_end_date')
  final DateTime couponEndDate;
  @override
  @JsonKey(name: 'short_desc')
  final String shortDesc;
  @override
  final int display;
  @override
  @JsonKey(name: 'discount_action')
  final CouponType discountAction;
  @override
  @JsonKey(name: 'cart_value')
  final double cartValue;
  @override
  final int status;
  @override
  final int visibility;
  @override
  @JsonKey(name: 'one_time')
  final int oneTime;
  @override
  @JsonKey(name: 'first_order')
  final String firstOrder;
  @override
  @JsonKey(name: 'sc_cashback')
  final int scCashback;
  @override
  @JsonKey(name: 'cb_discount_type')
  final CouponDiscountType cbDiscountType;
  @override
  @JsonKey(name: 'cb_coupon_amt')
  final double cbCouponAmt;
  @override
  @JsonKey(name: 'sc_cashdiscount')
  final int scCashDiscount;
  @override
  @JsonKey(name: 'cd_discount_type')
  final CouponDiscountType cdDiscountType;
  @override
  @JsonKey(name: 'cd_coupon_amt')
  final double cdCouponAmt;
  @override
  @JsonKey(name: 'for120days')
  final String for120days;
  @override
  @JsonKey(name: 'applicable')
  final CouponApplicableType applicable;

  @override
  String toString() {
    return 'Coupon(id: $id, couponCode: $couponCode, couponPrice: $couponPrice, discountMode: $discountMode, couponLimit: $couponLimit, couponStartDate: $couponStartDate, couponEndDate: $couponEndDate, shortDesc: $shortDesc, display: $display, discountAction: $discountAction, cartValue: $cartValue, status: $status, visibility: $visibility, oneTime: $oneTime, firstOrder: $firstOrder, scCashback: $scCashback, cbDiscountType: $cbDiscountType, cbCouponAmt: $cbCouponAmt, scCashDiscount: $scCashDiscount, cdDiscountType: $cdDiscountType, cdCouponAmt: $cdCouponAmt, for120days: $for120days, applicable: $applicable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CouponImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode) &&
            (identical(other.couponPrice, couponPrice) ||
                other.couponPrice == couponPrice) &&
            (identical(other.discountMode, discountMode) ||
                other.discountMode == discountMode) &&
            (identical(other.couponLimit, couponLimit) ||
                other.couponLimit == couponLimit) &&
            (identical(other.couponStartDate, couponStartDate) ||
                other.couponStartDate == couponStartDate) &&
            (identical(other.couponEndDate, couponEndDate) ||
                other.couponEndDate == couponEndDate) &&
            (identical(other.shortDesc, shortDesc) ||
                other.shortDesc == shortDesc) &&
            (identical(other.display, display) || other.display == display) &&
            (identical(other.discountAction, discountAction) ||
                other.discountAction == discountAction) &&
            (identical(other.cartValue, cartValue) ||
                other.cartValue == cartValue) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.oneTime, oneTime) || other.oneTime == oneTime) &&
            (identical(other.firstOrder, firstOrder) ||
                other.firstOrder == firstOrder) &&
            (identical(other.scCashback, scCashback) ||
                other.scCashback == scCashback) &&
            (identical(other.cbDiscountType, cbDiscountType) ||
                other.cbDiscountType == cbDiscountType) &&
            (identical(other.cbCouponAmt, cbCouponAmt) ||
                other.cbCouponAmt == cbCouponAmt) &&
            (identical(other.scCashDiscount, scCashDiscount) ||
                other.scCashDiscount == scCashDiscount) &&
            (identical(other.cdDiscountType, cdDiscountType) ||
                other.cdDiscountType == cdDiscountType) &&
            (identical(other.cdCouponAmt, cdCouponAmt) ||
                other.cdCouponAmt == cdCouponAmt) &&
            (identical(other.for120days, for120days) ||
                other.for120days == for120days) &&
            (identical(other.applicable, applicable) ||
                other.applicable == applicable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        couponCode,
        couponPrice,
        discountMode,
        couponLimit,
        couponStartDate,
        couponEndDate,
        shortDesc,
        display,
        discountAction,
        cartValue,
        status,
        visibility,
        oneTime,
        firstOrder,
        scCashback,
        cbDiscountType,
        cbCouponAmt,
        scCashDiscount,
        cdDiscountType,
        cdCouponAmt,
        for120days,
        applicable
      ]);

  /// Create a copy of Coupon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CouponImplCopyWith<_$CouponImpl> get copyWith =>
      __$$CouponImplCopyWithImpl<_$CouponImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CouponImplToJson(
      this,
    );
  }
}

abstract class _Coupon implements Coupon {
  factory _Coupon(
      {required final int id,
      @JsonKey(name: 'coupan_code') required final String couponCode,
      @JsonKey(name: 'coupan_price') required final double couponPrice,
      @JsonKey(name: 'discount_mode')
      required final CouponDiscountType discountMode,
      @JsonKey(name: 'coupan_limit') required final int couponLimit,
      @JsonKey(name: 'coupan_start_date')
      required final DateTime couponStartDate,
      @JsonKey(name: 'coupan_end_date') required final DateTime couponEndDate,
      @JsonKey(name: 'short_desc') required final String shortDesc,
      required final int display,
      @JsonKey(name: 'discount_action')
      required final CouponType discountAction,
      @JsonKey(name: 'cart_value') required final double cartValue,
      required final int status,
      required final int visibility,
      @JsonKey(name: 'one_time') required final int oneTime,
      @JsonKey(name: 'first_order') required final String firstOrder,
      @JsonKey(name: 'sc_cashback') required final int scCashback,
      @JsonKey(name: 'cb_discount_type')
      required final CouponDiscountType cbDiscountType,
      @JsonKey(name: 'cb_coupon_amt') required final double cbCouponAmt,
      @JsonKey(name: 'sc_cashdiscount') required final int scCashDiscount,
      @JsonKey(name: 'cd_discount_type')
      required final CouponDiscountType cdDiscountType,
      @JsonKey(name: 'cd_coupon_amt') required final double cdCouponAmt,
      @JsonKey(name: 'for120days') required final String for120days,
      @JsonKey(name: 'applicable')
      required final CouponApplicableType applicable}) = _$CouponImpl;

  factory _Coupon.fromJson(Map<String, dynamic> json) = _$CouponImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'coupan_code')
  String get couponCode;
  @override
  @JsonKey(name: 'coupan_price')
  double get couponPrice;
  @override
  @JsonKey(name: 'discount_mode')
  CouponDiscountType get discountMode;
  @override
  @JsonKey(name: 'coupan_limit')
  int get couponLimit;
  @override
  @JsonKey(name: 'coupan_start_date')
  DateTime get couponStartDate;
  @override
  @JsonKey(name: 'coupan_end_date')
  DateTime get couponEndDate;
  @override
  @JsonKey(name: 'short_desc')
  String get shortDesc;
  @override
  int get display;
  @override
  @JsonKey(name: 'discount_action')
  CouponType get discountAction;
  @override
  @JsonKey(name: 'cart_value')
  double get cartValue;
  @override
  int get status;
  @override
  int get visibility;
  @override
  @JsonKey(name: 'one_time')
  int get oneTime;
  @override
  @JsonKey(name: 'first_order')
  String get firstOrder;
  @override
  @JsonKey(name: 'sc_cashback')
  int get scCashback;
  @override
  @JsonKey(name: 'cb_discount_type')
  CouponDiscountType get cbDiscountType;
  @override
  @JsonKey(name: 'cb_coupon_amt')
  double get cbCouponAmt;
  @override
  @JsonKey(name: 'sc_cashdiscount')
  int get scCashDiscount;
  @override
  @JsonKey(name: 'cd_discount_type')
  CouponDiscountType get cdDiscountType;
  @override
  @JsonKey(name: 'cd_coupon_amt')
  double get cdCouponAmt;
  @override
  @JsonKey(name: 'for120days')
  String get for120days;
  @override
  @JsonKey(name: 'applicable')
  CouponApplicableType get applicable;

  /// Create a copy of Coupon
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CouponImplCopyWith<_$CouponImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
