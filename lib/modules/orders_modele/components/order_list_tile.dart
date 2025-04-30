import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/order_status.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';
import 'package:qris_health/modules/address_module/models/address/address.dart';
import 'package:qris_health/modules/cart_module/components/patient_tile_layout.dart';
import 'package:qris_health/modules/orders_modele/components/order_cancellation_dialog.dart';
import 'package:qris_health/modules/orders_modele/models/order/order.dart';
import 'package:qris_health/modules/orders_modele/models/order_info/order_info.dart';
import 'package:qris_health/modules/orders_modele/models/user_order_report/user_order_report.dart';
import 'package:qris_health/modules/orders_modele/services/order_service.dart';
import 'package:qris_health/modules/patients_module/cubits/patients_cubit/patients_cubit.dart';
import 'package:qris_health/modules/patients_module/models/patient/patient.dart';
import 'package:qris_health/shared/components/billing_amount_row.dart';
import 'package:qris_health/shared/components/common_divider.dart';
import 'package:qris_health/shared/components/feature_row.dart';
import 'package:qris_health/shared/extensions/date_time_extension.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';
import 'package:qris_health/styles/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/order_patient/order_patient.dart';
import 'cancel_order_policy_dialog.dart';

class OrderListTile extends StatefulWidget {
  final Order order;
  const OrderListTile({super.key, required this.order});

  @override
  State<OrderListTile> createState() => _OrderListTileState();
}

class _OrderListTileState extends State<OrderListTile> {
  final _textTheme = Get.textTheme;
  List<UserOrderReport> _reports = [];
  late Order _order;

