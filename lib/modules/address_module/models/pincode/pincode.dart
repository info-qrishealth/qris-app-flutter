import 'package:freezed_annotation/freezed_annotation.dart';

part 'pincode.freezed.dart';
part 'pincode.g.dart';

@freezed
class Pincode with _$Pincode {
  factory Pincode(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'pincode') required int pincode,
      @JsonKey(name: 'min_order') required int minOrder,
      @JsonKey(name: 'delivery_charge') required int deliveryCharge,
      @JsonKey(name: 'hard_copy_charge') required int hardCopyCharge,
      @JsonKey(name: 'status') @Default('1') String status}) = _Pincode;

  factory Pincode.fromJson(Map<String, dynamic> json) =>
      _$PincodeFromJson(json);
}
