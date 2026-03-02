import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/api_params.dart';
import 'package:qris_health/modules/home_module/components/order_status_container.dart';
import 'package:qris_health/modules/orders_modele/models/order_status/order_status.dart';
import 'package:qris_health/modules/orders_modele/services/order_service.dart';
import 'package:qris_health/modules/orders_modele/services/order_visibility_service.dart';
import 'package:qris_health/shared/components/no_item_found_container.dart';
import 'package:qris_health/styles/app_colors.dart';

class OrderStatusCarousel extends StatefulWidget {
  const OrderStatusCarousel({super.key});

  @override
  State<OrderStatusCarousel> createState() => _OrderStatusCarouselState();
}

class _OrderStatusCarouselState extends State<OrderStatusCarousel> {
  late Future<List<OrderStatus>> _orderStatusFuture;
  int _currentPage = 0;
  int _refreshKey = 0;

  @override
  void initState() {
    super.initState();
    _loadOrders();
  }

  void _loadOrders() {
    final userId = ApiParams.getInstance()?.userId.toString() ?? '';
    _orderStatusFuture = _loadAndFilterOrders(userId);
  }

  void _refresh() {
    setState(() {
      _refreshKey++;
      _loadOrders();
    });
  }

  Future<List<OrderStatus>> _loadAndFilterOrders(String userId) async {
    final orders = await OrderService.getOrderStatusForUser(userId: userId);
    
    return orders.where((order) {
      return OrderVisibilityService.shouldShowOrder(
        orderStatus: order.overallStatus,
        reportGeneratedDate: order.reportGeneratedDate,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<OrderStatus>>(
      future: _orderStatusFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildShimmerPlaceholder();
        }

        if (snapshot.hasError) {
          return Container(
            height: 120,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.red.withOpacity(0.3)),
            ),
            child: Center(
              child: Text(
                'Failed to load order status',
                style: Get.textTheme.bodyMedium?.copyWith(
                  color: Colors.red,
                ),
              ),
            ),
          );
        }

        final orderStatuses = snapshot.data ?? [];

        if (orderStatuses.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity! < 0) {
                  // Swipe left
                  if (_currentPage < orderStatuses.length - 1) {
                    setState(() {
                      _currentPage++;
                    });
                  }
                } else if (details.primaryVelocity! > 0) {
                  // Swipe right
                  if (_currentPage > 0) {
                    setState(() {
                      _currentPage--;
                    });
                  }
                }
              },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: OrderStatusContainer(
                  key: ValueKey('${_currentPage}_$_refreshKey'),
                  orderStatus: orderStatuses[_currentPage],
                  onConsultationBooked: _refresh,
                ),
              ),
            ),
            if (orderStatuses.length > 1) ...[
              const SizedBox(height: 12),
              _buildPageIndicator(orderStatuses.length),
              const SizedBox(height: 16),
            ] else
              const SizedBox(height: 8),
          ],
        );
      },
    );
  }

  Widget _buildPageIndicator(int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == _currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? AppColors.primaryBlue : Colors.transparent,
            border: Border.all(
              color: AppColors.primaryBlue,
              width: 1.5,
            ),
          ),
        );
      }),
    );
  }

  Widget _buildShimmerPlaceholder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FadeShimmer(
            width: double.infinity,
            height: 140,
            fadeTheme: FadeTheme.light,
            radius: 12,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

