import 'dart:convert';

import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/address_module/models/pincode/pincode.dart';
import 'package:qris_health/shared/utils/wrappers/wrapper.dart';

import '../models/address/address.dart';

class AddressService {
  static Future<List<Address>> getAddressesByUserId(
      {required String userId}) async {
    final url = '${AppConstants.baseUrl}/address/$userId';

    try {
      final response = await Wrapper.get(url);
      return (json.decode(response)['body'] as List)
          .map((element) => Address.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<Address> changeAddressStatus(
      {required int addressId, required int desiredStatus}) async {
    final url =
        '${AppConstants.baseUrl}/address/change-status?addressId=$addressId&status=$desiredStatus';

    try {
      final response = await Wrapper.put(url, null);
      return Address.fromJson(json.decode(response)['body']);
    } catch (e) {
      rethrow;
    }
  }

  static Future<Address> addAddress(
      {required Address address, required int userId}) async {
    final url = '${AppConstants.baseUrl}/address/$userId';

    try {
      final response = await Wrapper.post(url, json.encode(address.toJson()));
      return Address.fromJson(json.decode(response)['body']);
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Pincode>> getValidPinCodes() async {
    final url = '${AppConstants.baseUrl}/address/available-pincodes';

    try {
      final response = await Wrapper.get(url);
      return (json.decode(response)['body'] as List)
          .map((element) => Pincode.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
