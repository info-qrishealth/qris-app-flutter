import 'dart:convert';

import 'package:qris_health/modules/refer_and_earn_module/models/wallet_entry/qris_wallet_entry.dart';

import '../../../constants/app_constants.dart';
import '../../../shared/utils/wrappers/wrapper.dart';

class QrisWalletService {
  static Future<List<QrisWalletEntry>> getWalletHistory(
      {required String userId}) async {
    final url = '${AppConstants.baseUrl}/wallet/$userId';

    try {
      final response = await Wrapper.get(url);
      return (json.decode(response)['body'] as List)
          .map((element) => QrisWalletEntry.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
