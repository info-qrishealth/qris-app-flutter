// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderStatusImpl _$$OrderStatusImplFromJson(Map<String, dynamic> json) =>
    _$OrderStatusImpl(
      orderId: (json['orderId'] as num).toInt(),
      orderDate: DateTime.parse(json['orderDate'] as String),
      bookingSlotDate: json['bookingSlotDate'] as String,
      bookingSlotTime: json['bookingSlotTime'] as String?,
      bookingAddress: json['bookingAddress'] as String,
      overallStatus: json['overallStatus'] as String,
      reportGeneratedDate: json['reportGeneratedDate'] == null
          ? null
          : DateTime.parse(json['reportGeneratedDate'] as String),
      phlebo: json['phlebo'] == null
          ? null
          : PhleboInfo.fromJson(json['phlebo'] as Map<String, dynamic>),
      patients: (json['patients'] as List<dynamic>)
          .map((e) => PatientStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderStatusImplToJson(_$OrderStatusImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'orderDate': instance.orderDate.toIso8601String(),
      'bookingSlotDate': instance.bookingSlotDate,
      'bookingSlotTime': instance.bookingSlotTime,
      'bookingAddress': instance.bookingAddress,
      'overallStatus': instance.overallStatus,
      'reportGeneratedDate': instance.reportGeneratedDate?.toIso8601String(),
      'phlebo': instance.phlebo,
      'patients': instance.patients,
    };

_$PhleboInfoImpl _$$PhleboInfoImplFromJson(Map<String, dynamic> json) =>
    _$PhleboInfoImpl(
      name: json['name'] as String,
      mobile: json['mobile'] as String,
    );

Map<String, dynamic> _$$PhleboInfoImplToJson(_$PhleboInfoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mobile': instance.mobile,
    };

_$PatientStatusImpl _$$PatientStatusImplFromJson(Map<String, dynamic> json) =>
    _$PatientStatusImpl(
      patientId: json['patientId'] as String,
      patientName: json['patientName'] as String,
      patientGender: json['patientGender'] as String,
      patientDob: json['patientDob'] as String,
      sampleCollected: json['sampleCollected'] as bool,
      reportGenerated: json['reportGenerated'] as bool,
      allReportsGenerated: json['allReportsGenerated'] as bool?,
      tests: (json['tests'] as List<dynamic>)
          .map((e) => TestStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PatientStatusImplToJson(_$PatientStatusImpl instance) =>
    <String, dynamic>{
      'patientId': instance.patientId,
      'patientName': instance.patientName,
      'patientGender': instance.patientGender,
      'patientDob': instance.patientDob,
      'sampleCollected': instance.sampleCollected,
      'reportGenerated': instance.reportGenerated,
      'allReportsGenerated': instance.allReportsGenerated,
      'tests': instance.tests,
    };

_$TestStatusImpl _$$TestStatusImplFromJson(Map<String, dynamic> json) =>
    _$TestStatusImpl(
      testId: json['testId'] as String,
      testTitle: json['testTitle'] as String?,
      barcode: json['barcode'] as String?,
      reportStatus: json['reportStatus'] as String,
    );

Map<String, dynamic> _$$TestStatusImplToJson(_$TestStatusImpl instance) =>
    <String, dynamic>{
      'testId': instance.testId,
      'testTitle': instance.testTitle,
      'barcode': instance.barcode,
      'reportStatus': instance.reportStatus,
    };
