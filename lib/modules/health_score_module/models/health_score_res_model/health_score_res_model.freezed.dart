// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_score_res_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HealthScoreResModel _$HealthScoreResModelFromJson(Map<String, dynamic> json) {
  return _HealthScoreResModel.fromJson(json);
}

/// @nodoc
mixin _$HealthScoreResModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_name')
  String? get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_data')
  String? get userData => throw _privateConstructorUsedError;
  @JsonKey(name: 'bmi')
  String? get bmi => throw _privateConstructorUsedError;
  @JsonKey(name: 'height')
  String? get height => throw _privateConstructorUsedError;
  @JsonKey(name: 'weight')
  String? get weight => throw _privateConstructorUsedError;
  @JsonKey(name: 'health_score')
  String? get healthScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'score_status')
  String? get scoreStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'score_color')
  String? get scoreColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'patient_id')
  String? get patientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;

  /// Serializes this HealthScoreResModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HealthScoreResModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthScoreResModelCopyWith<HealthScoreResModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthScoreResModelCopyWith<$Res> {
  factory $HealthScoreResModelCopyWith(
          HealthScoreResModel value, $Res Function(HealthScoreResModel) then) =
      _$HealthScoreResModelCopyWithImpl<$Res, HealthScoreResModel>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'user_name') String? userName,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'user_data') String? userData,
      @JsonKey(name: 'bmi') String? bmi,
      @JsonKey(name: 'height') String? height,
      @JsonKey(name: 'weight') String? weight,
      @JsonKey(name: 'health_score') String? healthScore,
      @JsonKey(name: 'score_status') String? scoreStatus,
      @JsonKey(name: 'score_color') String? scoreColor,
      @JsonKey(name: 'patient_id') String? patientId,
      @JsonKey(name: 'status') String status});
}

/// @nodoc
class _$HealthScoreResModelCopyWithImpl<$Res, $Val extends HealthScoreResModel>
    implements $HealthScoreResModelCopyWith<$Res> {
  _$HealthScoreResModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HealthScoreResModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userName = freezed,
    Object? userId = freezed,
    Object? userData = freezed,
    Object? bmi = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? healthScore = freezed,
    Object? scoreStatus = freezed,
    Object? scoreColor = freezed,
    Object? patientId = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as String?,
      bmi: freezed == bmi
          ? _value.bmi
          : bmi // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String?,
      healthScore: freezed == healthScore
          ? _value.healthScore
          : healthScore // ignore: cast_nullable_to_non_nullable
              as String?,
      scoreStatus: freezed == scoreStatus
          ? _value.scoreStatus
          : scoreStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      scoreColor: freezed == scoreColor
          ? _value.scoreColor
          : scoreColor // ignore: cast_nullable_to_non_nullable
              as String?,
      patientId: freezed == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HealthScoreResModelImplCopyWith<$Res>
    implements $HealthScoreResModelCopyWith<$Res> {
  factory _$$HealthScoreResModelImplCopyWith(_$HealthScoreResModelImpl value,
          $Res Function(_$HealthScoreResModelImpl) then) =
      __$$HealthScoreResModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'user_name') String? userName,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'user_data') String? userData,
      @JsonKey(name: 'bmi') String? bmi,
      @JsonKey(name: 'height') String? height,
      @JsonKey(name: 'weight') String? weight,
      @JsonKey(name: 'health_score') String? healthScore,
      @JsonKey(name: 'score_status') String? scoreStatus,
      @JsonKey(name: 'score_color') String? scoreColor,
      @JsonKey(name: 'patient_id') String? patientId,
      @JsonKey(name: 'status') String status});
}

