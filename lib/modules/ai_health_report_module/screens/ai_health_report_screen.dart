import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';
import 'package:qris_health/generated/assets.dart';
import 'package:qris_health/constants/enums/gender.dart';
import 'package:qris_health/modules/ai_health_report_module/services/ai_health_report_service.dart';
import 'package:qris_health/modules/patients_module/cubits/patients_cubit/patients_cubit.dart';
import 'package:qris_health/modules/patients_module/extensions/patient_extension.dart';
import 'package:qris_health/modules/patients_module/models/patient/patient.dart';
import 'package:qris_health/shared/components/outlined_icon_button.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';
import 'package:qris_health/shared/utils/mixins/general_helper_mixin.dart';
import 'package:qris_health/styles/app_colors.dart';

enum AiHealthReportState { loading, success, noData }

class AiHealthReportScreen extends StatefulWidget {
  final int reportId;
  final String? orderId;
  final String? patientId;
  final String? patientFirstName;
  final int? ageYears;
  final String? ageText; 
  final String? gender; 
  final String? testName;
  final DateTime? bookingDate;
  final String? bookingDateText; 
  
  const AiHealthReportScreen({
    super.key,
    required this.reportId,
    this.orderId,
    this.patientId,
    this.patientFirstName,
    this.ageYears,
    this.ageText,
    this.gender,
    this.testName,
    this.bookingDate,
    this.bookingDateText,
  });

  @override
  State<AiHealthReportScreen> createState() => _AiHealthReportScreenState();
}

class _AiHealthReportScreenState extends State<AiHealthReportScreen> with SingleTickerProviderStateMixin, GeneralHelperMixin {
  final _textTheme = Get.textTheme;
  AiHealthReportState _state = AiHealthReportState.loading;
  double _progress = 0;
  Timer? _pollingTimer;
  late AnimationController _orbitController;
  AiHealthReportResponse? _analysisData;
  String? _errorMessage;
  String _statusMessage = 'Initiating analysis...';
  String? _analysisReportId;
  bool _isPolling = false;

  @override
  void initState() {
    super.initState();
    _orbitController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();
    
    _fetchHealthReport();
  }

  @override
  void dispose() {
    _orbitController.dispose();
    _pollingTimer?.cancel();
    super.dispose();
  }

  Future<void> _fetchHealthReport() async {
    try {
      if (widget.orderId == null || widget.patientId == null) {
        throw Exception('Order ID and Patient ID are required');
      }
      
      final result = await AiHealthReportService.initiateAnalysis(
        orderId: widget.orderId!,
        patientId: widget.patientId!,
      );
    
    if (!mounted) return;
    
      // Check if we got cached data (returned immediately)
      if (result.isCached && result.cachedData != null) {
    setState(() {
          _analysisData = result.cachedData!;
      _state = AiHealthReportState.success;
          _progress = 1.0;
        });
        return;
      }
      
      // Otherwise, start polling for new analysis
      if (result.needsPolling && result.reportId != null) {
        setState(() {
          _analysisReportId = result.reportId;
          _statusMessage = 'Analysis initiated...';
        });
        _startPolling(result.reportId!);
      } else {
        throw Exception('Invalid response: No cached data or reportId received');
      }
    } catch (e) {
      if (!mounted) return;
      
      setState(() {
        _errorMessage = e.toString();
        _state = AiHealthReportState.noData;
      });
      
      // AppConstants.showSnackbar(
      //   text: 'Failed to initiate AI analysis: ${e.toString()}',
      //   type: SnackbarType.error,
      // );
    }
  }

  void _startPolling(String analysisReportId) {
    if (_isPolling) return;
    
    _isPolling = true;
    _pollForStatus(analysisReportId);
  }

