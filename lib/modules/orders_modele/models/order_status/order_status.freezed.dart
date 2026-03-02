// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderStatus _$OrderStatusFromJson(Map<String, dynamic> json) {
  return _OrderStatus.fromJson(json);
}

/// @nodoc
mixin _$OrderStatus {
  @JsonKey(name: 'orderId')
  int get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderDate')
  DateTime get orderDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'bookingSlotDate')
  String get bookingSlotDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'bookingSlotTime')
  String? get bookingSlotTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'bookingAddress')
  String get bookingAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'overallStatus')
  String get overallStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'reportGeneratedDate')
  DateTime? get reportGeneratedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'phlebo')
  PhleboInfo? get phlebo => throw _privateConstructorUsedError;
  @JsonKey(name: 'patients')
  List<PatientStatus> get patients => throw _privateConstructorUsedError;

  /// Serializes this OrderStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderStatusCopyWith<OrderStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStatusCopyWith<$Res> {
  factory $OrderStatusCopyWith(
          OrderStatus value, $Res Function(OrderStatus) then) =
      _$OrderStatusCopyWithImpl<$Res, OrderStatus>;
  @useResult
  $Res call(
      {@JsonKey(name: 'orderId') int orderId,
      @JsonKey(name: 'orderDate') DateTime orderDate,
      @JsonKey(name: 'bookingSlotDate') String bookingSlotDate,
      @JsonKey(name: 'bookingSlotTime') String? bookingSlotTime,
      @JsonKey(name: 'bookingAddress') String bookingAddress,
      @JsonKey(name: 'overallStatus') String overallStatus,
      @JsonKey(name: 'reportGeneratedDate') DateTime? reportGeneratedDate,
      @JsonKey(name: 'phlebo') PhleboInfo? phlebo,
      @JsonKey(name: 'patients') List<PatientStatus> patients});

  $PhleboInfoCopyWith<$Res>? get phlebo;
}

