import 'dart:convert';

import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/orders_modele/models/order/order.dart';
import 'package:qris_health/modules/orders_modele/models/time_slot/time_slot.dart';
import 'package:qris_health/modules/orders_modele/models/user_order_report/user_order_report.dart';
import 'package:qris_health/shared/utils/wrappers/wrapper.dart';

import '../models/order_cancellation_model/order_cancellation_model.dart';
import '../models/order_status/order_status.dart';

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
    final url = '${AppConstants.baseUrl}/orders/reports/$orderId?all=true';

    try {
      final response = await Wrapper.get(url);
      return (json.decode(response)['body'] as List)
          .map((element) => UserOrderReport.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<TimeSlot>> getValidTimeslots(
      {required DateTime date}) async {
    final url = '${AppConstants.baseUrl}/orders/valid-time-slot';

    try {
      final response = await Wrapper.post(
          url, json.encode({'requestedDate': date.toIso8601String()}));
      return (json.decode(response)['body'] as List)
          .map((element) => TimeSlot.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<Order> createOrder({required Map<String, dynamic> payload}) async {
    final url = '${AppConstants.baseUrl}/orders/create';
    try {
      final response = await Wrapper.post(url, json.encode(payload));
      return Order.fromJson(json.decode(response)['body']);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> requestCancellation(
      {required OrderCancellationModel orderCancellationModel}) async {
    final url = '${AppConstants.baseUrl}/orders/cancel';

    try {
      await Wrapper.put(url, json.encode(orderCancellationModel.toJson()));
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<OrderStatus>> getOrderStatusForUser(
      {required String userId}) async {
    final url = '${AppConstants.baseUrl}/orders/status/$userId';

    try {
      final response = await Wrapper.get(url);
      final decoded = json.decode(response);
      final rawData = decoded['data'] ?? decoded['body'] ?? [];

      if (rawData is! List) {
        return [];
      }

      return rawData
          .map((element) => OrderStatus.fromJson(element as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
