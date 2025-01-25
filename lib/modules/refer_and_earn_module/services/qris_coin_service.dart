import 'dart:convert';

import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/refer_and_earn_module/models/qris_coin/qris_coin.dart';
import 'package:qris_health/shared/utils/wrappers/wrapper.dart';

class QrisCoinService {
  static Future<List<QrisCoin>> getCoinHistory({required String userId}) async {
    final url = '${AppConstants.baseUrl}/coins/$userId';

    try {
      final response = await Wrapper.get(url);
      return (json.decode(response)['body'] as List)
          .map((element) => QrisCoin.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