/// @nodoc
class _$OrderStatusCopyWithImpl<$Res, $Val extends OrderStatus>
    implements $OrderStatusCopyWith<$Res> {
  _$OrderStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? orderDate = null,
    Object? bookingSlotDate = null,
    Object? bookingSlotTime = freezed,
    Object? bookingAddress = null,
    Object? overallStatus = null,
    Object? reportGeneratedDate = freezed,
    Object? phlebo = freezed,
    Object? patients = null,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bookingSlotDate: null == bookingSlotDate
          ? _value.bookingSlotDate
          : bookingSlotDate // ignore: cast_nullable_to_non_nullable
              as String,
      bookingSlotTime: freezed == bookingSlotTime
          ? _value.bookingSlotTime
          : bookingSlotTime // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingAddress: null == bookingAddress
          ? _value.bookingAddress
          : bookingAddress // ignore: cast_nullable_to_non_nullable
              as String,
      overallStatus: null == overallStatus
          ? _value.overallStatus
          : overallStatus // ignore: cast_nullable_to_non_nullable
              as String,
      reportGeneratedDate: freezed == reportGeneratedDate
          ? _value.reportGeneratedDate
          : reportGeneratedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      phlebo: freezed == phlebo
          ? _value.phlebo
          : phlebo // ignore: cast_nullable_to_non_nullable
              as PhleboInfo?,
      patients: null == patients
          ? _value.patients
          : patients // ignore: cast_nullable_to_non_nullable
              as List<PatientStatus>,
    ) as $Val);
  }

  /// Create a copy of OrderStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PhleboInfoCopyWith<$Res>? get phlebo {
    if (_value.phlebo == null) {
      return null;
    }

    return $PhleboInfoCopyWith<$Res>(_value.phlebo!, (value) {
      return _then(_value.copyWith(phlebo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderStatusImplCopyWith<$Res>
    implements $OrderStatusCopyWith<$Res> {
  factory _$$OrderStatusImplCopyWith(
          _$OrderStatusImpl value, $Res Function(_$OrderStatusImpl) then) =
      __$$OrderStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'orderId') int orderId,
      @JsonKey(name: 'orderDate') DateTime orderDate,
      @JsonKey(name: 'bookingSlotDate') String bookingSlotDate,
      @JsonKey(name: 'bookingSlotTime') String? bookingSlotTime,
      @JsonKey(name: 'bookingAddress') String bookingAddress,
      @JsonKey(name: 'overallStatus') String overallStatus,
      @JsonKey(name: 'reportGeneratedDate') DateTime? reportGeneratedDate,
      @JsonKey(name: 'phlebo') PhleboInfo? phlebo,
      @JsonKey(name: 'patients') List<PatientStatus> patients});

  @override
  $PhleboInfoCopyWith<$Res>? get phlebo;
}

/// @nodoc
class __$$OrderStatusImplCopyWithImpl<$Res>
    extends _$OrderStatusCopyWithImpl<$Res, _$OrderStatusImpl>
    implements _$$OrderStatusImplCopyWith<$Res> {
  __$$OrderStatusImplCopyWithImpl(
      _$OrderStatusImpl _value, $Res Function(_$OrderStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? orderDate = null,
    Object? bookingSlotDate = null,
    Object? bookingSlotTime = freezed,
    Object? bookingAddress = null,
    Object? overallStatus = null,
    Object? reportGeneratedDate = freezed,
    Object? phlebo = freezed,
    Object? patients = null,
  }) {
    return _then(_$OrderStatusImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bookingSlotDate: null == bookingSlotDate
          ? _value.bookingSlotDate
          : bookingSlotDate // ignore: cast_nullable_to_non_nullable
              as String,
      bookingSlotTime: freezed == bookingSlotTime
          ? _value.bookingSlotTime
          : bookingSlotTime // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingAddress: null == bookingAddress
          ? _value.bookingAddress
          : bookingAddress // ignore: cast_nullable_to_non_nullable
              as String,
      overallStatus: null == overallStatus
          ? _value.overallStatus
          : overallStatus // ignore: cast_nullable_to_non_nullable
              as String,
      reportGeneratedDate: freezed == reportGeneratedDate
          ? _value.reportGeneratedDate
          : reportGeneratedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      phlebo: freezed == phlebo
          ? _value.phlebo
          : phlebo // ignore: cast_nullable_to_non_nullable
              as PhleboInfo?,
      patients: null == patients
          ? _value._patients
          : patients // ignore: cast_nullable_to_non_nullable
              as List<PatientStatus>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderStatusImpl implements _OrderStatus {
  const _$OrderStatusImpl(
      {@JsonKey(name: 'orderId') required this.orderId,
      @JsonKey(name: 'orderDate') required this.orderDate,
      @JsonKey(name: 'bookingSlotDate') required this.bookingSlotDate,
      @JsonKey(name: 'bookingSlotTime') this.bookingSlotTime,
      @JsonKey(name: 'bookingAddress') required this.bookingAddress,
      @JsonKey(name: 'overallStatus') required this.overallStatus,
      @JsonKey(name: 'reportGeneratedDate') this.reportGeneratedDate,
      @JsonKey(name: 'phlebo') this.phlebo,
      @JsonKey(name: 'patients') required final List<PatientStatus> patients})
      : _patients = patients;

  factory _$OrderStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderStatusImplFromJson(json);

  @override
  @JsonKey(name: 'orderId')
  final int orderId;
  @override
  @JsonKey(name: 'orderDate')
  final DateTime orderDate;
  @override
  @JsonKey(name: 'bookingSlotDate')
  final String bookingSlotDate;
  @override
  @JsonKey(name: 'bookingSlotTime')
  final String? bookingSlotTime;
  @override
  @JsonKey(name: 'bookingAddress')
  final String bookingAddress;
  @override
  @JsonKey(name: 'overallStatus')
  final String overallStatus;
  @override
  @JsonKey(name: 'reportGeneratedDate')
  final DateTime? reportGeneratedDate;
  @override
  @JsonKey(name: 'phlebo')
  final PhleboInfo? phlebo;
  final List<PatientStatus> _patients;
  @override
  @JsonKey(name: 'patients')
  List<PatientStatus> get patients {
    if (_patients is EqualUnmodifiableListView) return _patients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_patients);
  }

  @override
  String toString() {
    return 'OrderStatus(orderId: $orderId, orderDate: $orderDate, bookingSlotDate: $bookingSlotDate, bookingSlotTime: $bookingSlotTime, bookingAddress: $bookingAddress, overallStatus: $overallStatus, reportGeneratedDate: $reportGeneratedDate, phlebo: $phlebo, patients: $patients)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStatusImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.bookingSlotDate, bookingSlotDate) ||
                other.bookingSlotDate == bookingSlotDate) &&
            (identical(other.bookingSlotTime, bookingSlotTime) ||
                other.bookingSlotTime == bookingSlotTime) &&
            (identical(other.bookingAddress, bookingAddress) ||
                other.bookingAddress == bookingAddress) &&
            (identical(other.overallStatus, overallStatus) ||
                other.overallStatus == overallStatus) &&
            (identical(other.reportGeneratedDate, reportGeneratedDate) ||
                other.reportGeneratedDate == reportGeneratedDate) &&
            (identical(other.phlebo, phlebo) || other.phlebo == phlebo) &&
            const DeepCollectionEquality().equals(other._patients, _patients));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderId,
      orderDate,
      bookingSlotDate,
      bookingSlotTime,
      bookingAddress,
      overallStatus,
      reportGeneratedDate,
      phlebo,
      const DeepCollectionEquality().hash(_patients));

  /// Create a copy of OrderStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStatusImplCopyWith<_$OrderStatusImpl> get copyWith =>
      __$$OrderStatusImplCopyWithImpl<_$OrderStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderStatusImplToJson(
      this,
    );
  }
}

