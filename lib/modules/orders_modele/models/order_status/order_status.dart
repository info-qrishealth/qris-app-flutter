import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_status.freezed.dart';
part 'order_status.g.dart';

@freezed
class OrderStatus with _$OrderStatus {
  const factory OrderStatus({
    @JsonKey(name: 'orderId') required int orderId,
    @JsonKey(name: 'orderDate') required DateTime orderDate,
    @JsonKey(name: 'bookingSlotDate') required String bookingSlotDate,
    @JsonKey(name: 'bookingSlotTime') String? bookingSlotTime,
    @JsonKey(name: 'bookingAddress') required String bookingAddress,
    @JsonKey(name: 'overallStatus') required String overallStatus,
    @JsonKey(name: 'reportGeneratedDate') DateTime? reportGeneratedDate,
    @JsonKey(name: 'phlebo') PhleboInfo? phlebo,
    @JsonKey(name: 'patients') required List<PatientStatus> patients,
  }) = _OrderStatus;

  factory OrderStatus.fromJson(Map<String, dynamic> json) => _$OrderStatusFromJson(json);
}

@freezed
class PhleboInfo with _$PhleboInfo {
  const factory PhleboInfo({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'mobile') required String mobile,
  }) = _PhleboInfo;

  factory PhleboInfo.fromJson(Map<String, dynamic> json) => _$PhleboInfoFromJson(json);
}

@freezed
class PatientStatus with _$PatientStatus {
  const factory PatientStatus({
    @JsonKey(name: 'patientId') required String patientId,
    @JsonKey(name: 'patientName') required String patientName,
    @JsonKey(name: 'patientGender') required String patientGender,
    @JsonKey(name: 'patientDob') required String patientDob,
    @JsonKey(name: 'sampleCollected') required bool sampleCollected,
    @JsonKey(name: 'reportGenerated') required bool reportGenerated,
    @JsonKey(name: 'allReportsGenerated') bool? allReportsGenerated,
    @JsonKey(name: 'tests') required List<TestStatus> tests,
  }) = _PatientStatus;

  factory PatientStatus.fromJson(Map<String, dynamic> json) => _$PatientStatusFromJson(json);
}

@freezed
class TestStatus with _$TestStatus {
  const factory TestStatus({
    @JsonKey(name: 'testId') required String testId,
    @JsonKey(name: 'testTitle') String? testTitle,
    @JsonKey(name: 'barcode') String? barcode,
    @JsonKey(name: 'reportStatus') required String reportStatus,
  }) = _TestStatus;

  factory TestStatus.fromJson(Map<String, dynamic> json) => _$TestStatusFromJson(json);
}
