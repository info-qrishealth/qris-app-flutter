import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/order_status.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';
import 'package:qris_health/generated/assets.dart';
import 'package:qris_health/modules/address_module/models/address/address.dart';
import 'package:qris_health/modules/ai_health_report_module/screens/ai_health_report_screen.dart';
import 'package:qris_health/modules/cart_module/components/patient_tile_layout.dart';
import 'package:qris_health/modules/orders_modele/components/order_cancellation_dialog.dart';
import 'package:qris_health/modules/orders_modele/models/order/order.dart';
import 'package:qris_health/modules/orders_modele/models/order_info/order_info.dart';
import 'package:qris_health/modules/orders_modele/models/user_order_report/user_order_report.dart';
import 'package:qris_health/modules/orders_modele/services/order_service.dart';
import 'package:qris_health/constants/enums/gender.dart';
import 'package:qris_health/modules/patients_module/cubits/patients_cubit/patients_cubit.dart';
import 'package:qris_health/modules/patients_module/extensions/patient_extension.dart';
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
  final bool initiallyExpanded;
  final String? overallStatus;
  
  const OrderListTile({
    super.key, 
    required this.order,
    this.initiallyExpanded = false,
    this.overallStatus,
  });

  @override
  State<OrderListTile> createState() => _OrderListTileState();
}

class _OrderListTileState extends State<OrderListTile> {
  final _textTheme = Get.textTheme;
  List<UserOrderReport> _reports = [];
  late Order _order;
  bool _reportsFetched = false;