  Future<void> _pollForStatus(String analysisReportId) async {
    try {
      final statusResponse = await AiHealthReportService.getAnalysisStatus(analysisReportId);
      
      if (!mounted) return;
      
      setState(() {
        _progress = statusResponse.progress / 100.0;
        _statusMessage = statusResponse.message;
      });

      if (statusResponse.status == 'completed') {
        // Analysis completed successfully
        _pollingTimer?.cancel();
        _isPolling = false;
        
        if (statusResponse.data != null) {
          setState(() {
            _analysisData = statusResponse.data;
            _state = AiHealthReportState.success;
            _progress = 1.0;
          });
        } else {
          throw Exception('Analysis completed but no data received');
        }
      } else if (statusResponse.status == 'failed') {
        // Analysis failed
        _pollingTimer?.cancel();
        _isPolling = false;
        
        setState(() {
          _errorMessage = statusResponse.error ?? 'Analysis failed';
          _state = AiHealthReportState.noData;
        });
        
        // AppConstants.showSnackbar(
        //   text: statusResponse.error ?? 'Analysis failed',
        //   type: SnackbarType.error,
        // );
      } else {
        // Still processing - poll again after 1.5 seconds
        _pollingTimer?.cancel();
        _pollingTimer = Timer(const Duration(milliseconds: 1500), () {
          _pollForStatus(analysisReportId);
        });
      }
    } catch (e) {
      if (!mounted) return;
      
      _pollingTimer?.cancel();
      _isPolling = false;
      
      setState(() {
        _errorMessage = e.toString();
        _state = AiHealthReportState.noData;
      });
      
      // AppConstants.showSnackbar(
      //   text: 'Failed to check analysis status: ${e.toString()}',
      //   type: SnackbarType.error,
      // );
    }
  }

  static String _getCategoryIcon(String category) {
    final categoryLower = category.toLowerCase();
    if (categoryLower.contains('sugar') || categoryLower.contains('glucose') || categoryLower.contains('glycemic') || categoryLower.contains('diabetes')) {
      return 'assets/images/icons/ai_health_report_analysis/sugar_cube.png';
    } else if (categoryLower.contains('blood') || categoryLower.contains('cbc') || categoryLower.contains('haematology')) {
      return 'assets/images/icons/ai_health_report_analysis/blood.svg';
    } else if (categoryLower.contains('urine')) {
      return 'assets/images/icons/ai_health_report_analysis/urine.svg';
    } else if (categoryLower.contains('liver') || categoryLower.contains('lft')) {
      return 'assets/images/icons/ai_health_report_analysis/liver.svg';
    } else if (categoryLower.contains('kidney') || categoryLower.contains('renal') || categoryLower.contains('kft')) {
      return 'assets/images/icons/ai_health_report_analysis/kidney.svg';
    } else if (categoryLower.contains('lipid') || categoryLower.contains('cholesterol')) {
      return 'assets/images/icons/ai_health_report_analysis/lipid.svg';
    } else if (categoryLower.contains('thyroid')) {
      return 'assets/images/icons/ai_health_report_analysis/thyroid.svg';
    } else if (categoryLower.contains('vitamin')) {
      return 'assets/images/icons/ai_health_report_analysis/vitamins.svg';
    } else if (categoryLower.contains('arthritis') || categoryLower.contains('joint')) {
      return 'assets/images/icons/ai_health_report_analysis/arthritis.svg';
    } else {
      return 'assets/images/icons/ai_health_report_analysis/others.svg';
    }
  }

  static Map<String, List<ConcerningParameter>> _groupByCategory(List<ConcerningParameter> parameters) {
    final grouped = <String, List<ConcerningParameter>>{};
    for (final param in parameters) {
      grouped.putIfAbsent(param.category, () => []).add(param);
    }
    return grouped;
  }

