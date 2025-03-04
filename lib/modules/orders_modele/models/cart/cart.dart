import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../address_module/models/address/address.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class Cart with _$Cart {
  const factory Cart(
      {required List<CartTest> cartTests, Address? selectedAddress}) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

@freezed
class CartTest with _$CartTest {
  const factory CartTest({required int testId, required List<int> patientIds}) =
      _CartTest;

  factory CartTest.fromJson(Map<String, dynamic> json) =>
      _$CartTestFromJson(json);
}
