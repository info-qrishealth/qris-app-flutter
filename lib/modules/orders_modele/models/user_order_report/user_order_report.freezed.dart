// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_order_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserOrderReport _$UserOrderReportFromJson(Map<String, dynamic> json) {
  return _UserOrderReport.fromJson(json);
}

/// @nodoc
mixin _$UserOrderReport {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_id')
  String get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  String get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'matelab_id')
  String get matelabId => throw _privateConstructorUsedError;
  @JsonKey(name: 'txn_id')
  String? get txnId => throw _privateConstructorUsedError;
  @JsonKey(name: 'test_id')
  String get testId => throw _privateConstructorUsedError;
  @JsonKey(name: 'test_title')
  String? get testTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'test_price')
  double get testPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'patient_id')
  String? get patientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ptnt_name')
  String get ptntName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ptnt_gender')
  String get ptntGender => throw _privateConstructorUsedError;
  @JsonKey(name: 'ptnt_dob')
  String get ptntDob => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_date')
  String? get orderDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'report_date')
  String get reportDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'report_status')
  OrderStatus get reportStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'report_file')
  String get reportFile => throw _privateConstructorUsedError;
  @JsonKey(name: 'sample_type')
  String get sampleType => throw _privateConstructorUsedError;
  @JsonKey(name: 'tube_type')
  String get tubeType => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'feedback_notification')
  String get feedbackNotification => throw _privateConstructorUsedError;
  @JsonKey(name: 'uploading_date')
  String? get uploadingDate => throw _privateConstructorUsedError;

  /// Serializes this UserOrderReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserOrderReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserOrderReportCopyWith<UserOrderReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserOrderReportCopyWith<$Res> {
  factory $UserOrderReportCopyWith(
          UserOrderReport value, $Res Function(UserOrderReport) then) =
      _$UserOrderReportCopyWithImpl<$Res, UserOrderReport>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'doctor_id') String doctorId,
      @JsonKey(name: 'order_id') String orderId,
      @JsonKey(name: 'matelab_id') String matelabId,
      @JsonKey(name: 'txn_id') String? txnId,
      @JsonKey(name: 'test_id') String testId,
      @JsonKey(name: 'test_title') String? testTitle,
      @JsonKey(name: 'test_price') double testPrice,
      @JsonKey(name: 'patient_id') String? patientId,
      @JsonKey(name: 'ptnt_name') String ptntName,
      @JsonKey(name: 'ptnt_gender') String ptntGender,
      @JsonKey(name: 'ptnt_dob') String ptntDob,
      @JsonKey(name: 'order_date') String? orderDate,
      @JsonKey(name: 'report_date') String reportDate,
      @JsonKey(name: 'report_status') OrderStatus reportStatus,
      @JsonKey(name: 'report_file') String reportFile,
      @JsonKey(name: 'sample_type') String sampleType,
      @JsonKey(name: 'tube_type') String tubeType,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'feedback_notification') String feedbackNotification,
      @JsonKey(name: 'uploading_date') String? uploadingDate});
}