  TestDetail _convertToTestDetail(ConcerningParameter param) {
    final status = param.status.toLowerCase();
    final isHigh = status == 'high';
    final isLow = status == 'low';
    final isAbnormal = status == 'abnormal' || isHigh || isLow;
    
    return TestDetail(
      testName: param.testName,
      resultValueWithUnit: param.resultValue,
      normalRangeText: param.normalRange,
      understanding: param.understanding,
      recommendation: param.recommendation,
      status: param.status,
      isHigh: isHigh,
      isLow: isLow,
      isAbnormal: isAbnormal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEEFC),
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    final showTitle = _state != AiHealthReportState.loading;
    
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: Container(
        color: const Color(0xFFEFEEFC),
        child: Padding(
          padding: EdgeInsets.only(
            left: AppConstants.scaffoldPadding,
            right: AppConstants.scaffoldPadding,
            top: 8,
          ),
          child: AppBar(
            backgroundColor: const Color(0xFFEFEEFC),
            elevation: 0,
            centerTitle: false,
            leadingWidth: 44,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Color(0xFFF5E6FF),
              statusBarIconBrightness: Brightness.dark,
            ),
            leading: OutlinedIconButton(
              onTap: () {
                Navigator.of(context).pop();
              },
              backgroundColor: Colors.white,
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.lightText,
                size: 18,
              ),
            ),
            title: showTitle
                ? Text(
                    'AI Health Report',
                    style: _textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryBlue,
                    ),
                  )
                : null,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SizedBox(
                  width: 90,
                  height: 22,
                  child: Image.asset(
                    'assets/images/logos/horizontal_logo_crop.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_state) {
      case AiHealthReportState.loading:
        return _buildLoadingView();
      case AiHealthReportState.success:
        return _buildSuccessView();
      case AiHealthReportState.noData:
        return _buildNoDataFoundView();
    }
  }

  Widget _buildLoadingView() {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.scaffoldPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Analysing health report...',
                style: _textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 35),
              LayoutBuilder(builder: (context, constraints) {
                final double size = constraints.maxWidth; // occupy full screen width
                final double iconSize = 44;
                // keep icons fully inside: subtract half icon and small margin
                final double radius = (size / 2) - (iconSize / 2) - 8;

                return SizedBox(
                  width: size,
                  height: size,
                  child: AnimatedBuilder(
                    animation: _orbitController,
                    builder: (context, _) {
                      final angle = _orbitController.value * 2 * pi;
                      return Stack(
                        clipBehavior: Clip.none, // prevent cropping
                        alignment: Alignment.center,
                        children: [
                          // Halo scaled to fit inside radius comfortably
                          Transform.rotate(
                            angle: angle,
                            child: SizedBox(
                              width: radius * 2 - 12,
                              height: radius * 2 - 12,
                              child: CustomPaint(
                                painter: MedicalHalo(),
                              ),
                            ),
                          ),
                          _orbitIcon(
                            angle + 0,
                            'assets/images/icons/ai_health_report_analysis/float_bottle.png',
                            size / 2,
                            radius,
                            iconSize,
                          ),
                          _orbitIcon(
                            angle + pi / 2,
                            'assets/images/icons/ai_health_report_analysis/float_cells.png',
                            size / 2,
                            radius,
                            iconSize,
                          ),
                          _orbitIcon(
                            angle + pi,
                            'assets/images/icons/ai_health_report_analysis/float_butterfly.png',
                            size / 2,
                            radius,
                            iconSize,
                          ),
                          _orbitIcon(
                            angle + 3 * pi / 2,
                            'assets/images/icons/ai_health_report_analysis/float_blood.png',
                            size / 2,
                            radius,
                            iconSize,
                          ),
                          Image.asset(
                            'assets/images/icons/ai_health_report_analysis/center_robot.png',
                            width: min(120, radius), // keep robot within bounds
                            fit: BoxFit.contain,
                          ),
                        ],
                      );
                    },
                  ),
                );
              }),
              const SizedBox(height: 24),
              Text(
                'Analyzing your health data and generating personalized health report for you. Stay connected.',
                style: _textTheme.bodyMedium!.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _orbitIcon(double angle, String asset, double center, double radius, double iconSize) {
    return Positioned(
      left: center + cos(angle) * radius - (iconSize / 2),
      top: center + sin(angle) * radius - (iconSize / 2),
      child: Image.asset(asset, width: iconSize, height: iconSize, fit: BoxFit.contain),
    );
  }

  Widget _buildSuccessView() {
    if (_analysisData == null) {
      return const SizedBox.shrink();
    }

    final patientName = (widget.patientFirstName ?? '').split(' ').firstOrNull ?? '';
    final age = widget.ageYears;
    final testTitle = widget.testName ?? '';
    final bookingDate = widget.bookingDate;

    final groupedParams = _groupByCategory(_analysisData!.concerningParameters);
    final categoryEntries = groupedParams.entries.toList();
    
    // Sort categories so "Others" comes last
    categoryEntries.sort((a, b) {
      if (a.key.toLowerCase() == 'others') return 1;
      if (b.key.toLowerCase() == 'others') return -1;
      return a.key.compareTo(b.key);
    });

    return SafeArea(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.scaffoldPadding,
          vertical: 16,
        ),
        children: [
          _PatientInfoCard(
            name: patientName,
            ageYears: age,
            ageText: widget.ageText,
            gender: widget.gender,
            patientId: widget.patientId,
            testTitle: testTitle,
            bookingDate: bookingDate,
            bookingDateText: widget.bookingDateText,
          ),
          const SizedBox(height: 16),
          Text('Health Summary',
              style: _textTheme.titleLarge!
                  .copyWith(fontWeight: FontWeight.w700, color: AppColors.black)),
          const SizedBox(height: 10),
          Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 10,
                        offset: const Offset(0, 2))
                  ]),
              child: Text(
                  _analysisData!.executiveSummary,
                  style: _textTheme.bodyMedium!
                      .copyWith(color: AppColors.black, fontWeight: FontWeight.w400, height: 1.35))),
          if (categoryEntries.isNotEmpty) ...[
          const SizedBox(height: 20),
          Text('Concerning Parameters',
              style: _textTheme.titleLarge!
                  .copyWith(fontWeight: FontWeight.w700, color: AppColors.black)),
          const SizedBox(height: 20),
            ...categoryEntries.map((entry) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ConcerningCategorySection(
                categoryName: entry.key,
                categoryIcon: _getCategoryIcon(entry.key),
                tests: entry.value.map((param) => _convertToTestDetail(param)).toList(),
              ),
            )),
          ],
          if (_analysisData!.recommendations.isNotEmpty) ...[
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Suggested Test Packages',
                      style: _textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Recommended based on your report',
                      style: _textTheme.bodyMedium!.copyWith(
                        color: AppColors.lightSubTextColor,
                        fontWeight: FontWeight.w400,
                      ),
              ),
            ],
          ),
                
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 130,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: _analysisData!.recommendations.length,
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final recommendation = _analysisData!.recommendations[index];
                  return _buildPackageCard(recommendation: recommendation);
                },
              ),
            ),
          ],
          const SizedBox(height: 10),
          Row(children: [
            Text('Important Disclaimer ', style: _textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700, color: AppColors.black)),
            Text('*', style: _textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700, color: AppColors.red)),
          ]),
          const SizedBox(height: 10),
          Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                  color: const Color(0xFFfff2eb),
                  borderRadius: BorderRadius.circular(16)),
              child: Text(
                  'This AI generated health report by Qris Health is provided solely for informational and health awareness purposes. '
                  'It is not intended to diagnose, treat, cure, or prevent any disease and does not replace consultation with a qualified medical practitioner.\n\n'
                  'Laboratory results must always be interpreted along with your clinical condition, medical history, and physical examination by a licensed healthcare professional. Do not start, stop, or modify any medication, supplements, or treatment based on this report without consulting your doctor. \n\n'
                  'If you experience any symptoms, abnormal test values, or health concerns, please seek prompt medical advice.',
                  style: _textTheme.bodyMedium!
                      .copyWith(color: AppColors.black, fontWeight: FontWeight.w400, height: 1.35))),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildPackageCard({required Recommendation recommendation}) {
    return SizedBox(
      height: 130,
      width: 280,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recommendation.testName,
                      style: _textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryBlue,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/icons/ai_health_report_analysis/ai_icon.png',
                          width: 56,
                          height: 56,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            recommendation.explanation,
                            style: _textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: InkWell(
              onTap: () async {
                await openDialPad(phoneNumber: AppConstants.supportNumber);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.phone,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Call our team',
                    textAlign: TextAlign.center,
                    style: _textTheme.bodySmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        ),
      ),
    );
  }

  Widget _buildNoDataFoundView() {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.scaffoldPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Analysis Unavailable',
                style: _textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    'assets/images/icons/ai_health_report_analysis/question_mark.png',
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                  Image.asset(
                    'assets/images/icons/ai_health_report_analysis/Nothing_Found_Robot.png',
                    height: 180,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                'AI health insights are unavailable for this report',
                style: _textTheme.bodyMedium!.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MedicalHalo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const segments = 32;
    final radius = size.width / 2;

    const pastel = [
      Color(0xffc7d7ff),
      Color(0xffd5cbff),
      Color(0xffb8c7ff),
      Color(0xffe0d9ff),
      Color(0xffb6caff),
      Color(0xffdfe7ff),
    ];

    for (int i = 0; i < segments; i++) {
      paint.color = pastel[i % pastel.length];
      canvas.drawArc(
        Rect.fromCircle(center: Offset(radius, radius), radius: radius - 14),
        (2 * pi / segments) * i,
        pi / 14,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _PatientInfoCard extends StatelessWidget {
  final String? name;
  final int? ageYears;
  final String? ageText;
  final String? gender;
  final String? testTitle;
  final DateTime? bookingDate;
  final String? bookingDateText;
  final String? patientId;

  const _PatientInfoCard({
    required this.name,
    required this.ageYears,
    required this.ageText,
    required this.gender,
    required this.testTitle,
    required this.bookingDate,
    required this.bookingDateText,
    this.patientId,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;
    
    String? effectiveGender = gender;
    
    if ((effectiveGender == null || effectiveGender.isEmpty) && patientId != null) {
      try {
        final patientsCubit = context.read<PatientsCubit>();
        final patientIdInt = int.tryParse(patientId!);
        if (patientIdInt != null) {
          final patient = patientsCubit.getPatientByPatientId(patientId: patientIdInt);
          effectiveGender = patient?.gender;
        }
      } catch (e) {
        debugPrint('Error fetching patient gender from DB: $e');
      }
    }
    
    final tempPatient = Patient(gender: effectiveGender);
    final genderEnum = tempPatient.genderEnum;
    final profileIconPath = genderEnum == Gender.MALE
        ? 'assets/images/placeholders/male_placeholder.png'
        : 'assets/images/placeholders/female_placeholder.png';
    final genderText = genderEnum?.name.formattedEnumName ?? '';
    
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.primaryBlue, AppColors.primaryPink])),
        padding: const EdgeInsets.all(14),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                profileIconPath,
                height: 28,
                width: 28,
              ),
              const SizedBox(width: 12),
              Expanded(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${name ?? ''} ${ageText != null && ageText!.isNotEmpty ? '| $ageText, ' : (ageYears != null ? '| ${ageYears}Y, ' : '')}${genderText.isNotEmpty ? genderText : ''}',
                  style: textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.w700, color: Colors.white)),
              Text(testTitle ?? '',
                  style: textTheme.labelSmall!
                      .copyWith(fontWeight: FontWeight.w400, color: Colors.white)),
              Row(children: [
                const Icon(Icons.calendar_today_rounded,
                    size: 12, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                    bookingDateText ??
                        (bookingDate != null
                            ? DateFormat('d MMM y').format(bookingDate!.toLocal())
                            : ''),
                    style: textTheme.labelSmall!
                        .copyWith(fontWeight: FontWeight.w500, color: Colors.white))
              ])
                  ],
                ),
              ),
            ]));
  }
}

