import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qris_health/constants/enums/order_status.dart';

part 'user_order_report.freezed.dart';
part 'user_order_report.g.dart';

@freezed
class UserOrderReport with _$UserOrderReport {
  const factory UserOrderReport(
          {@JsonKey(name: 'id') required int id,
          @JsonKey(name: 'user_id') required String userId,
          @JsonKey(name: 'doctor_id') required String doctorId,
          @JsonKey(name: 'order_id') required String orderId,
          @JsonKey(name: 'matelab_id') required String matelabId,
          @JsonKey(name: 'txn_id') String? txnId,
          @JsonKey(name: 'test_id') required String testId,
          @JsonKey(name: 'test_title') String? testTitle,
          @JsonKey(name: 'test_price') required double testPrice,
          @JsonKey(name: 'patient_id') String? patientId,
          @JsonKey(name: 'ptnt_name') required String ptntName,
          @JsonKey(name: 'ptnt_gender') required String ptntGender,
          @JsonKey(name: 'ptnt_dob') required String ptntDob,
          @JsonKey(name: 'order_date') String? orderDate,
          @JsonKey(name: 'report_date') required String reportDate,
          @JsonKey(name: 'report_status') required OrderStatus reportStatus,
          @JsonKey(name: 'report_file') required String reportFile,
          @JsonKey(name: 'sample_type') required String sampleType,
          @JsonKey(name: 'tube_type') required String tubeType,
          @JsonKey(name: 'status') required String status,
          @JsonKey(name: 'feedback_notification')
          required String feedbackNotification,
          @JsonKey(name: 'uploading_date') String? uploadingDate}) =
      _UserOrderReport;

  factory UserOrderReport.fromJson(Map<String, dynamic> json) =>
      _$UserOrderReportFromJson(json);
}