/// @nodoc
class _$UserOrderReportCopyWithImpl<$Res, $Val extends UserOrderReport>
    implements $UserOrderReportCopyWith<$Res> {
  _$UserOrderReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserOrderReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? doctorId = null,
    Object? orderId = null,
    Object? matelabId = null,
    Object? txnId = freezed,
    Object? testId = null,
    Object? testTitle = freezed,
    Object? testPrice = null,
    Object? patientId = freezed,
    Object? ptntName = null,
    Object? ptntGender = null,
    Object? ptntDob = null,
    Object? orderDate = freezed,
    Object? reportDate = null,
    Object? reportStatus = null,
    Object? reportFile = null,
    Object? sampleType = null,
    Object? tubeType = null,
    Object? status = null,
    Object? feedbackNotification = null,
    Object? uploadingDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      matelabId: null == matelabId
          ? _value.matelabId
          : matelabId // ignore: cast_nullable_to_non_nullable
              as String,
      txnId: freezed == txnId
          ? _value.txnId
          : txnId // ignore: cast_nullable_to_non_nullable
              as String?,
      testId: null == testId
          ? _value.testId
          : testId // ignore: cast_nullable_to_non_nullable
              as String,
      testTitle: freezed == testTitle
          ? _value.testTitle
          : testTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      testPrice: null == testPrice
          ? _value.testPrice
          : testPrice // ignore: cast_nullable_to_non_nullable
              as double,
      patientId: freezed == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String?,
      ptntName: null == ptntName
          ? _value.ptntName
          : ptntName // ignore: cast_nullable_to_non_nullable
              as String,
      ptntGender: null == ptntGender
          ? _value.ptntGender
          : ptntGender // ignore: cast_nullable_to_non_nullable
              as String,
      ptntDob: null == ptntDob
          ? _value.ptntDob
          : ptntDob // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: freezed == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as String?,
      reportDate: null == reportDate
          ? _value.reportDate
          : reportDate // ignore: cast_nullable_to_non_nullable
              as String,
      reportStatus: null == reportStatus
          ? _value.reportStatus
          : reportStatus // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      reportFile: null == reportFile
          ? _value.reportFile
          : reportFile // ignore: cast_nullable_to_non_nullable
              as String,
      sampleType: null == sampleType
          ? _value.sampleType
          : sampleType // ignore: cast_nullable_to_non_nullable
              as String,
      tubeType: null == tubeType
          ? _value.tubeType
          : tubeType // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      feedbackNotification: null == feedbackNotification
          ? _value.feedbackNotification
          : feedbackNotification // ignore: cast_nullable_to_non_nullable
              as String,
      uploadingDate: freezed == uploadingDate
          ? _value.uploadingDate
          : uploadingDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserOrderReportImplCopyWith<$Res>
    implements $UserOrderReportCopyWith<$Res> {
  factory _$$UserOrderReportImplCopyWith(_$UserOrderReportImpl value,
          $Res Function(_$UserOrderReportImpl) then) =
      __$$UserOrderReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'doctor_id') String doctorId,
      @JsonKey(name: 'order_id') String orderId,
      @JsonKey(name: 'matelab_id') String matelabId,
      @JsonKey(name: 'txn_id') String? txnId,
      @JsonKey(name: 'test_id') String testId,
      @JsonKey(name: 'test_title') String? testTitle,
      @JsonKey(name: 'test_price') double testPrice,
      @JsonKey(name: 'patient_id') String? patientId,
      @JsonKey(name: 'ptnt_name') String ptntName,
      @JsonKey(name: 'ptnt_gender') String ptntGender,
      @JsonKey(name: 'ptnt_dob') String ptntDob,
      @JsonKey(name: 'order_date') String? orderDate,
      @JsonKey(name: 'report_date') String reportDate,
      @JsonKey(name: 'report_status') OrderStatus reportStatus,
      @JsonKey(name: 'report_file') String reportFile,
      @JsonKey(name: 'sample_type') String sampleType,
      @JsonKey(name: 'tube_type') String tubeType,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'feedback_notification') String feedbackNotification,
      @JsonKey(name: 'uploading_date') String? uploadingDate});
}