abstract class _OrderStatus implements OrderStatus {
  const factory _OrderStatus(
      {@JsonKey(name: 'orderId') required final int orderId,
      @JsonKey(name: 'orderDate') required final DateTime orderDate,
      @JsonKey(name: 'bookingSlotDate') required final String bookingSlotDate,
      @JsonKey(name: 'bookingSlotTime') final String? bookingSlotTime,
      @JsonKey(name: 'bookingAddress') required final String bookingAddress,
      @JsonKey(name: 'overallStatus') required final String overallStatus,
      @JsonKey(name: 'reportGeneratedDate') final DateTime? reportGeneratedDate,
      @JsonKey(name: 'phlebo') final PhleboInfo? phlebo,
      @JsonKey(name: 'patients')
      required final List<PatientStatus> patients}) = _$OrderStatusImpl;

  factory _OrderStatus.fromJson(Map<String, dynamic> json) =
      _$OrderStatusImpl.fromJson;

  @override
  @JsonKey(name: 'orderId')
  int get orderId;
  @override
  @JsonKey(name: 'orderDate')
  DateTime get orderDate;
  @override
  @JsonKey(name: 'bookingSlotDate')
  String get bookingSlotDate;
  @override
  @JsonKey(name: 'bookingSlotTime')
  String? get bookingSlotTime;
  @override
  @JsonKey(name: 'bookingAddress')
  String get bookingAddress;
  @override
  @JsonKey(name: 'overallStatus')
  String get overallStatus;
  @override
  @JsonKey(name: 'reportGeneratedDate')
  DateTime? get reportGeneratedDate;
  @override
  @JsonKey(name: 'phlebo')
  PhleboInfo? get phlebo;
  @override
  @JsonKey(name: 'patients')
  List<PatientStatus> get patients;

  /// Create a copy of OrderStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderStatusImplCopyWith<_$OrderStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PhleboInfo _$PhleboInfoFromJson(Map<String, dynamic> json) {
  return _PhleboInfo.fromJson(json);
}

/// @nodoc
mixin _$PhleboInfo {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile')
  String get mobile => throw _privateConstructorUsedError;

  /// Serializes this PhleboInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PhleboInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhleboInfoCopyWith<PhleboInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhleboInfoCopyWith<$Res> {
  factory $PhleboInfoCopyWith(
          PhleboInfo value, $Res Function(PhleboInfo) then) =
      _$PhleboInfoCopyWithImpl<$Res, PhleboInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'mobile') String mobile});
}

/// @nodoc
class _$PhleboInfoCopyWithImpl<$Res, $Val extends PhleboInfo>
    implements $PhleboInfoCopyWith<$Res> {
  _$PhleboInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhleboInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? mobile = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhleboInfoImplCopyWith<$Res>
    implements $PhleboInfoCopyWith<$Res> {
  factory _$$PhleboInfoImplCopyWith(
          _$PhleboInfoImpl value, $Res Function(_$PhleboInfoImpl) then) =
      __$$PhleboInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'mobile') String mobile});
}