class ConcerningCategorySection extends StatefulWidget {
  final String categoryName;
  final String categoryIcon;
  final List<TestDetail> tests;
  const ConcerningCategorySection({
    super.key, 
    required this.categoryName, 
    required this.categoryIcon,
    required this.tests,
  });

  @override
  State<ConcerningCategorySection> createState() => _ConcerningCategorySectionState();
}

class _ConcerningCategorySectionState extends State<ConcerningCategorySection> {
  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;
    final isSvg = widget.categoryIcon.endsWith('.svg');
    
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          if (isSvg)
            SvgPicture.asset(
              widget.categoryIcon,
              height: 26,
              width: 26,
            )
          else
          Image.asset(
              widget.categoryIcon,
            height: 26,
            width: 26,
          ),
          const SizedBox(width: 8),
          Text(widget.categoryName.toUpperCase(),
              style: textTheme.titleMedium!.copyWith(
                  color: AppColors.primaryBlue, fontWeight: FontWeight.w700)),
        ],
      ),
      const SizedBox(height: 8),
      ...widget.tests.asMap().entries.map((entry) => _TestTile(
        detail: entry.value,
        isExpanded: _expandedIndex == entry.key,
        onExpansionChanged: (expanded) {
          setState(() {
            _expandedIndex = expanded ? entry.key : null;
          });
        },
      )).toList(),
    ]);
  }
}