/// @nodoc
class __$$UserOrderReportImplCopyWithImpl<$Res>
    extends _$UserOrderReportCopyWithImpl<$Res, _$UserOrderReportImpl>
    implements _$$UserOrderReportImplCopyWith<$Res> {
  __$$UserOrderReportImplCopyWithImpl(
      _$UserOrderReportImpl _value, $Res Function(_$UserOrderReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserOrderReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? doctorId = null,
    Object? orderId = null,
    Object? matelabId = null,
    Object? txnId = freezed,
    Object? testId = null,
    Object? testTitle = freezed,
    Object? testPrice = null,
    Object? patientId = freezed,
    Object? ptntName = null,
    Object? ptntGender = null,
    Object? ptntDob = null,
    Object? orderDate = freezed,
    Object? reportDate = null,
    Object? reportStatus = null,
    Object? reportFile = null,
    Object? sampleType = null,
    Object? tubeType = null,
    Object? status = null,
    Object? feedbackNotification = null,
    Object? uploadingDate = freezed,
  }) {
    return _then(_$UserOrderReportImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      matelabId: null == matelabId
          ? _value.matelabId
          : matelabId // ignore: cast_nullable_to_non_nullable
              as String,
      txnId: freezed == txnId
          ? _value.txnId
          : txnId // ignore: cast_nullable_to_non_nullable
              as String?,
      testId: null == testId
          ? _value.testId
          : testId // ignore: cast_nullable_to_non_nullable
              as String,
      testTitle: freezed == testTitle
          ? _value.testTitle
          : testTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      testPrice: null == testPrice
          ? _value.testPrice
          : testPrice // ignore: cast_nullable_to_non_nullable
              as double,
      patientId: freezed == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String?,
      ptntName: null == ptntName
          ? _value.ptntName
          : ptntName // ignore: cast_nullable_to_non_nullable
              as String,
      ptntGender: null == ptntGender
          ? _value.ptntGender
          : ptntGender // ignore: cast_nullable_to_non_nullable
              as String,
      ptntDob: null == ptntDob
          ? _value.ptntDob
          : ptntDob // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: freezed == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as String?,
      reportDate: null == reportDate
          ? _value.reportDate
          : reportDate // ignore: cast_nullable_to_non_nullable
              as String,
      reportStatus: null == reportStatus
          ? _value.reportStatus
          : reportStatus // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      reportFile: null == reportFile
          ? _value.reportFile
          : reportFile // ignore: cast_nullable_to_non_nullable
              as String,
      sampleType: null == sampleType
          ? _value.sampleType
          : sampleType // ignore: cast_nullable_to_non_nullable
              as String,
      tubeType: null == tubeType
          ? _value.tubeType
          : tubeType // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      feedbackNotification: null == feedbackNotification
          ? _value.feedbackNotification
          : feedbackNotification // ignore: cast_nullable_to_non_nullable
              as String,
      uploadingDate: freezed == uploadingDate
          ? _value.uploadingDate
          : uploadingDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserOrderReportImpl implements _UserOrderReport {
  const _$UserOrderReportImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'doctor_id') required this.doctorId,
      @JsonKey(name: 'order_id') required this.orderId,
      @JsonKey(name: 'matelab_id') required this.matelabId,
      @JsonKey(name: 'txn_id') this.txnId,
      @JsonKey(name: 'test_id') required this.testId,
      @JsonKey(name: 'test_title') this.testTitle,
      @JsonKey(name: 'test_price') required this.testPrice,
      @JsonKey(name: 'patient_id') this.patientId,
      @JsonKey(name: 'ptnt_name') required this.ptntName,
      @JsonKey(name: 'ptnt_gender') required this.ptntGender,
      @JsonKey(name: 'ptnt_dob') required this.ptntDob,
      @JsonKey(name: 'order_date') this.orderDate,
      @JsonKey(name: 'report_date') required this.reportDate,
      @JsonKey(name: 'report_status') required this.reportStatus,
      @JsonKey(name: 'report_file') required this.reportFile,
      @JsonKey(name: 'sample_type') required this.sampleType,
      @JsonKey(name: 'tube_type') required this.tubeType,
      @JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'feedback_notification')
      required this.feedbackNotification,
      @JsonKey(name: 'uploading_date') this.uploadingDate});

  factory _$UserOrderReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserOrderReportImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'doctor_id')
  final String doctorId;
  @override
  @JsonKey(name: 'order_id')
  final String orderId;
  @override
  @JsonKey(name: 'matelab_id')
  final String matelabId;
  @override
  @JsonKey(name: 'txn_id')
  final String? txnId;
  @override
  @JsonKey(name: 'test_id')
  final String testId;
  @override
  @JsonKey(name: 'test_title')
  final String? testTitle;
  @override
  @JsonKey(name: 'test_price')
  final double testPrice;
  @override
  @JsonKey(name: 'patient_id')
  final String? patientId;
  @override
  @JsonKey(name: 'ptnt_name')
  final String ptntName;
  @override
  @JsonKey(name: 'ptnt_gender')
  final String ptntGender;
  @override
  @JsonKey(name: 'ptnt_dob')
  final String ptntDob;
  @override
  @JsonKey(name: 'order_date')
  final String? orderDate;
  @override
  @JsonKey(name: 'report_date')
  final String reportDate;
  @override
  @JsonKey(name: 'report_status')
  final OrderStatus reportStatus;
  @override
  @JsonKey(name: 'report_file')
  final String reportFile;
  @override
  @JsonKey(name: 'sample_type')
  final String sampleType;
  @override
  @JsonKey(name: 'tube_type')
  final String tubeType;
  @override
  @JsonKey(name: 'status')
  final String status;
  @override
  @JsonKey(name: 'feedback_notification')
  final String feedbackNotification;
  @override
  @JsonKey(name: 'uploading_date')
  final String? uploadingDate;

  @override
  String toString() {
    return 'UserOrderReport(id: $id, userId: $userId, doctorId: $doctorId, orderId: $orderId, matelabId: $matelabId, txnId: $txnId, testId: $testId, testTitle: $testTitle, testPrice: $testPrice, patientId: $patientId, ptntName: $ptntName, ptntGender: $ptntGender, ptntDob: $ptntDob, orderDate: $orderDate, reportDate: $reportDate, reportStatus: $reportStatus, reportFile: $reportFile, sampleType: $sampleType, tubeType: $tubeType, status: $status, feedbackNotification: $feedbackNotification, uploadingDate: $uploadingDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserOrderReportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.matelabId, matelabId) ||
                other.matelabId == matelabId) &&
            (identical(other.txnId, txnId) || other.txnId == txnId) &&
            (identical(other.testId, testId) || other.testId == testId) &&
            (identical(other.testTitle, testTitle) ||
                other.testTitle == testTitle) &&
            (identical(other.testPrice, testPrice) ||
                other.testPrice == testPrice) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.ptntName, ptntName) ||
                other.ptntName == ptntName) &&
            (identical(other.ptntGender, ptntGender) ||
                other.ptntGender == ptntGender) &&
            (identical(other.ptntDob, ptntDob) || other.ptntDob == ptntDob) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.reportDate, reportDate) ||
                other.reportDate == reportDate) &&
            (identical(other.reportStatus, reportStatus) ||
                other.reportStatus == reportStatus) &&
            (identical(other.reportFile, reportFile) ||
                other.reportFile == reportFile) &&
            (identical(other.sampleType, sampleType) ||
                other.sampleType == sampleType) &&
            (identical(other.tubeType, tubeType) ||
                other.tubeType == tubeType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.feedbackNotification, feedbackNotification) ||
                other.feedbackNotification == feedbackNotification) &&
            (identical(other.uploadingDate, uploadingDate) ||
                other.uploadingDate == uploadingDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        doctorId,
        orderId,
        matelabId,
        txnId,
        testId,
        testTitle,
        testPrice,
        patientId,
        ptntName,
        ptntGender,
        ptntDob,
        orderDate,
        reportDate,
        reportStatus,
        reportFile,
        sampleType,
        tubeType,
        status,
        feedbackNotification,
        uploadingDate
      ]);

  /// Create a copy of UserOrderReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserOrderReportImplCopyWith<_$UserOrderReportImpl> get copyWith =>
      __$$UserOrderReportImplCopyWithImpl<_$UserOrderReportImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserOrderReportImplToJson(
      this,
    );
  }
}