/// @nodoc
class __$$HealthScoreResModelImplCopyWithImpl<$Res>
    extends _$HealthScoreResModelCopyWithImpl<$Res, _$HealthScoreResModelImpl>
    implements _$$HealthScoreResModelImplCopyWith<$Res> {
  __$$HealthScoreResModelImplCopyWithImpl(_$HealthScoreResModelImpl _value,
      $Res Function(_$HealthScoreResModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of HealthScoreResModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userName = freezed,
    Object? userId = freezed,
    Object? userData = freezed,
    Object? bmi = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? healthScore = freezed,
    Object? scoreStatus = freezed,
    Object? scoreColor = freezed,
    Object? patientId = freezed,
    Object? status = null,
  }) {
    return _then(_$HealthScoreResModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as String?,
      bmi: freezed == bmi
          ? _value.bmi
          : bmi // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String?,
      healthScore: freezed == healthScore
          ? _value.healthScore
          : healthScore // ignore: cast_nullable_to_non_nullable
              as String?,
      scoreStatus: freezed == scoreStatus
          ? _value.scoreStatus
          : scoreStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      scoreColor: freezed == scoreColor
          ? _value.scoreColor
          : scoreColor // ignore: cast_nullable_to_non_nullable
              as String?,
      patientId: freezed == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthScoreResModelImpl implements _HealthScoreResModel {
  _$HealthScoreResModelImpl(
      {this.id,
      @JsonKey(name: 'user_name') this.userName,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'user_data') this.userData,
      @JsonKey(name: 'bmi') this.bmi,
      @JsonKey(name: 'height') this.height,
      @JsonKey(name: 'weight') this.weight,
      @JsonKey(name: 'health_score') this.healthScore,
      @JsonKey(name: 'score_status') this.scoreStatus,
      @JsonKey(name: 'score_color') this.scoreColor,
      @JsonKey(name: 'patient_id') this.patientId,
      @JsonKey(name: 'status') this.status = '1'});

  factory _$HealthScoreResModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthScoreResModelImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'user_name')
  final String? userName;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'user_data')
  final String? userData;
  @override
  @JsonKey(name: 'bmi')
  final String? bmi;
  @override
  @JsonKey(name: 'height')
  final String? height;
  @override
  @JsonKey(name: 'weight')
  final String? weight;
  @override
  @JsonKey(name: 'health_score')
  final String? healthScore;
  @override
  @JsonKey(name: 'score_status')
  final String? scoreStatus;
  @override
  @JsonKey(name: 'score_color')
  final String? scoreColor;
  @override
  @JsonKey(name: 'patient_id')
  final String? patientId;
  @override
  @JsonKey(name: 'status')
  final String status;

  @override
  String toString() {
    return 'HealthScoreResModel(id: $id, userName: $userName, userId: $userId, userData: $userData, bmi: $bmi, height: $height, weight: $weight, healthScore: $healthScore, scoreStatus: $scoreStatus, scoreColor: $scoreColor, patientId: $patientId, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthScoreResModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userData, userData) ||
                other.userData == userData) &&
            (identical(other.bmi, bmi) || other.bmi == bmi) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.healthScore, healthScore) ||
                other.healthScore == healthScore) &&
            (identical(other.scoreStatus, scoreStatus) ||
                other.scoreStatus == scoreStatus) &&
            (identical(other.scoreColor, scoreColor) ||
                other.scoreColor == scoreColor) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userName,
      userId,
      userData,
      bmi,
      height,
      weight,
      healthScore,
      scoreStatus,
      scoreColor,
      patientId,
      status);

  /// Create a copy of HealthScoreResModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthScoreResModelImplCopyWith<_$HealthScoreResModelImpl> get copyWith =>
      __$$HealthScoreResModelImplCopyWithImpl<_$HealthScoreResModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthScoreResModelImplToJson(
      this,
    );
  }
}

abstract class _HealthScoreResModel implements HealthScoreResModel {
  factory _HealthScoreResModel(
          {final int? id,
          @JsonKey(name: 'user_name') final String? userName,
          @JsonKey(name: 'user_id') final String? userId,
          @JsonKey(name: 'user_data') final String? userData,
          @JsonKey(name: 'bmi') final String? bmi,
          @JsonKey(name: 'height') final String? height,
          @JsonKey(name: 'weight') final String? weight,
          @JsonKey(name: 'health_score') final String? healthScore,
          @JsonKey(name: 'score_status') final String? scoreStatus,
          @JsonKey(name: 'score_color') final String? scoreColor,
          @JsonKey(name: 'patient_id') final String? patientId,
          @JsonKey(name: 'status') final String status}) =
      _$HealthScoreResModelImpl;

  factory _HealthScoreResModel.fromJson(Map<String, dynamic> json) =
      _$HealthScoreResModelImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'user_name')
  String? get userName;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'user_data')
  String? get userData;
  @override
  @JsonKey(name: 'bmi')
  String? get bmi;
  @override
  @JsonKey(name: 'height')
  String? get height;
  @override
  @JsonKey(name: 'weight')
  String? get weight;
  @override
  @JsonKey(name: 'health_score')
  String? get healthScore;
  @override
  @JsonKey(name: 'score_status')
  String? get scoreStatus;
  @override
  @JsonKey(name: 'score_color')
  String? get scoreColor;
  @override
  @JsonKey(name: 'patient_id')
  String? get patientId;
  @override
  @JsonKey(name: 'status')
  String get status;

  /// Create a copy of HealthScoreResModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthScoreResModelImplCopyWith<_$HealthScoreResModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