/// @nodoc
class __$$PhleboInfoImplCopyWithImpl<$Res>
    extends _$PhleboInfoCopyWithImpl<$Res, _$PhleboInfoImpl>
    implements _$$PhleboInfoImplCopyWith<$Res> {
  __$$PhleboInfoImplCopyWithImpl(
      _$PhleboInfoImpl _value, $Res Function(_$PhleboInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhleboInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? mobile = null,
  }) {
    return _then(_$PhleboInfoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhleboInfoImpl implements _PhleboInfo {
  const _$PhleboInfoImpl(
      {@JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'mobile') required this.mobile});

  factory _$PhleboInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhleboInfoImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'mobile')
  final String mobile;

  @override
  String toString() {
    return 'PhleboInfo(name: $name, mobile: $mobile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhleboInfoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mobile, mobile) || other.mobile == mobile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, mobile);

  /// Create a copy of PhleboInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhleboInfoImplCopyWith<_$PhleboInfoImpl> get copyWith =>
      __$$PhleboInfoImplCopyWithImpl<_$PhleboInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhleboInfoImplToJson(
      this,
    );
  }
}

abstract class _PhleboInfo implements PhleboInfo {
  const factory _PhleboInfo(
          {@JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'mobile') required final String mobile}) =
      _$PhleboInfoImpl;

  factory _PhleboInfo.fromJson(Map<String, dynamic> json) =
      _$PhleboInfoImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'mobile')
  String get mobile;

  /// Create a copy of PhleboInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhleboInfoImplCopyWith<_$PhleboInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PatientStatus _$PatientStatusFromJson(Map<String, dynamic> json) {
  return _PatientStatus.fromJson(json);
}

/// @nodoc
mixin _$PatientStatus {
  @JsonKey(name: 'patientId')
  String get patientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'patientName')
  String get patientName => throw _privateConstructorUsedError;
  @JsonKey(name: 'patientGender')
  String get patientGender => throw _privateConstructorUsedError;
  @JsonKey(name: 'patientDob')
  String get patientDob => throw _privateConstructorUsedError;
  @JsonKey(name: 'sampleCollected')
  bool get sampleCollected => throw _privateConstructorUsedError;
  @JsonKey(name: 'reportGenerated')
  bool get reportGenerated => throw _privateConstructorUsedError;
  @JsonKey(name: 'allReportsGenerated')
  bool? get allReportsGenerated => throw _privateConstructorUsedError;
  @JsonKey(name: 'tests')
  List<TestStatus> get tests => throw _privateConstructorUsedError;

  /// Serializes this PatientStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatientStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientStatusCopyWith<PatientStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientStatusCopyWith<$Res> {
  factory $PatientStatusCopyWith(
          PatientStatus value, $Res Function(PatientStatus) then) =
      _$PatientStatusCopyWithImpl<$Res, PatientStatus>;
  @useResult
  $Res call(
      {@JsonKey(name: 'patientId') String patientId,
      @JsonKey(name: 'patientName') String patientName,
      @JsonKey(name: 'patientGender') String patientGender,
      @JsonKey(name: 'patientDob') String patientDob,
      @JsonKey(name: 'sampleCollected') bool sampleCollected,
      @JsonKey(name: 'reportGenerated') bool reportGenerated,
      @JsonKey(name: 'allReportsGenerated') bool? allReportsGenerated,
      @JsonKey(name: 'tests') List<TestStatus> tests});
}

