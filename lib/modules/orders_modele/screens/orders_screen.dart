import 'dart:math';

import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/api_params.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';
import 'package:qris_health/modules/orders_modele/services/order_service.dart';
import 'package:qris_health/modules/patients_module/models/patient/patient.dart';
import 'package:qris_health/modules/patients_module/services/patient_service.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/common_filled_chip.dart';
import 'package:qris_health/shared/components/common_listview_shimmer.dart';
import 'package:qris_health/shared/components/no_item_found_container.dart';
import 'package:qris_health/shared/utils/auth_helper.dart';

import '../components/order_list_tile.dart';
import '../models/order/order.dart';
import '../models/order_info/order_info.dart';

class OrdersScreen extends StatefulWidget {
  final int? autoExpandOrderId;
  final String? orderStatus;
  
  const OrdersScreen({super.key, this.autoExpandOrderId, this.orderStatus});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  late final Future<List<Patient>> _patientsFuture;
  late final Future<List<Order>> _ordersFuture;
  late final Future<Map<int, String>> _orderStatusMapFuture;

  Patient? _selectedPatient;
  bool _hasShownError = false;

  @override
  void initState() {
    super.initState();
    final userId = ApiParams.getInstance()!.userId.toString();
    _patientsFuture = PatientService.getPatientsOfUser(userId: userId);
    _ordersFuture = OrderService.getAllOrdersForUser(userId: userId);
    _orderStatusMapFuture = _loadOrderStatusMap(userId);
  }

  Future<Map<int, String>> _loadOrderStatusMap(String userId) async {
    try {
      final orderStatuses = await OrderService.getOrderStatusForUser(userId: userId);
      final statusMap = <int, String>{};
      
      for (final orderStatus in orderStatuses) {
        statusMap[orderStatus.orderId] = orderStatus.overallStatus;
      }
      
      return statusMap;
    } catch (e) {
      final errorMessage = e.toString();
      if (AuthHelper.isAuthError(errorMessage)) {
        await AuthHelper.handleAuthError(errorMessage);
      }
      debugPrint('Error loading order statuses: $e');
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Bookings/Reports'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          _buildPatientChips(),
          const SizedBox(height: 18),
          Expanded(child: _buildOrdersList()),
        ],
      ),
    );
  }

  Widget _buildPatientChips() {
    return FutureBuilder<List<Patient>>(
      future: _patientsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildShimmerChipPlaceholder();
        }

        if (snapshot.hasError) {
          final errorMessage = snapshot.error.toString();
          if (AuthHelper.isAuthError(errorMessage)) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await AuthHelper.handleAuthError(errorMessage);
            });
            return const SizedBox.shrink();
          }
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.scaffoldPadding),
            child: Text('Failed to load patients',
                style: TextStyle(color: Colors.red)),
          );
        }

        final patients = snapshot.data ?? [];

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.scaffoldPadding),
          child: Row(
            children: [
              _buildChip(
                title: 'All',
                isSelected: _selectedPatient == null,
                onTap: () => setState(() => _selectedPatient = null),
              ),
              const SizedBox(width: 4),
              ...patients.map((patient) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: _buildChip(
                      title: (patient.name ?? '').capitalize!,
                      isSelected: _selectedPatient?.id == patient.id,
                      onTap: () => setState(() => _selectedPatient = patient),
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }

  Widget _buildChip({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: CommonFilledChip(
        title: title,
        isSelected: isSelected,
      ),
    );
  }

  Widget _buildShimmerChipPlaceholder() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppConstants.scaffoldPadding),
      child: FadeShimmer(
        width: double.infinity,
        height: 30,
        fadeTheme: FadeTheme.light,
      ),
    );
  }

  Widget _buildOrdersList() {
    return FutureBuilder<List<Order>>(
      future: _ordersFuture,
      builder: (context, ordersSnapshot) {
        if (ordersSnapshot.hasError && !_hasShownError) {
          _hasShownError = true;
          final errorMessage = ordersSnapshot.error.toString();
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            if (AuthHelper.isAuthError(errorMessage)) {
              await AuthHelper.handleAuthError(errorMessage);
            } else {
              AppConstants.showSnackbar(
                text: errorMessage,
                type: SnackbarType.error,
              );
            }
          });
        }

        if (ordersSnapshot.connectionState == ConnectionState.waiting) {
          return const CommonListviewShimmer();
        }

        if (!ordersSnapshot.hasData || ordersSnapshot.data!.isEmpty) {
          return const Center(
            child: NoItemFoundContainer(title: 'No bookings found'),
          );
        }

        final orders = ordersSnapshot.data!.reversed.toList();
        final filteredOrders =
            _selectedPatient == null ? orders : _filterOrders(orders: orders);

        if (filteredOrders.isEmpty) {
          return const Center(
            child: NoItemFoundContainer(
                title: 'No bookings found for the patient'),
          );
        }

        return FutureBuilder<Map<int, String>>(
          future: _orderStatusMapFuture,
          builder: (context, statusMapSnapshot) {
            final orderStatusMap = statusMapSnapshot.data ?? {};
            
            return ListView.separated(
              key: ValueKey(Random().nextInt(10000)),
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.scaffoldPadding),
              physics: const BouncingScrollPhysics(),
              itemCount: filteredOrders.length,
              itemBuilder: (context, index) {
                final order = filteredOrders[index];
                final isAutoExpanded = widget.autoExpandOrderId == order.id;
                
                String? orderStatus;
                if (isAutoExpanded && widget.orderStatus != null) {
                  orderStatus = widget.orderStatus;
                } else if (orderStatusMap.containsKey(order.id)) {
                  orderStatus = orderStatusMap[order.id];
                }
                
                return OrderListTile(
                  order: order,
                  initiallyExpanded: isAutoExpanded,
                  overallStatus: orderStatus,
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 10),
            );
          },
        );
      },
    );
  }

  List<Order> _filterOrders({required List<Order> orders}) {
    if (_selectedPatient == null) return orders;

    final selectedPatientId = _selectedPatient!.id.toString();
    final filteredOrders = <Order>[];

    for (final order in orders) {
      try {
        final decodedOrderInfo =
            AppConstants.decodeBase64(encodedString: order.productRecord);
        if (decodedOrderInfo == null) continue;

        final orderInfo = OrderInfo.fromJson(decodedOrderInfo);
        final containsPatient = orderInfo.data.entries.any((dataEntry) =>
            dataEntry.value.patients.entries.any(
                (patientEntry) => patientEntry.value.id == selectedPatientId));

        if (containsPatient) {
          filteredOrders.add(order);
        }
      } catch (e) {
        debugPrint('Error decoding order: $e');
        continue;
      }
    }

    return filteredOrders;
  }
}
