import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qris_health/modules/all_scans_module/models/test_package_model/test_package_model.dart';
import 'package:qris_health/modules/orders_modele/models/time_slot/time_slot.dart';

import '../../../address_module/models/address/address.dart';
import '../../../patients_module/models/patient/patient.dart';
import '../coupon/coupon.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Cart with _$Cart {
  const factory Cart({
    int? userId,
    @JsonKey(name: 'items') @Default([]) List<CartItem> cartTests,
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
    int? availableQrisCoins,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    int? testId,
    @Default([]) List<int> patientIds,
    TestPackageModel? test,
    @Default([]) List<Patient> patients,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}