/// @nodoc
class _$PatientStatusCopyWithImpl<$Res, $Val extends PatientStatus>
    implements $PatientStatusCopyWith<$Res> {
  _$PatientStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patientId = null,
    Object? patientName = null,
    Object? patientGender = null,
    Object? patientDob = null,
    Object? sampleCollected = null,
    Object? reportGenerated = null,
    Object? allReportsGenerated = freezed,
    Object? tests = null,
  }) {
    return _then(_value.copyWith(
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
      patientName: null == patientName
          ? _value.patientName
          : patientName // ignore: cast_nullable_to_non_nullable
              as String,
      patientGender: null == patientGender
          ? _value.patientGender
          : patientGender // ignore: cast_nullable_to_non_nullable
              as String,
      patientDob: null == patientDob
          ? _value.patientDob
          : patientDob // ignore: cast_nullable_to_non_nullable
              as String,
      sampleCollected: null == sampleCollected
          ? _value.sampleCollected
          : sampleCollected // ignore: cast_nullable_to_non_nullable
              as bool,
      reportGenerated: null == reportGenerated
          ? _value.reportGenerated
          : reportGenerated // ignore: cast_nullable_to_non_nullable
              as bool,
      allReportsGenerated: freezed == allReportsGenerated
          ? _value.allReportsGenerated
          : allReportsGenerated // ignore: cast_nullable_to_non_nullable
              as bool?,
      tests: null == tests
          ? _value.tests
          : tests // ignore: cast_nullable_to_non_nullable
              as List<TestStatus>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientStatusImplCopyWith<$Res>
    implements $PatientStatusCopyWith<$Res> {
  factory _$$PatientStatusImplCopyWith(
          _$PatientStatusImpl value, $Res Function(_$PatientStatusImpl) then) =
      __$$PatientStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'patientId') String patientId,
      @JsonKey(name: 'patientName') String patientName,
      @JsonKey(name: 'patientGender') String patientGender,
      @JsonKey(name: 'patientDob') String patientDob,
      @JsonKey(name: 'sampleCollected') bool sampleCollected,
      @JsonKey(name: 'reportGenerated') bool reportGenerated,
      @JsonKey(name: 'allReportsGenerated') bool? allReportsGenerated,
      @JsonKey(name: 'tests') List<TestStatus> tests});
}

/// @nodoc
class __$$PatientStatusImplCopyWithImpl<$Res>
    extends _$PatientStatusCopyWithImpl<$Res, _$PatientStatusImpl>
    implements _$$PatientStatusImplCopyWith<$Res> {
  __$$PatientStatusImplCopyWithImpl(
      _$PatientStatusImpl _value, $Res Function(_$PatientStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatientStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patientId = null,
    Object? patientName = null,
    Object? patientGender = null,
    Object? patientDob = null,
    Object? sampleCollected = null,
    Object? reportGenerated = null,
    Object? allReportsGenerated = freezed,
    Object? tests = null,
  }) {
    return _then(_$PatientStatusImpl(
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
      patientName: null == patientName
          ? _value.patientName
          : patientName // ignore: cast_nullable_to_non_nullable
              as String,
      patientGender: null == patientGender
          ? _value.patientGender
          : patientGender // ignore: cast_nullable_to_non_nullable
              as String,
      patientDob: null == patientDob
          ? _value.patientDob
          : patientDob // ignore: cast_nullable_to_non_nullable
              as String,
      sampleCollected: null == sampleCollected
          ? _value.sampleCollected
          : sampleCollected // ignore: cast_nullable_to_non_nullable
              as bool,
      reportGenerated: null == reportGenerated
          ? _value.reportGenerated
          : reportGenerated // ignore: cast_nullable_to_non_nullable
              as bool,
      allReportsGenerated: freezed == allReportsGenerated
          ? _value.allReportsGenerated
          : allReportsGenerated // ignore: cast_nullable_to_non_nullable
              as bool?,
      tests: null == tests
          ? _value._tests
          : tests // ignore: cast_nullable_to_non_nullable
              as List<TestStatus>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientStatusImpl implements _PatientStatus {
  const _$PatientStatusImpl(
      {@JsonKey(name: 'patientId') required this.patientId,
      @JsonKey(name: 'patientName') required this.patientName,
      @JsonKey(name: 'patientGender') required this.patientGender,
      @JsonKey(name: 'patientDob') required this.patientDob,
      @JsonKey(name: 'sampleCollected') required this.sampleCollected,
      @JsonKey(name: 'reportGenerated') required this.reportGenerated,
      @JsonKey(name: 'allReportsGenerated') this.allReportsGenerated,
      @JsonKey(name: 'tests') required final List<TestStatus> tests})
      : _tests = tests;

  factory _$PatientStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientStatusImplFromJson(json);

  @override
  @JsonKey(name: 'patientId')
  final String patientId;
  @override
  @JsonKey(name: 'patientName')
  final String patientName;
  @override
  @JsonKey(name: 'patientGender')
  final String patientGender;
  @override
  @JsonKey(name: 'patientDob')
  final String patientDob;
  @override
  @JsonKey(name: 'sampleCollected')
  final bool sampleCollected;
  @override
  @JsonKey(name: 'reportGenerated')
  final bool reportGenerated;
  @override
  @JsonKey(name: 'allReportsGenerated')
  final bool? allReportsGenerated;
  final List<TestStatus> _tests;
  @override
  @JsonKey(name: 'tests')
  List<TestStatus> get tests {
    if (_tests is EqualUnmodifiableListView) return _tests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tests);
  }

  @override
  String toString() {
    return 'PatientStatus(patientId: $patientId, patientName: $patientName, patientGender: $patientGender, patientDob: $patientDob, sampleCollected: $sampleCollected, reportGenerated: $reportGenerated, allReportsGenerated: $allReportsGenerated, tests: $tests)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientStatusImpl &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.patientName, patientName) ||
                other.patientName == patientName) &&
            (identical(other.patientGender, patientGender) ||
                other.patientGender == patientGender) &&
            (identical(other.patientDob, patientDob) ||
                other.patientDob == patientDob) &&
            (identical(other.sampleCollected, sampleCollected) ||
                other.sampleCollected == sampleCollected) &&
            (identical(other.reportGenerated, reportGenerated) ||
                other.reportGenerated == reportGenerated) &&
            (identical(other.allReportsGenerated, allReportsGenerated) ||
                other.allReportsGenerated == allReportsGenerated) &&
            const DeepCollectionEquality().equals(other._tests, _tests));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      patientId,
      patientName,
      patientGender,
      patientDob,
      sampleCollected,
      reportGenerated,
      allReportsGenerated,
      const DeepCollectionEquality().hash(_tests));

  /// Create a copy of PatientStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientStatusImplCopyWith<_$PatientStatusImpl> get copyWith =>
      __$$PatientStatusImplCopyWithImpl<_$PatientStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientStatusImplToJson(
      this,
    );
  }
}