abstract class _UserOrderReport implements UserOrderReport {
  const factory _UserOrderReport(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'user_id') required final String userId,
      @JsonKey(name: 'doctor_id') required final String doctorId,
      @JsonKey(name: 'order_id') required final String orderId,
      @JsonKey(name: 'matelab_id') required final String matelabId,
      @JsonKey(name: 'txn_id') final String? txnId,
      @JsonKey(name: 'test_id') required final String testId,
      @JsonKey(name: 'test_title') final String? testTitle,
      @JsonKey(name: 'test_price') required final double testPrice,
      @JsonKey(name: 'patient_id') final String? patientId,
      @JsonKey(name: 'ptnt_name') required final String ptntName,
      @JsonKey(name: 'ptnt_gender') required final String ptntGender,
      @JsonKey(name: 'ptnt_dob') required final String ptntDob,
      @JsonKey(name: 'order_date') final String? orderDate,
      @JsonKey(name: 'report_date') required final String reportDate,
      @JsonKey(name: 'report_status') required final OrderStatus reportStatus,
      @JsonKey(name: 'report_file') required final String reportFile,
      @JsonKey(name: 'sample_type') required final String sampleType,
      @JsonKey(name: 'tube_type') required final String tubeType,
      @JsonKey(name: 'status') required final String status,
      @JsonKey(name: 'feedback_notification')
      required final String feedbackNotification,
      @JsonKey(name: 'uploading_date')
      final String? uploadingDate}) = _$UserOrderReportImpl;

  factory _UserOrderReport.fromJson(Map<String, dynamic> json) =
      _$UserOrderReportImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'doctor_id')
  String get doctorId;
  @override
  @JsonKey(name: 'order_id')
  String get orderId;
  @override
  @JsonKey(name: 'matelab_id')
  String get matelabId;
  @override
  @JsonKey(name: 'txn_id')
  String? get txnId;
  @override
  @JsonKey(name: 'test_id')
  String get testId;
  @override
  @JsonKey(name: 'test_title')
  String? get testTitle;
  @override
  @JsonKey(name: 'test_price')
  double get testPrice;
  @override
  @JsonKey(name: 'patient_id')
  String? get patientId;
  @override
  @JsonKey(name: 'ptnt_name')
  String get ptntName;
  @override
  @JsonKey(name: 'ptnt_gender')
  String get ptntGender;
  @override
  @JsonKey(name: 'ptnt_dob')
  String get ptntDob;
  @override
  @JsonKey(name: 'order_date')
  String? get orderDate;
  @override
  @JsonKey(name: 'report_date')
  String get reportDate;
  @override
  @JsonKey(name: 'report_status')
  OrderStatus get reportStatus;
  @override
  @JsonKey(name: 'report_file')
  String get reportFile;
  @override
  @JsonKey(name: 'sample_type')
  String get sampleType;
  @override
  @JsonKey(name: 'tube_type')
  String get tubeType;
  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(name: 'feedback_notification')
  String get feedbackNotification;
  @override
  @JsonKey(name: 'uploading_date')
  String? get uploadingDate;

  /// Create a copy of UserOrderReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserOrderReportImplCopyWith<_$UserOrderReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
