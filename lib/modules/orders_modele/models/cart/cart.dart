import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qris_health/modules/all_scans_module/models/test_package_model/test_package_model.dart';

import '../../../address_module/models/address/address.dart';
import '../../../address_module/models/pincode/pincode.dart';
import '../coupon/coupon.dart';
import '../time_slot/time_slot.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class Cart with _$Cart {
  const factory Cart(
      {required List<CartTest> cartTests,
      Address? selectedAddress,
      TimeSlot? timeSlot,
      DateTime? collectionDate,
      Coupon? appliedCoupon,
      @Default(false) bool shouldGetHardCopy,
      Pincode? pincode}) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

@freezed
class CartTest with _$CartTest {
  const factory CartTest(
      {required TestPackageModel test,
      required List<int> patientIds}) = _CartTest;

  factory CartTest.fromJson(Map<String, dynamic> json) =>
      _$CartTestFromJson(json);
}
