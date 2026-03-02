import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/generated/assets.dart';
import 'package:qris_health/modules/doctor_consultation_module/services/free_consultation_service.dart';
import 'package:qris_health/modules/doctor_consultation_module/screens/free_consultation_booking_screen.dart';
import 'package:qris_health/modules/orders_modele/models/order_status/order_status.dart';
import 'package:qris_health/modules/orders_modele/screens/orders_screen.dart';
import 'package:qris_health/shared/components/common_filled_chip.dart';
import 'package:qris_health/shared/utils/mixins/general_helper_mixin.dart';
import 'package:qris_health/styles/app_colors.dart';

class OrderStatusContainer extends StatelessWidget with GeneralHelperMixin {
  final OrderStatus orderStatus;
  final VoidCallback? onConsultationBooked;

  const OrderStatusContainer({
    super.key,
    required this.orderStatus,
    this.onConsultationBooked,
  });

  @override
  Widget build(BuildContext context) {
    final status = orderStatus.overallStatus;
    
    final hasPhleboDetails = orderStatus.overallStatus == 'Phlebo Assigned' &&
        orderStatus.phlebo != null &&
        orderStatus.phlebo!.name.isNotEmpty &&
        orderStatus.phlebo!.mobile.isNotEmpty;

    final hasReportGeneratedButton = orderStatus.overallStatus == 'Report Generated';

    final textColor = _getTextColor(status);

    final mainRow = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _buildContent(status, textColor),
        ),
        const SizedBox(width: 16),
        _buildStatusIcon(status),
      ],
    );

    Widget content;
    if (hasPhleboDetails) {
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          mainRow,
          const SizedBox(height: 12),
          _buildPhleboDetailsRow(textColor),
        ],
      );
    } else if (hasReportGeneratedButton) {
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          mainRow,
          const SizedBox(height: 12),
          _buildBookConsultationButton(context, textColor),
        ],
      );
    } else {
      content = mainRow;
    }

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => OrdersScreen(
              autoExpandOrderId: orderStatus.orderId,
              orderStatus: orderStatus.overallStatus,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: _getBackgroundColor(status),
          borderRadius: BorderRadius.circular(16),
        ),
        child: content,
      ),
    );
  }

  Widget _buildContent(String status, Color textColor) {
    
    if (status == 'Order Cancelled') {
      return _buildCancelledContent(textColor);
    } else if (status == 'Phlebo Assigned') {
      return _buildPhleboAssignedContent(textColor);
    } else if (status == 'Sample Collected') {
      return _buildSampleCollectedContent(textColor);
    } else if (status == 'Report Generated') {
      return _buildReportGeneratedContent(textColor);
    } else {
      return _buildOrderBookedContent(textColor);
    }
  }

  Widget _buildOrderBookedContent(Color textColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Booking is Confirmed',
          style: Get.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Booking ID: QRS${orderStatus.orderId}',
          style: Get.textTheme.labelSmall?.copyWith(
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Sit back and relax, We\'ll assign a phlebotomist soon.',
          style: Get.textTheme.labelSmall?.copyWith(
            color: textColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildPhleboAssignedContent(Color textColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phlebo Assigned',
          style: Get.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Booking ID: QRS${orderStatus.orderId}',
          style: Get.textTheme.labelSmall?.copyWith(
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Our phlebotomist has been assigned and will contact you shortly.',
          style: Get.textTheme.labelSmall?.copyWith(
            color: textColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildPhleboDetailsRow(Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.person,
            size: 14,
            color: textColor,
          ),
          const SizedBox(width: 6),
          RichText(
            text: TextSpan(
              style: Get.textTheme.labelSmall?.copyWith(
                color: textColor,
              ),
              children: [
                const TextSpan(
                  text: 'Phlebo: ',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(
                  text: orderStatus.phlebo!.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 1,
            height: 16,
            color: textColor.withOpacity(0.6),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () async {
              await openDialPad(phoneNumber: '91${orderStatus.phlebo!.mobile}');
            },
            behavior: HitTestBehavior.opaque,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.phone,
                  size: 14,
                  color: textColor,
                ),
                const SizedBox(width: 4),
                Text(
                  '+91 ${orderStatus.phlebo!.mobile}',
                  style: Get.textTheme.labelSmall?.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSampleCollectedContent(Color textColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sample Collected',
          style: Get.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Booking ID: QRS${orderStatus.orderId}',
          style: Get.textTheme.labelSmall?.copyWith(
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Your sample has been collected successfully and is being processed.',
          style: Get.textTheme.labelSmall?.copyWith(
            color: textColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildReportGeneratedContent(Color textColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Report Generated',
          style: Get.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Booking ID: QRS${orderStatus.orderId}',
          style: Get.textTheme.labelSmall?.copyWith(
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Your test report is ready. Tap to view or download your results.',
          style: Get.textTheme.labelSmall?.copyWith(
            color: textColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildBookConsultationButton(BuildContext context, Color textColor) {
    final allPatientIds = orderStatus.patients.map((p) => p.patientId).toList();
    
    return FutureBuilder<List<String>>(
      future: FreeConsultationService.getBookedPatientIds(
        orderId: orderStatus.orderId,
      ),
      builder: (context, snapshot) {
        final bookedPatientIds = snapshot.data ?? [];
        final allPatientsBooked = allPatientIds.isNotEmpty &&
            bookedPatientIds.length == allPatientIds.length &&
            allPatientIds.every((id) => bookedPatientIds.contains(id));

        if (allPatientsBooked) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Free Doctor Consultation Requested',
                  style: Get.textTheme.labelSmall?.copyWith(
                    color: textColor.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        }

        return GestureDetector(
          onTap: () async {
            final result = await Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => FreeConsultationBookingScreen(
                  orderId: orderStatus.orderId,
                  orderStatus: orderStatus,
                ),
              ),
            );
            
            if (result == true && context.mounted) {
              onConsultationBooked?.call();
            }
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Book Free Doctor Consultation',
                  style: Get.textTheme.labelSmall?.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCancelledContent(Color textColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Cancelled',
          style: Get.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Booking ID: QRS${orderStatus.orderId}',
          style: Get.textTheme.labelSmall?.copyWith(
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'This booking was cancelled. Please contact support if you need further assistance.',
          style: Get.textTheme.labelSmall?.copyWith(
            color: textColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildStatusIcon(String status) {
    String iconPath;
    
    switch (status) {
      case 'Order Booked':
        iconPath = 'assets/images/icons/order_status_icons/book_confirm.png';
        break;
      case 'Phlebo Assigned':
        iconPath = 'assets/images/icons/order_status_icons/phlebo_assign.png';
        break;
      case 'Sample Collected':
        iconPath = 'assets/images/icons/order_status_icons/sample_collect.png';
        break;
      case 'Report Generated':
        iconPath = 'assets/images/icons/order_status_icons/report_generate.png';
        break;
      case 'Order Cancelled':
        iconPath = 'assets/images/icons/order_status_icons/book_confirm.png';
        break;
      default:
        iconPath = 'assets/images/icons/order_status_icons/book_confirm.png';
    }
    
    return Image.asset(
      iconPath,
      width: 60,
      height: 60,
      fit: BoxFit.contain,
    );
  }

  Color _getBackgroundColor(String status) {
    switch (status) {
      case 'Order Booked':
        return const Color(0xFFE8DBF7);
      case 'Phlebo Assigned':
        return const Color(0xFFF7D8ED);
      case 'Sample Collected':
        return const Color(0xFFE6E2F8);
      case 'Report Generated':
        return const Color(0xFFD8F2EA);
      case 'Order Cancelled':
        return const Color(0xFFFFE4E2);
      default:
        return const Color(0xFFE8DBF7);
    }
  }

  Color _getTextColor(String status) {
    switch (status) {
      case 'Order Booked':
        return const Color(0xFF421E75);
      case 'Phlebo Assigned':
        return const Color(0xFF8C1E67);
      case 'Sample Collected':
        return const Color(0xFF421E75);
      case 'Report Generated':
        return const Color(0xFF175A46);
      case 'Order Cancelled':
        return const Color(0xFF832C2C);
      default:
        return const Color(0xFF421E75);
    }
  }

}
