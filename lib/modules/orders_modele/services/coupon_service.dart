import 'dart:convert';

import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/orders_modele/models/coupon/coupon.dart';
import 'package:qris_health/shared/utils/wrappers/wrapper.dart';

class CouponService {
  static Future<List<Coupon>> getAllCoupons() async {
    final url = '${AppConstants.baseUrl}/coupons';

    try {
      final response = await Wrapper.get(url);
      return (json.decode(response)['body'] as List)
          .map((element) => Coupon.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<Coupon> getCouponByCouponCode(
      {required String couponCode}) async {
    final url = '${AppConstants.baseUrl}/coupons/$couponCode';

    try {
      final response = await Wrapper.get(url);
      return Coupon.fromJson(json.decode(response)['body']);
    } catch (e) {
      rethrow;
    }
  }
}
