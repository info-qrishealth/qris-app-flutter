import 'dart:convert';

import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/orders_modele/models/order/order.dart';
import 'package:qris_health/modules/orders_modele/models/user_order_report/user_order_report.dart';
import 'package:qris_health/shared/utils/wrappers/wrapper.dart';

class OrderService {
  static Future<List<Order>> getAllOrdersForUser(
      {required String userId}) async {
    final url = '${AppConstants.baseUrl}/orders/$userId';

    try {
      final response = await Wrapper.get(url);
      final orders = (json.decode(response)['body'] as List).map((element) {
        final order = Order.fromJson(element);
        return order;
      }).toList();

      return orders;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<UserOrderReport>> getUserReportsByOrderId(
      {required String orderId}) async {
    final url = '${AppConstants.baseUrl}/orders/reports/$orderId';

    try {
      final response = await Wrapper.get(url);
      return (json.decode(response)['body'] as List)
          .map((element) => UserOrderReport.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