  @override
  void initState() {
    super.initState();
    _order = widget.order;

    final patientCubit = BlocProvider.of<PatientsCubit>(context);
    if (patientCubit.state is! PatientsLoaded) {
      patientCubit.getAllPatientsForUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isCancelled = _order.orderStatus == OrderStatus.cancel;
    final address = Address.fromJson(
        AppConstants.decodeBase64(encodedString: _order.bookingAddress) ?? {});
    final slots = _order.bookingSlotTime?.split('-');
    final from = slots?.firstOrNull;
    final to = slots != null && slots.length > 1 ? slots[1] : null;
    final decodedOrderInfo =
        AppConstants.decodeBase64(encodedString: _order.productRecord);
    final orderInfo =
        decodedOrderInfo == null ? null : OrderInfo.fromJson(decodedOrderInfo);
    final Map<OrderPatient, List<Product>> patientAndTestsMap = {};

    for (var orderInfoEntry in orderInfo!.data.entries) {
      final patients = orderInfoEntry.value.patients;
      for (var patientEntry in patients.entries) {
        final patient = patientEntry.value;

        if (patientAndTestsMap.containsKey(patient)) {
          patientAndTestsMap[patient]!.add(orderInfoEntry.value.product);
        } else {
          patientAndTestsMap[patient] = [orderInfoEntry.value.product];
        }
      }
    }

    return Container(
        decoration: BoxDecoration(
            color: isCancelled
                ? Color(0xffff726D).withOpacity(0.08)
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderColor)),
        child: ExpansionTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            minTileHeight: 55,
            tilePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            iconColor: AppColors.primaryBlue,
            childrenPadding: EdgeInsets.symmetric(horizontal: 10),
            title: Row(children: [
              _buildRichText(key: 'Order ID:', value: ' QRS${_order.id}'),
              if (isCancelled)
                Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                        '(${_order.orderStatus.name.formattedEnumName})',
                        style: _textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w500, color: AppColors.red)))
            ]),
            subtitle: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: _buildRichText(
                    key: 'Order Date:',
                    value: DateFormat()
                        .add_yMMMEd()
                        .add_jm()
                        .format(_order.orderDate.toLocal()),
                    valueColor: AppColors.black)),
            onExpansionChanged: (isExpanded) async {
              if (isExpanded) {
                try {
                  _reports = await OrderService.getUserReportsByOrderId(
                      orderId: _order.id.toString());
                  setState(() {});
                } catch (e) {
                  AppConstants.showSnackbar(
                      text: e.toString(), type: SnackbarType.error);
                }
              }
            },
            children: [
              CommonDivider(),
              SizedBox(height: 10),
              Row(children: [
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                      Text('Transaction id',
                          style: _textTheme.labelSmall!
                              .copyWith(fontWeight: FontWeight.w300)),
                      SizedBox(height: 4),
                      Text('${_order.txnId}',
                          style: _textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.lightText))
                    ])),
                if (!isCancelled &&
                    !_order.invoice.isNullOrEmpty &&
                    _reports.isNotEmpty &&
                    _reports.every(
                        (element) => element.reportFile.trim().isNotEmpty))
                  SizedBox(
                      height: 35,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryBlue),
                          onPressed: _downloadInvoice,
                          child: Row(children: [
                            Icon(Icons.save_alt, color: Colors.white, size: 18),
                            SizedBox(width: 4),
                            Text('Invoice',
                                style: _textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white))
                          ])))
              ]),
              SizedBox(height: 5),
              CommonDivider(),
              SizedBox(height: 5),
              Row(children: [
                Text('Booking Details',
                    style: _textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontFamily: AppConstants.ubuntuFontFamily)),
              ]),
              SizedBox(height: 8),
              FeatureRow(
                  svgPath: 'assets/images/icons/drawer_icons/location_icon.svg',
                  title:
                      '${address.house}, ${address.address1} ${address.address2 != null && address.address2!.isNotEmpty ? ', ${address.address2}' : ''} ${address.landmark != null && address.landmark!.isNotEmpty ? ', ${address.landmark}' : ''} ${address.pincode != null && address.pincode!.isNotEmpty ? ', ${address.pincode}' : ''}, ${address.state ?? ''}',
                  fontColor: AppColors.textColor),
              SizedBox(height: 6),
              FeatureRow(
                  svgPath: 'assets/images/icons/clock_icon.svg',
                  title:
                      '${DateTime.tryParse(_order.bookingSlotDate!)?.toLocal().getFormattedDatedMMMy} (${from.toDateTime?.toLocal().getTimeStringFromDateTimeString} - ${to.toDateTime?.toLocal().getTimeStringFromDateTimeString})',
                  fontColor: AppColors.textColor),
              SizedBox(height: 10),
              ...patientAndTestsMap.entries.map((entry) {
                return _buildPatientLayout(entry: entry);
              }),
              SizedBox(height: 12),
              CommonDivider(),
              SizedBox(height: 5),
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                Text('Billing Details',
                    style: _textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontFamily: AppConstants.ubuntuFontFamily)),
                SizedBox(height: 8),
                SummaryInfoRow(
                    title: 'Base amount',
                    value: '₹${_order.orderTotal.toInt()}'),
                SizedBox(height: 4),
                SummaryInfoRow(
                    title: 'Total amount ',
                    value: '₹${_order.paidAmount.toInt()}'),
                SizedBox(height: 4),
                Row(children: [
                  Expanded(
                      child: Text('Amount paid (${_order.paymentMode})',
                          style: _textTheme.bodySmall!
                              .copyWith(fontWeight: FontWeight.w700))),
                  Text('₹${_order.paidAmount.toInt()}',
                      style: _textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryPink))
                ])
              ]),
              if (_order.isCancellationProcessed == false)
                if (_order.orderStatus == OrderStatus.success)
                  Column(children: [
                    SizedBox(height: 12),
                    CommonDivider(),
                    SizedBox(height: 6),
                    SizedBox(
                        height: 36,
                        child: Row(children: [
                          Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primaryBlue),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            OrderCancellationDialog(
                                                order: _order,
                                                onSuccess: (updatedOrder) {
                                                  _order = updatedOrder;
                                                  setState(() {});
                                                }));
                                  },
                                  child: Text('Request Cancellation',
                                      style: _textTheme.bodySmall!.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400)))),
                          SizedBox(width: 8),
                          Expanded(
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          color: AppColors.primaryBlue)),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            CancelOrderPolicyDialog());
                                  },
                                  child: Text('Read cancellation policy',
                                      style: _textTheme.bodySmall!.copyWith(
                                          color: AppColors.primaryBlue,
                                          fontWeight: FontWeight.w400))))
                        ])),
                  ]),
              SizedBox(height: 16),
            ]));
  }

  Widget _buildRichText(
      {required String key, required String value, Color? valueColor}) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: '$key  ',
          style: _textTheme.bodySmall!.copyWith(
              color: AppColors.textColor,
              fontWeight: FontWeight.w300,
              fontFamily: AppConstants.ubuntuFontFamily)),
      TextSpan(
          text: value,
          style: _textTheme.bodySmall!.copyWith(
              color: valueColor ?? AppColors.primaryBlue,
              fontWeight: FontWeight.w700)),
    ]));
  }

  Widget _buildPatientLayout(
      {required MapEntry<OrderPatient, List<Product>> entry}) {
    final patient = entry.key;
    final products = entry.value;
    final report =
        _reports.firstWhereOrNull((element) => element.patientId == patient.id);

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: PatientTileLayout(
              patient: Patient(
                  name: patient.name.capitalize,
                  dob: patient.dob,
                  gender: patient.gender),
              actions: [
                SizedBox(
                    height: 28,
                    child: ElevatedButton(
                        onPressed: report?.reportFile == null ||
                                report!.reportFile.isEmpty
                            ? null
                            : () async {
                                try {
                                  final url =
                                      '${AppConstants.reportUrl}/${report.reportFile}';

                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    AppConstants.showSnackbar(
                                        text:
                                            'Unable to generate report. Please try again later',
                                        type: SnackbarType.error);
                                  }
                                } catch (e) {
                                  AppConstants.showSnackbar(
                                      text: e.toString(),
                                      type: SnackbarType.error);
                                }
                              },
                        child: Row(children: [
                          Icon(Icons.save_alt, size: 18),
                          SizedBox(width: 4),
                          Text(
                              report?.reportFile == null ||
                                      report!.reportFile.isEmpty
                                  ? 'Pending'
                                  : 'Download',
                              style: _textTheme.bodySmall!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white)),
                        ]))),
              ])),
      SizedBox(height: 10),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(12)),
          child: Text(
              products
                  .map((element) => element.title.clean)
                  .toList()
                  .join(', '),
              style: _textTheme.labelSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryBlue,
                  fontFamily: AppConstants.ubuntuFontFamily)))
    ]);
  }

  Future<void> _downloadInvoice() async {
    try {
      final url = '${AppConstants.invoiceUrl}/${_order.invoice}';

      if (await canLaunch(url)) {
        await launch(url);
      } else {
        AppConstants.showSnackbar(
            text: 'Unable to generate invoice for this order',
            type: SnackbarType.error);
      }
    } catch (e) {
      AppConstants.showSnackbar(text: e.toString(), type: SnackbarType.error);
    }
  }
}