abstract class _PatientStatus implements PatientStatus {
  const factory _PatientStatus(
          {@JsonKey(name: 'patientId') required final String patientId,
          @JsonKey(name: 'patientName') required final String patientName,
          @JsonKey(name: 'patientGender') required final String patientGender,
          @JsonKey(name: 'patientDob') required final String patientDob,
          @JsonKey(name: 'sampleCollected') required final bool sampleCollected,
          @JsonKey(name: 'reportGenerated') required final bool reportGenerated,
          @JsonKey(name: 'allReportsGenerated') final bool? allReportsGenerated,
          @JsonKey(name: 'tests') required final List<TestStatus> tests}) =
      _$PatientStatusImpl;

  factory _PatientStatus.fromJson(Map<String, dynamic> json) =
      _$PatientStatusImpl.fromJson;

  @override
  @JsonKey(name: 'patientId')
  String get patientId;
  @override
  @JsonKey(name: 'patientName')
  String get patientName;
  @override
  @JsonKey(name: 'patientGender')
  String get patientGender;
  @override
  @JsonKey(name: 'patientDob')
  String get patientDob;
  @override
  @JsonKey(name: 'sampleCollected')
  bool get sampleCollected;
  @override
  @JsonKey(name: 'reportGenerated')
  bool get reportGenerated;
  @override
  @JsonKey(name: 'allReportsGenerated')
  bool? get allReportsGenerated;
  @override
  @JsonKey(name: 'tests')
  List<TestStatus> get tests;

  /// Create a copy of PatientStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientStatusImplCopyWith<_$PatientStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TestStatus _$TestStatusFromJson(Map<String, dynamic> json) {
  return _TestStatus.fromJson(json);
}

/// @nodoc
mixin _$TestStatus {
  @JsonKey(name: 'testId')
  String get testId => throw _privateConstructorUsedError;
  @JsonKey(name: 'testTitle')
  String? get testTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'barcode')
  String? get barcode => throw _privateConstructorUsedError;
  @JsonKey(name: 'reportStatus')
  String get reportStatus => throw _privateConstructorUsedError;

  /// Serializes this TestStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TestStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TestStatusCopyWith<TestStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestStatusCopyWith<$Res> {
  factory $TestStatusCopyWith(
          TestStatus value, $Res Function(TestStatus) then) =
      _$TestStatusCopyWithImpl<$Res, TestStatus>;
  @useResult
  $Res call(
      {@JsonKey(name: 'testId') String testId,
      @JsonKey(name: 'testTitle') String? testTitle,
      @JsonKey(name: 'barcode') String? barcode,
      @JsonKey(name: 'reportStatus') String reportStatus});
}