class TestDetail {
  final String testName;
  final String resultValueWithUnit;
  final String normalRangeText;
  final String understanding;
  final String recommendation;
  final String status;
  final bool isHigh;
  final bool isLow;
  final bool isAbnormal;
  const TestDetail({
    required this.testName,
    required this.resultValueWithUnit,
    required this.normalRangeText,
    required this.understanding,
    required this.recommendation,
    required this.status,
    required this.isHigh,
    required this.isLow,
    required this.isAbnormal,
  });
}

class _TestTile extends StatefulWidget {
  final TestDetail detail;
  final bool isExpanded;
  final Function(bool) onExpansionChanged;
  
  const _TestTile({
    required this.detail,
    required this.isExpanded,
    required this.onExpansionChanged,
  });

  @override
  State<_TestTile> createState() => _TestTileState();
}

class _TestTileState extends State<_TestTile> {
  late bool _internalExpanded;

  @override
  void initState() {
    super.initState();
    _internalExpanded = widget.isExpanded;
  }

  @override
  void didUpdateWidget(_TestTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isExpanded != widget.isExpanded) {
      _internalExpanded = widget.isExpanded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;
    final d = widget.detail;
    final arrow = d.isHigh ? Icons.arrow_upward : (d.isLow ? Icons.arrow_downward : Icons.check);
    final arrowColor = const Color(0xFFEF0202);

    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 2))
            ]),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            key: ValueKey('test_tile_${widget.detail.testName}_${widget.isExpanded}'),
            initiallyExpanded: _internalExpanded,
            tilePadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
            childrenPadding:
                const EdgeInsets.only(left: 14, right: 4, bottom: 12, top: 0),
            dense: true,
            trailing: Align(
              alignment: Alignment.topRight,
              widthFactor: 1.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 0, top: 0),
                child: Transform.translate(
                  offset: const Offset(-8, 0),
                child: Icon(
                    _internalExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: AppColors.primaryBlue,
                  size: 24,
                ),
              ),
            ),
            ),
            onExpansionChanged: (expanded) {
              setState(() {
                _internalExpanded = expanded;
              });
              widget.onExpansionChanged(expanded);
            },
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text(d.testName,
                            style: textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.w700, color: AppColors.black))),
                    const SizedBox(width: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(d.resultValueWithUnit,
                            style: textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.w700, color: Color(0xFFEF0202))),
                        if (d.isHigh || d.isLow) ...[
                          const SizedBox(width: 4),
                        Transform.scale(
                          scale: 1.0,
                          child: Icon(arrow, size: 18, color: arrowColor),
                        )
                        ]
                      ])
                  ]),
                if (d.normalRangeText.toUpperCase() != 'NA') ...[
                const SizedBox(height: 3),
                RichText(
                    text: TextSpan(style: textTheme.bodySmall, children: [
                  TextSpan(
                      text: 'Normal Range: ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: AppColors.lightSubTextColor)),
                  TextSpan(
                      text: d.normalRangeText,
                      style: TextStyle(
                          fontWeight: FontWeight.w700, color: AppColors.lightSubTextColor)),
                ])),
                ]
              ],
            ),
            children: [
              const SizedBox(height: 8),
              Divider(height: 1, thickness: 1, color: AppColors.borderColor),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/icons/ai_health_report_analysis/lab_test.png',
                      height: 22,
                      width: 22,
                    ),
                    const SizedBox(width: 8),
                    Text('Understanding This Test',
                        style: textTheme.bodyMedium!
                            .copyWith(fontWeight: FontWeight.w600, color: AppColors.black)),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(d.understanding,
                    textAlign: TextAlign.left,
                    style: textTheme.bodyMedium!.copyWith(
                        color: AppColors.black, fontWeight: FontWeight.w400, height: 1.35)),
              ),
              const SizedBox(height: 14),
              Divider(height: 1, thickness: 1, color: AppColors.borderColor),
              const SizedBox(height: 14),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/icons/ai_health_report_analysis/recom_action.png',
                      height: 22,
                      width: 22,
                    ),
                    const SizedBox(width: 8),
                    Text('Recommended action',
                        style: textTheme.bodyMedium!
                            .copyWith(fontWeight: FontWeight.w600, color: AppColors.black)),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(d.recommendation,
                    textAlign: TextAlign.left,
                    style: textTheme.bodyMedium!.copyWith(
                        color: AppColors.black, fontWeight: FontWeight.w400, height: 1.35)),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ));
  }
}

