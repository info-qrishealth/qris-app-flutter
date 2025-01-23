import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address {
  const factory Address(
      {int? id,
      @JsonKey(name: 'user_id') String? userId,
      String? house,
      @JsonKey(name: 'address_1') String? address1,
      @JsonKey(name: 'address_2') String? address2,
      String? landmark,
      String? pincode,
      String? state,
      int? status,
      @JsonKey(name: 'dis_order') int? disOrder}) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