  @override
  void initState() {
    super.initState();
    _order = widget.order;

    if (widget.initiallyExpanded) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _fetchReports();
      });
    }

    final patientCubit = BlocProvider.of<PatientsCubit>(context);
    if (patientCubit.state is! PatientsLoaded) {
      patientCubit.getAllPatientsForUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isCancelled = widget.overallStatus == 'Order Cancelled' ||
        _order.orderStatus == OrderStatus.cancel;
    final address = Address.fromJson(
        AppConstants.decodeBase64(encodedString: _order.bookingAddress) ?? {});
    final slots = _order.bookingSlotTime?.split('-');
    final from = slots?.firstOrNull;
    final to = slots != null && slots.length > 1 ? slots[1] : null;

    final bookingSlotDateRaw = _order.bookingSlotDate;
    String? formattedBookingDate;
    if (bookingSlotDateRaw != null && bookingSlotDateRaw.isNotEmpty) {
      formattedBookingDate = DateTime.tryParse(bookingSlotDateRaw)
              ?.toLocal()
              .getFormattedDatedMMMy ??
          bookingSlotDateRaw;
    }
    final formattedOrderDate = _order.orderDate.toLocal().getFormattedDatedMMMy;
    final displayDate = formattedBookingDate ?? formattedOrderDate;

    final fromTime = from?.toDateTime?.toLocal().getTimeStringFromDateTimeString;
    final toTime = to?.toDateTime?.toLocal().getTimeStringFromDateTimeString;

    final slotText = (fromTime != null && toTime != null)
        ? '$fromTime - $toTime'
        : 'Slot not assigned yet';
    
    final decodedOrderInfo =
        AppConstants.decodeBase64(encodedString: _order.productRecord);
    
    OrderInfo? orderInfo;
    try {
      orderInfo = decodedOrderInfo == null ? null : OrderInfo.fromJson(decodedOrderInfo);
    } catch (e) {
      debugPrint('Error parsing order info for order ${_order.id}: $e');
    }
    
    if (_order.productRecord == null) {
      debugPrint(
          'Order ${_order.id} has null productRecord. Status: ${_order.orderStatus.name}, IsCancelled: $isCancelled, Date: ${_order.orderDate}');
    } else if (decodedOrderInfo == null) {
      debugPrint('Order ${_order.id} has productRecord but failed to decode. Length: ${_order.productRecord?.length}');
    }
    
    final Map<OrderPatient, List<Product>> patientAndTestsMap = {};

    if (orderInfo != null) {
      for (var orderInfoEntry in orderInfo.data.entries) {
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
    }

    return Container(
        decoration: BoxDecoration(
            color: isCancelled
                ? Color(0xffff726D).withOpacity(0.08)
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderColor)),
        child: ExpansionTile(
            initiallyExpanded: widget.initiallyExpanded,
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
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xffff726D).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.red, width: 1),
                    ),
                    child: Text(
                      'Cancelled',
                      style: _textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.red,
                      ),
                    ),
                  ),
                ),
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
              if (isExpanded && !_reportsFetched) {
                _fetchReports();
              }
            },
            children: [
              CommonDivider(),
              SizedBox(height: 10),
              if (!isCancelled) ...[
                _buildStatusProgress(),
                SizedBox(height: 5),
                CommonDivider(),
              ],
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Booking Details',
                      style: _textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontFamily: AppConstants.ubuntuFontFamily)),
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
                              Image.asset(
                                'assets/images/icons/bill.png',
                                width: 18,
                                height: 18,
                              ),
                              SizedBox(width: 4),
                              Text('Invoice',
                                  style: _textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white))
                            ])))
                ]),
              SizedBox(height: 8),
              FeatureRow(
                  svgPath: Assets.drawerIconsLocationIcon,
                  title:
                      _buildAddressLine(address),
                  fontColor: AppColors.textColor),
              SizedBox(height: 6),
              FeatureRow(
                  svgPath: Assets.iconsClockIcon,
                  title:
                      '$displayDate ($slotText)',
                  fontColor: AppColors.textColor),
              SizedBox(height: 10),
              if (patientAndTestsMap.isEmpty && _order.productRecord != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Unable to load order details. Please contact support.',
                    style: _textTheme.bodySmall!.copyWith(
                      color: AppColors.red,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )
              else if (patientAndTestsMap.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'No product details available for this order.',
                    style: _textTheme.bodySmall!.copyWith(
                      color: AppColors.textColor.withOpacity(0.6),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )
              else
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
                    title: 'Order Total',
                    value: '₹${_order.orderTotal.toInt()}'),
                if (_order.couponCode != null && _order.couponCode!.isNotEmpty)
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 4),
                        SummaryInfoRow(
                            title: 'Coupon Code',
                            value: '${_order.couponCode}'),
                      ]),
                if (_order.couponAmount != null && _order.couponAmount != 0)
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 4),
                        SummaryInfoRow(
                            title: 'Coupon Amount',
                            value: '-₹${_order.couponAmount}',
                            color: Colors.green),
                      ]),
                SizedBox(height: 4),
                SummaryInfoRow(
                    title: 'Collection Charges',
                    value:
                        '₹${_order.collectionCharge.isEmpty ? 0 : _order.collectionCharge}'),
                SizedBox(height: 4),
                SummaryInfoRow(
                    title: 'Hard Copy Charges',
                    value:
                        '₹${_order.hardCopy == null || _order.hardCopy!.isEmpty ? 0 : _order.hardCopy}'),
                if (_order.qrisCoinsPaid != 0)
                  Column(children: [
                    SizedBox(height: 4),
                    SummaryInfoRow(
                        title: 'Qris Coins Paid',
                        value: '₹${_order.qrisCoinsPaid ?? '0'}'),
                  ]),
                if (_order.walletPaid != 0)
                  Column(children: [
                    SizedBox(height: 4),
                    SummaryInfoRow(
                        title: 'Wallet Paid',
                        value: '₹${_order.walletPaid ?? '0'}'),
                  ]),
                SizedBox(height: 4),
                Row(children: [
                  Expanded(
                      child: Text(
                          'Amount paid (${_order.paymentMode.toUpperCase()})',
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

    final reportExists = report?.reportFile != null && report!.reportFile.isNotEmpty;
    final isReportPending = report?.reportFile == null || report!.reportFile.isEmpty;
    
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                (() {
                  final tempPatient = Patient(gender: patient.gender);
                  return tempPatient.genderEnum == Gender.MALE
                      ? 'assets/images/placeholders/male_placeholder.png'
                      : 'assets/images/placeholders/female_placeholder.png';
                })(),
                height: 20,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${patient.name.capitalize}',
                        style: _textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontFamily: AppConstants.ubuntuFontFamily)),
                    SizedBox(height: 4),
                    Row(children: [
                      Text(
                          (() {
                            final tempPatient = Patient(gender: patient.gender);
                            return tempPatient.genderEnum?.name.formattedEnumName ?? 'N/A';
                          })(),
                          style: _textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.lightSubTextColor,
                              fontFamily: AppConstants.ubuntuFontFamily)),
                      SizedBox(width: 8),
                      Container(
                          margin: EdgeInsets.only(top: 2),
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                              color: AppColors.black, shape: BoxShape.circle)),
                      SizedBox(width: 8),
                      Text(
                          patient.dob?.toDateTime.formattedAge ?? 'N/A',
                          style: _textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.lightSubTextColor,
                              fontFamily: AppConstants.ubuntuFontFamily)),
                    ]),
                  ],
                ),
              ),
            ],
          )),
      SizedBox(height: 5),
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
                  fontFamily: AppConstants.ubuntuFontFamily))),
      SizedBox(height: 10),
      Row(
        children: [
          Expanded(
            child: SizedBox(
                height: 36,
                child: OutlinedButton(
                    onPressed: isReportPending
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
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: isReportPending
                              ? Colors.grey[400]!
                              : AppColors.primaryBlue),
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.save_alt,
                              size: 18,
                              color: isReportPending
                                  ? Colors.grey[600]!
                                  : AppColors.primaryBlue),
                          SizedBox(width: 4),
                          Flexible(
                            child: Text(
                                isReportPending
                                    ? 'Report Pending'
                                    : 'Download Report',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: _textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: isReportPending
                                        ? Colors.grey[600]!
                                        : AppColors.primaryBlue)),
                          ),
                        ]))),
          ),
          SizedBox(width: 8),
          Expanded(
            child: SizedBox(
                height: 36,
                child: OutlinedButton(
                    onPressed: isReportPending
                        ? null
                        : () {
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (context) => AiHealthReportScreen(
                                  reportId: report.id,
                                  orderId: report.orderId,
                                  patientId: report.patientId,
                                  patientFirstName:
                                      (patient.name.split(' ').first),
                                  ageText: (() {
                                    final ageStr =
                                        patient.dob?.toDateTime.formattedAge;
                                    return ageStr?.split(' ').first;
                                  })(),
                                  gender: patient.gender ?? '',
                                  testName: products
                                      .map((e) => e.title.clean)
                                      .toList()
                                      .join(' + '),
                                  bookingDate: _order.orderDate.toLocal(),
                                  bookingDateText: DateFormat()
                                      .add_d()
                                      .add_MMM()
                                      .add_y()
                                      .format(_order.orderDate.toLocal()),
                                ),
                              ),
                            );
                          },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: isReportPending
                              ? Colors.grey[400]!
                              : Colors.transparent),
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: Container(
                      decoration: isReportPending
                          ? BoxDecoration(
                              color: Color(0xFFBFBFBF),
                              borderRadius: BorderRadius.circular(20),
                            )
                          : BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xF5411E75),
                                  Color(0xFFB23C97),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              isReportPending
                                  ? 'assets/images/icons/sparkle_black.png'
                                  : 'assets/images/icons/sparkle.png',
                              width: 16,
                              height: 16,
                            ),
                            SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                'AI Report Insights',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: _textTheme.bodySmall!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: isReportPending
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ]),
                    ))),
          ),
        ],
      ),
      SizedBox(height: 8),

    ]);
  }

  Future<void> _downloadInvoice() async {
    try {
      final uri = Uri.parse('${AppConstants.invoiceUrl}/${_order.invoice}');

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        AppConstants.showSnackbar(
            text: 'Unable to generate invoice for this order',
            type: SnackbarType.error);
      }
    } catch (e) {
      AppConstants.showSnackbar(text: e.toString(), type: SnackbarType.error);
    }
  }

  int _getCurrentStatusLevel() {
    if (widget.overallStatus == 'Order Cancelled' ||
        _order.orderStatus == OrderStatus.cancel) {
      return 0;
    }

    // If we have the actual status from home screen, use it.
    // "Report Generated" falls back to reports once they are fetched.
    if (widget.overallStatus != null) {
      switch (widget.overallStatus) {
        case 'Order Booked':
          return 1;
        case 'Phlebo Assigned':
          return 2;
        case 'Sample Collected':
          return 3;
        case 'Report Generated':
          if (!_reportsFetched) {
            return 4;
          }
          break;
        // case 'Report Generated':
        //   return 4;
        default:
          return 1;
      }
    }
    
    // Otherwise calculate from reports
    if (_reports.isNotEmpty) {
      final hasReport = _reports.any(
          (report) => report.reportFile.isNotEmpty && report.reportFile.trim() != '');
      if (hasReport) return 4; // Report Generated
      
      final allSamplesCollected = _reports.every(
          (report) => report.status.toLowerCase().contains('sample') ||
              report.status.toLowerCase().contains('collect') ||
              report.reportFile.isNotEmpty);
      
      final anySampleCollected = _reports.any(
          (report) => report.status.toLowerCase().contains('sample') ||
              report.status.toLowerCase().contains('collect'));
      
      if (allSamplesCollected && anySampleCollected) return 3; // Sample Collected
      
      // If reports exist but not collected, check order status
      if (_order.orderStatus == OrderStatus.success) {
        return 1; // Just booked, reports created but no phlebo yet
      }
      return 2; // Phlebo Assigned
    }
    
    // If order is complete
    if (_order.orderStatus == OrderStatus.complete) {
      return 4;
    }

    // Default: Order just booked
    return 1;
  }

  Future<void> _fetchReports() async {
    if (_reportsFetched) return;

    try {
      final reports = await OrderService.getUserReportsByOrderId(
          orderId: _order.id.toString());

      if (!mounted) return;

      setState(() {
        _reports = reports;
        _reportsFetched = true;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _reportsFetched = true;
      });
      AppConstants.showSnackbar(
          text: e.toString(), type: SnackbarType.error);
    }
  }

  Widget _buildStatusProgress() {
    final isCancelled = widget.overallStatus == 'Order Cancelled' ||
        _order.orderStatus == OrderStatus.cancel;

    if (isCancelled) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'This booking was cancelled',
            style: _textTheme.bodySmall?.copyWith(
              color: const Color(0xFF832C2C),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'If you think this is a mistake, please contact support.',
            style: _textTheme.labelSmall?.copyWith(
              color: const Color(0xFF832C2C).withOpacity(0.8),
            ),
          ),
        ],
      );
    }

    final statuses = [
      'Order Booked',
      'Phlebo Assigned',
      'Sample Collected',
      'Report Generated'
    ];

    final currentLevel = _getCurrentStatusLevel();
    final inactiveColor = AppColors.textColor.withOpacity(0.18);
    final activeColor = AppColors.textColor.withOpacity(0.95);

    return LayoutBuilder(builder: (context, constraints) {
      final baseFontSize = _textTheme.bodySmall?.fontSize ?? 12;
      final isSmallScreen = constraints.maxWidth < 350;
      final compactFontSize =
          ((baseFontSize - (isSmallScreen ? 4 : 3)).clamp(6.0, baseFontSize)).toDouble();
      final displayFontSize = isSmallScreen ? compactFontSize : (baseFontSize * 0.85);
      final dashCount = isSmallScreen ? 2 : 3;

     return Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    // ---- ROW WITH TEXTS AND DASHES ----
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(statuses.length * 2 - 1, (index) {
        if (index.isOdd) {
          final rightStatusIndex = (index + 1) ~/ 2;
          final isCompleted = rightStatusIndex < currentLevel;

          return Flexible(
            flex: isSmallScreen ? 1 : 2,
            child: CustomPaint(
              size: Size(double.infinity, 1),
              painter: DottedLinePainter(
                color: isCompleted
                    ? AppColors.textColor.withOpacity(0.95)
                    : inactiveColor,
                dashCount: dashCount,
              ),
            ),
          );
        }

        final statusIndex = index ~/ 2;
        final isActive = statusIndex < currentLevel;

        return Flexible(
          fit: FlexFit.loose,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 2.0 : 4.0),
            child: Text(
              statuses[statusIndex],
              maxLines: 2,
              overflow: TextOverflow.visible,
              softWrap: true,
              textAlign: TextAlign.center,
              style: _textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w700,
                color: isActive ? activeColor : inactiveColor,
                fontSize: displayFontSize,
                height: 1.2,
              ),
            ),
          ),
        );
      }),
    ),

    const SizedBox(height: 6),

    // ---- ROW WITH TICKS ----
    Row(
      children: List.generate(statuses.length * 2 - 1, (index) {
        if (index.isOdd) {
          return const Expanded(child: SizedBox());
        }

        final statusIndex = index ~/ 2;
        final isActive = statusIndex < currentLevel;

        return Flexible(
          fit: FlexFit.tight,
          child: Center(
            child: isActive
                ? Container(
                    width: 18,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: Color(0xFF2EAE4E),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.check, size: 12, color: Colors.white),
                  )
                : const SizedBox(height: 18),
          ),
        );
      }),
    ),
  ],
);

    });
  }

  String _buildAddressLine(Address address) {
    final segments = <String>[
      if (address.house != null && address.house!.trim().isNotEmpty)
        address.house!.trim(),
      if (address.address1 != null && address.address1!.trim().isNotEmpty)
        address.address1!.trim(),
      if (address.address2 != null && address.address2!.trim().isNotEmpty)
        address.address2!.trim(),
      if (address.landmark != null && address.landmark!.trim().isNotEmpty)
        address.landmark!.trim(),
      if (address.pincode != null && address.pincode!.trim().isNotEmpty)
        address.pincode!.trim(),
      if (address.state != null && address.state!.trim().isNotEmpty)
        address.state!.trim(),
    ];

    if (segments.isEmpty) {
      return 'Address details not available';
    }

    return segments.join(', ');
  }
}

class DottedLinePainter extends CustomPainter {
  final Color color;
  final int dashCount;

  DottedLinePainter({required this.color, this.dashCount = 4});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final dashWidth = dashCount == 2 ? 2.0 : 3.0;
    final spaceWidth = dashCount == 2 ? 2.0 : 3.0;
    final totalDashWidth = dashWidth * dashCount;
    final totalSpaceWidth = spaceWidth * (dashCount - 1);
    final totalWidth = totalDashWidth + totalSpaceWidth;
    
    // Center the dashes
    double startX = (size.width - totalWidth) / 2;
    startX = startX.clamp(0.0, size.width);
    
    for (int i = 0; i < dashCount; i++) {
      if (startX + dashWidth <= size.width) {
        canvas.drawLine(
          Offset(startX, size.height / 2),
          Offset(startX + dashWidth, size.height / 2),
          paint,
        );
      }
      startX += dashWidth + spaceWidth; // dash + space
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