/// @nodoc
class _$TestStatusCopyWithImpl<$Res, $Val extends TestStatus>
    implements $TestStatusCopyWith<$Res> {
  _$TestStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TestStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? testId = null,
    Object? testTitle = freezed,
    Object? barcode = freezed,
    Object? reportStatus = null,
  }) {
    return _then(_value.copyWith(
      testId: null == testId
          ? _value.testId
          : testId // ignore: cast_nullable_to_non_nullable
              as String,
      testTitle: freezed == testTitle
          ? _value.testTitle
          : testTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
      reportStatus: null == reportStatus
          ? _value.reportStatus
          : reportStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TestStatusImplCopyWith<$Res>
    implements $TestStatusCopyWith<$Res> {
  factory _$$TestStatusImplCopyWith(
          _$TestStatusImpl value, $Res Function(_$TestStatusImpl) then) =
      __$$TestStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'testId') String testId,
      @JsonKey(name: 'testTitle') String? testTitle,
      @JsonKey(name: 'barcode') String? barcode,
      @JsonKey(name: 'reportStatus') String reportStatus});
}

/// @nodoc
class __$$TestStatusImplCopyWithImpl<$Res>
    extends _$TestStatusCopyWithImpl<$Res, _$TestStatusImpl>
    implements _$$TestStatusImplCopyWith<$Res> {
  __$$TestStatusImplCopyWithImpl(
      _$TestStatusImpl _value, $Res Function(_$TestStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of TestStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? testId = null,
    Object? testTitle = freezed,
    Object? barcode = freezed,
    Object? reportStatus = null,
  }) {
    return _then(_$TestStatusImpl(
      testId: null == testId
          ? _value.testId
          : testId // ignore: cast_nullable_to_non_nullable
              as String,
      testTitle: freezed == testTitle
          ? _value.testTitle
          : testTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
      reportStatus: null == reportStatus
          ? _value.reportStatus
          : reportStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TestStatusImpl implements _TestStatus {
  const _$TestStatusImpl(
      {@JsonKey(name: 'testId') required this.testId,
      @JsonKey(name: 'testTitle') this.testTitle,
      @JsonKey(name: 'barcode') this.barcode,
      @JsonKey(name: 'reportStatus') required this.reportStatus});

  factory _$TestStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$TestStatusImplFromJson(json);

  @override
  @JsonKey(name: 'testId')
  final String testId;
  @override
  @JsonKey(name: 'testTitle')
  final String? testTitle;
  @override
  @JsonKey(name: 'barcode')
  final String? barcode;
  @override
  @JsonKey(name: 'reportStatus')
  final String reportStatus;

  @override
  String toString() {
    return 'TestStatus(testId: $testId, testTitle: $testTitle, barcode: $barcode, reportStatus: $reportStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestStatusImpl &&
            (identical(other.testId, testId) || other.testId == testId) &&
            (identical(other.testTitle, testTitle) ||
                other.testTitle == testTitle) &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.reportStatus, reportStatus) ||
                other.reportStatus == reportStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, testId, testTitle, barcode, reportStatus);

  /// Create a copy of TestStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TestStatusImplCopyWith<_$TestStatusImpl> get copyWith =>
      __$$TestStatusImplCopyWithImpl<_$TestStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TestStatusImplToJson(
      this,
    );
  }
}

abstract class _TestStatus implements TestStatus {
  const factory _TestStatus(
          {@JsonKey(name: 'testId') required final String testId,
          @JsonKey(name: 'testTitle') final String? testTitle,
          @JsonKey(name: 'barcode') final String? barcode,
          @JsonKey(name: 'reportStatus') required final String reportStatus}) =
      _$TestStatusImpl;

  factory _TestStatus.fromJson(Map<String, dynamic> json) =
      _$TestStatusImpl.fromJson;

  @override
  @JsonKey(name: 'testId')
  String get testId;
  @override
  @JsonKey(name: 'testTitle')
  String? get testTitle;
  @override
  @JsonKey(name: 'barcode')
  String? get barcode;
  @override
  @JsonKey(name: 'reportStatus')
  String get reportStatus;

  /// Create a copy of TestStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TestStatusImplCopyWith<_$TestStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
