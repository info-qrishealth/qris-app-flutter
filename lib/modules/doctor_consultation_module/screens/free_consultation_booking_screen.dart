import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/api_params.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';
import 'package:qris_health/generated/assets.dart';
import 'package:qris_health/modules/doctor_consultation_module/services/free_consultation_service.dart';
import 'package:qris_health/modules/orders_modele/models/order_status/order_status.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/styles/app_colors.dart';

class FreeConsultationBookingScreen extends StatefulWidget {
  final int orderId;
  final OrderStatus? orderStatus;

  const FreeConsultationBookingScreen({
    super.key,
    required this.orderId,
    this.orderStatus,
  });

  @override
  State<FreeConsultationBookingScreen> createState() =>
      _FreeConsultationBookingScreenState();
}

class _FreeConsultationBookingScreenState
    extends State<FreeConsultationBookingScreen> {
  final _textTheme = Get.textTheme;
  List<String> _selectedPatientIds = [];
  List<String> _bookedPatientIds = [];
  late final Future<OrderStatus?> _orderStatusFuture;
  bool _isSubmitting = false;
  bool _isLoadingBookedPatients = false;
  OrderStatus? _orderStatus;

  @override
  void initState() {
    super.initState();
    _orderStatus = widget.orderStatus;
    _loadBookedPatientIds();
    
    if (widget.orderStatus != null) {
      _orderStatusFuture = Future.value(widget.orderStatus);
      if (widget.orderStatus!.patients.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            // Find first patient with report generated and not booked
            final firstEligiblePatient = widget.orderStatus!.patients.firstWhere(
              (p) => p.reportGenerated && !_bookedPatientIds.contains(p.patientId),
              orElse: () => widget.orderStatus!.patients.first,
            );
            // Only select if report is generated and not booked
            if (firstEligiblePatient.reportGenerated && !_bookedPatientIds.contains(firstEligiblePatient.patientId)) {
              setState(() {
                _selectedPatientIds = [firstEligiblePatient.patientId];
              });
            }
          }
        });
      }
    } else {
      final userId = ApiParams.getInstance()?.userId?.toString() ?? '';
      if (userId.isEmpty) {
        _orderStatusFuture = Future.value(null);
        return;
      }
      
      _orderStatusFuture = FreeConsultationService.getOrderStatusByOrderId(
        orderId: widget.orderId,
        userId: userId,
      ).then((orderStatus) {
        if (mounted) {
          setState(() {
            _orderStatus = orderStatus;
          });
          
          if (orderStatus != null && orderStatus.patients.isNotEmpty) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                // Find first patient with report generated and not booked
                final firstEligiblePatient = orderStatus.patients.firstWhere(
                  (p) => p.reportGenerated && !_bookedPatientIds.contains(p.patientId),
                  orElse: () => orderStatus.patients.first,
                );
                // Only select if report is generated and not booked
                if (firstEligiblePatient.reportGenerated && !_bookedPatientIds.contains(firstEligiblePatient.patientId)) {
                  setState(() {
                    _selectedPatientIds = [firstEligiblePatient.patientId];
                  });
                }
              }
            });
          }
        }
        return orderStatus;
      }).catchError((error) {
        debugPrint('Error loading order status: $error');
        return null;
      });
    }
  }

  Future<void> _loadBookedPatientIds() async {
    setState(() {
      _isLoadingBookedPatients = true;
    });

    try {
      final bookedIds = await FreeConsultationService.getBookedPatientIds(
        orderId: widget.orderId,
      );
      
      if (mounted) {
        setState(() {
          _bookedPatientIds = bookedIds;
          // Remove any booked patients from selected list
          _selectedPatientIds.removeWhere((id) => bookedIds.contains(id));
        });
      }
    } catch (e) {
      debugPrint('Error loading booked patient IDs: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isLoadingBookedPatients = false;
        });
      }
    }
  }

  void _handleSelectionChanged(List<String> selectedPatientIds) {
    setState(() {
      _selectedPatientIds = selectedPatientIds;
    });
  }

  bool _hasSelectablePatients() {
    if (_orderStatus == null || _orderStatus!.patients.isEmpty) {
      return false;
    }
    return _orderStatus!.patients.any(
      (patient) => patient.reportGenerated && !_bookedPatientIds.contains(patient.patientId),
    );
  }

  bool _canSubmit() {
    return _selectedPatientIds.isNotEmpty && _hasSelectablePatients();
  }

  Future<void> _handleSubmit() async {
    if (_selectedPatientIds.isEmpty) {
      AppConstants.showSnackbar(
        text: 'Please select at least one patient',
        type: SnackbarType.warning,
      );
      return;
    }

    final userId = ApiParams.getInstance()?.userId;
    if (userId == null) {
      AppConstants.showSnackbar(
        text: 'User ID not found. Please login again.',
        type: SnackbarType.error,
      );
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final response = await FreeConsultationService.bookFreeConsultation(
        orderId: widget.orderId,
        patientIds: _selectedPatientIds,
        userId: userId,
      );

      final message = response['data']?['message'] ?? 
          'Free consultation booking submitted successfully for ${_selectedPatientIds.length} patient(s)';

      AppConstants.showSnackbar(
        text: message,
        type: SnackbarType.success,
      );

      // Reload booked patient IDs and navigate back after successful submission
      await _loadBookedPatientIds();
      
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          Navigator.of(context).pop(true);
        }
      });
    } catch (e) {
      AppConstants.showSnackbar(
        text: e.toString().replaceAll('Exception: ', ''),
        type: SnackbarType.error,
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Book Free Consultation'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.scaffoldPadding,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Transform.scale(
                  scale: 0.5,
                  child: Image.asset(
                    Assets.logosHorizontalLogo,
                  ),
                ),
              ),
              SizedBox(height: 24),
              FutureBuilder<OrderStatus?>(
                future: _orderStatusFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CircularProgressIndicator(
                          color: AppColors.primaryBlue,
                        ),
                      ),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Error loading order details',
                              style: _textTheme.bodyMedium?.copyWith(
                                color: AppColors.red,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8),
                            Text(
                              '${snapshot.error}',
                              style: _textTheme.bodySmall?.copyWith(
                                color: AppColors.red,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  final orderStatus = snapshot.data;

                  if (orderStatus == null) {
                    final userId = ApiParams.getInstance()?.userId?.toString() ?? '';
                    if (userId.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'User ID not found. Please login again.',
                            style: _textTheme.bodyMedium?.copyWith(
                              color: AppColors.red,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Order not found or unable to load order details.',
                          style: _textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }

                  if (orderStatus.patients.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'No patients found for this order',
                          style: _textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Select Patients: ',
                        style: _textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.borderColor),
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: orderStatus.patients.length,
                          separatorBuilder: (context, index) => Divider(
                            height: 1,
                            color: AppColors.borderColor,
                          ),
                          itemBuilder: (context, index) {
                            final patient = orderStatus.patients[index];
                            final isSelected = _selectedPatientIds.contains(patient.patientId);
                            final isBooked = _bookedPatientIds.contains(patient.patientId);
                            final isReportGenerated = patient.reportGenerated;
                            final isDisabled = isBooked || !isReportGenerated;

                            return InkWell(
                              onTap: isDisabled ? null : () {
                                setState(() {
                                  if (_selectedPatientIds.contains(patient.patientId)) {
                                    _selectedPatientIds.remove(patient.patientId);
                                  } else {
                                    _selectedPatientIds.add(patient.patientId);
                                  }
                                  _handleSelectionChanged(_selectedPatientIds);
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: Checkbox(
                                            value: isSelected,
                                            onChanged: isDisabled ? null : (_) {
                                              setState(() {
                                                if (_selectedPatientIds.contains(patient.patientId)) {
                                                  _selectedPatientIds.remove(patient.patientId);
                                                } else {
                                                  _selectedPatientIds.add(patient.patientId);
                                                }
                                                _handleSelectionChanged(_selectedPatientIds);
                                              });
                                            },
                                            activeColor: AppColors.primaryBlue,
                                            checkColor: Colors.white,
                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  patient.patientName,
                                                  style: _textTheme.bodyMedium?.copyWith(
                                                    fontWeight: FontWeight.w400,
                                                    color: isDisabled ? AppColors.lightGrey : Colors.black,
                                                  ),
                                                ),
                                              ),
                                              if (isBooked)
                                                Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.lightGrey.withOpacity(0.2),
                                                    borderRadius: BorderRadius.circular(4),
                                                  ),
                                                  child: Text(
                                                    'Booked',
                                                    style: _textTheme.labelSmall?.copyWith(
                                                      color: AppColors.lightGrey,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (!isReportGenerated && !isBooked)
                                      Padding(
                                        padding: const EdgeInsets.only(left: 36, top: 4),
                                        child: Text(
                                          'Report not generated yet',
                                          style: _textTheme.labelSmall?.copyWith(
                                            color: AppColors.lightGrey,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 24),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: (_isSubmitting || !_canSubmit()) ? null : _handleSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    disabledBackgroundColor: AppColors.primaryBlue.withOpacity(0.6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isSubmitting
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : Text(
                          'Submit',
                          style: _textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

