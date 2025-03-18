// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CouponImpl _$$CouponImplFromJson(Map<String, dynamic> json) => _$CouponImpl(
      id: (json['id'] as num).toInt(),
      couponCode: json['coupan_code'] as String,
      couponPrice: (json['coupan_price'] as num).toDouble(),
      discountMode:
          $enumDecode(_$CouponDiscountTypeEnumMap, json['discount_mode']),
      couponLimit: (json['coupan_limit'] as num).toInt(),
      couponStartDate: DateTime.parse(json['coupan_start_date'] as String),
      couponEndDate: DateTime.parse(json['coupan_end_date'] as String),
      shortDesc: json['short_desc'] as String,
      display: (json['display'] as num).toInt(),
      discountAction: $enumDecode(_$CouponTypeEnumMap, json['discount_action']),
      cartValue: (json['cart_value'] as num).toDouble(),
      status: (json['status'] as num).toInt(),
      visibility: (json['visibility'] as num).toInt(),
      oneTime: (json['one_time'] as num).toInt(),
      firstOrder: json['first_order'] as String,
      scCashback: (json['sc_cashback'] as num).toInt(),
      cbDiscountType:
          $enumDecode(_$CouponDiscountTypeEnumMap, json['cb_discount_type']),
      cbCouponAmt: (json['cb_coupon_amt'] as num).toDouble(),
      scCashDiscount: (json['sc_cashdiscount'] as num).toInt(),
      cdDiscountType:
          $enumDecode(_$CouponDiscountTypeEnumMap, json['cd_discount_type']),
      cdCouponAmt: (json['cd_coupon_amt'] as num).toDouble(),
      for120days: json['for120days'] as String,
      applicable:
          $enumDecode(_$CouponApplicableTypeEnumMap, json['applicable']),
    );

Map<String, dynamic> _$$CouponImplToJson(_$CouponImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'coupan_code': instance.couponCode,
      'coupan_price': instance.couponPrice,
      'discount_mode': _$CouponDiscountTypeEnumMap[instance.discountMode]!,
      'coupan_limit': instance.couponLimit,
      'coupan_start_date': instance.couponStartDate.toIso8601String(),
      'coupan_end_date': instance.couponEndDate.toIso8601String(),
      'short_desc': instance.shortDesc,
      'display': instance.display,
      'discount_action': _$CouponTypeEnumMap[instance.discountAction]!,
      'cart_value': instance.cartValue,
      'status': instance.status,
      'visibility': instance.visibility,
      'one_time': instance.oneTime,
      'first_order': instance.firstOrder,
      'sc_cashback': instance.scCashback,
      'cb_discount_type': _$CouponDiscountTypeEnumMap[instance.cbDiscountType]!,
      'cb_coupon_amt': instance.cbCouponAmt,
      'sc_cashdiscount': instance.scCashDiscount,
      'cd_discount_type': _$CouponDiscountTypeEnumMap[instance.cdDiscountType]!,
      'cd_coupon_amt': instance.cdCouponAmt,
      'for120days': instance.for120days,
      'applicable': _$CouponApplicableTypeEnumMap[instance.applicable]!,
    };

const _$CouponDiscountTypeEnumMap = {
  CouponDiscountType.per: 'per',
  CouponDiscountType.fix: 'fix',
};

const _$CouponTypeEnumMap = {
  CouponType.none: 'none',
  CouponType.dc: 'dc',
  CouponType.cb: 'cb',
  CouponType.sc: 'sc',
};

const _$CouponApplicableTypeEnumMap = {
  CouponApplicableType.app: 'app',
  CouponApplicableType.web: 'web',
  CouponApplicableType.both: 'both',
};
