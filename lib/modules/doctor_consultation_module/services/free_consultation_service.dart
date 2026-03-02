import 'dart:convert';

import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/doctor_consultation_module/models/free_consultation_request/free_consultation_request.dart';
import 'package:qris_health/modules/orders_modele/models/order_status/order_status.dart';
import 'package:qris_health/shared/utils/wrappers/wrapper.dart';

class FreeConsultationService {
  static Future<OrderStatus?> getOrderStatusByOrderId({
    required int orderId,
    required String userId,
  }) async {
    final url = '${AppConstants.baseUrl}/orders/status/$userId';

    try {
      final response = await Wrapper.get(url);
      final decoded = json.decode(response);
      final rawData = decoded['data'] ?? decoded['body'] ?? [];

      if (rawData is! List) {
        return null;
      }

      final orderStatuses = rawData
          .map((element) => OrderStatus.fromJson(element as Map<String, dynamic>))
          .toList();

      try {
        return orderStatuses.firstWhere((status) => status.orderId == orderId);
      } catch (_) {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> bookFreeConsultation({
    required int orderId,
    required List<String> patientIds,
    required int userId,
  }) async {
    final url = '${AppConstants.baseUrl}/consultations/book-free';

    try {
      final request = FreeConsultationRequest(
        orderId: orderId,
        patientIds: patientIds,
      );

      final requestBody = json.encode({
        'orderId': orderId,
        'patientIds': patientIds,
        'userId': userId,
      });

      final response = await Wrapper.post(url, requestBody);
      final decoded = json.decode(response);

      return decoded;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<String>> getBookedPatientIds({
    required int orderId,
  }) async {
    final url = '${AppConstants.baseUrl}/consultations/order/$orderId/booked-patients';

    try {
      final response = await Wrapper.get(url, requireAuth: true);
      final decoded = json.decode(response);
      final rawData = decoded['data'] ?? decoded['body'] ?? {};

      if (rawData is Map && rawData.containsKey('bookedPatientIds')) {
        final bookedIds = rawData['bookedPatientIds'];
        if (bookedIds is List) {
          return bookedIds.map((id) => id.toString()).toList();
        }
      }

      return [];
    } catch (e) {
      // Return empty list on error - don't block the UI
      debugPrint('Error fetching booked patient IDs: $e');
      return [];
    }
  }
}

