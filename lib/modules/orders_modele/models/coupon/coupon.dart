import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qris_health/constants/enums/coupon_discount_type.dart';
import 'package:qris_health/constants/enums/coupon_type.dart';

part 'coupon.freezed.dart';
part 'coupon.g.dart';

@freezed
class Coupon with _$Coupon {
  factory Coupon({
    required int id,
    @JsonKey(name: 'coupan_code') required String couponCode,
    @JsonKey(name: 'coupan_price') required double couponPrice,
    @JsonKey(name: 'discount_mode') required CouponDiscountType discountMode,
    @JsonKey(name: 'coupan_limit') required int couponLimit,
    @JsonKey(name: 'coupan_start_date') required DateTime couponStartDate,
    @JsonKey(name: 'coupan_end_date') required DateTime couponEndDate,
    @JsonKey(name: 'short_desc') required String shortDesc,
    required int display,
    @JsonKey(name: 'discount_action') required CouponType discountAction,
    @JsonKey(name: 'cart_value') required double cartValue,
    required int status,
    required int visibility,
    @JsonKey(name: 'one_time') required int oneTime,
    @JsonKey(name: 'first_order') required String firstOrder,
    @JsonKey(name: 'sc_cashback') required int scCashback,
    @JsonKey(name: 'cb_discount_type')
    required CouponDiscountType cbDiscountType,
    @JsonKey(name: 'cb_coupon_amt') required double cbCouponAmt,
    @JsonKey(name: 'sc_cashdiscount') required int scCashDiscount,
    @JsonKey(name: 'cd_discount_type')
    required CouponDiscountType cdDiscountType,
    @JsonKey(name: 'cd_coupon_amt') required double cdCouponAmt,
    @JsonKey(name: 'for120days') required String for120days,
  }) = _Coupon;

  factory Coupon.fromJson(Map<String, dynamic> json) => _$CouponFromJson(json);
}
