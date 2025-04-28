import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/api_params.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';
import 'package:qris_health/modules/orders_modele/models/order/order.dart';
import 'package:qris_health/modules/orders_modele/models/order_cancellation_model/order_cancellation_model.dart';
import 'package:qris_health/modules/orders_modele/services/order_service.dart';
import 'package:qris_health/styles/app_colors.dart';

class OrderCancellationDialog extends StatefulWidget {
  final Order order;
  const OrderCancellationDialog({super.key, required this.order});

  @override
  State<OrderCancellationDialog> createState() =>
      _OrderCancellationDialogState();
}

class _OrderCancellationDialogState extends State<OrderCancellationDialog> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        insetPadding:
            EdgeInsets.symmetric(horizontal: AppConstants.scaffoldPadding),
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(
                  'Are you sure you want to request cancellation of this order. Please confirm if you’d like to proceed.',
                  style: textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      height: 1.8,
                      color: AppColors.black),
                  textAlign: TextAlign.center),
              SizedBox(height: 24),
              SizedBox(
                  height: 40,
                  child: Row(children: [
                    Expanded(
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(color: AppColors.primaryBlue)),
                            onPressed: _isLoading
                                ? null
                                : () {
                                    Navigator.of(context).pop();
                                  },
                            child: Text('Cancel',
                                style: textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryBlue)))),
                    SizedBox(width: 8),
                    Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryBlue),
                            onPressed: _isLoading
                                ? null
                                : () async {
                                    try {
                                      setState(() {
                                        _isLoading = true;
                                      });

                                      await OrderService.requestCancellation(
                                          orderCancellationModel:
                                              OrderCancellationModel(
                                                  userId:
                                                      ApiParams.getInstance()!
                                                          .userId
                                                          .toString(),
                                                  doctorId: '',
                                                  orderId: widget.order.id
                                                      .toString(),
                                                  txnId:
                                                      widget.order.txnId ?? '',
                                                  cancellationRemark: 'other',
                                                  cancellationComment:
                                                      'Cancellation request by app'));

                                      Navigator.of(context).pop();
                                      AppConstants.showSnackbar(
                                          text:
                                              'Order cancellation requested successfully.',
                                          type: SnackbarType.success);
                                    } catch (e) {
                                      AppConstants.showSnackbar(
                                          text: e.toString(),
                                          type: SnackbarType.error);
                                    } finally {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    }
                                  },
                            child: Text(
                                _isLoading ? 'Submitting...' : 'Confirm',
                                style: textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white))))
                  ]))
            ])));
  }
}
