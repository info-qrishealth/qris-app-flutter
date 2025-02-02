// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_order_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserOrderReportImpl _$$UserOrderReportImplFromJson(
        Map<String, dynamic> json) =>
    _$UserOrderReportImpl(
      id: (json['id'] as num).toInt(),
      userId: json['user_id'] as String,
      doctorId: json['doctor_id'] as String,
      orderId: json['order_id'] as String,
      matelabId: json['matelab_id'] as String,
      txnId: json['txn_id'] as String?,
      testId: json['test_id'] as String,
      testTitle: json['test_title'] as String?,
      testPrice: (json['test_price'] as num).toDouble(),
      patientId: json['patient_id'] as String?,
      ptntName: json['ptnt_name'] as String,
      ptntGender: json['ptnt_gender'] as String,
      ptntDob: json['ptnt_dob'] as String,
      orderDate: json['order_date'] as String?,
      reportDate: json['report_date'] as String,
      reportStatus: $enumDecode(_$OrderStatusEnumMap, json['report_status']),
      reportFile: json['report_file'] as String,
      sampleType: json['sample_type'] as String,
      tubeType: json['tube_type'] as String,
      status: json['status'] as String,
      feedbackNotification: json['feedback_notification'] as String,
      uploadingDate: json['uploading_date'] as String?,
    );

Map<String, dynamic> _$$UserOrderReportImplToJson(
        _$UserOrderReportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'doctor_id': instance.doctorId,
      'order_id': instance.orderId,
      'matelab_id': instance.matelabId,
      'txn_id': instance.txnId,
      'test_id': instance.testId,
      'test_title': instance.testTitle,
      'test_price': instance.testPrice,
      'patient_id': instance.patientId,
      'ptnt_name': instance.ptntName,
      'ptnt_gender': instance.ptntGender,
      'ptnt_dob': instance.ptntDob,
      'order_date': instance.orderDate,
      'report_date': instance.reportDate,
      'report_status': _$OrderStatusEnumMap[instance.reportStatus]!,
      'report_file': instance.reportFile,
      'sample_type': instance.sampleType,
      'tube_type': instance.tubeType,
      'status': instance.status,
      'feedback_notification': instance.feedbackNotification,
      'uploading_date': instance.uploadingDate,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.success: 'success',
  OrderStatus.complete: 'complete',
  OrderStatus.cancel: 'cancel',
};
