// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_score_question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HealthScoreQuestionModel _$HealthScoreQuestionModelFromJson(
    Map<String, dynamic> json) {
  return _HealthScoreQuestionModel.fromJson(json);
}

/// @nodoc
mixin _$HealthScoreQuestionModel {
  String get option => throw _privateConstructorUsedError;
  int get marks => throw _privateConstructorUsedError;

  /// Serializes this HealthScoreQuestionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HealthScoreQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthScoreQuestionModelCopyWith<HealthScoreQuestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthScoreQuestionModelCopyWith<$Res> {
  factory $HealthScoreQuestionModelCopyWith(HealthScoreQuestionModel value,
          $Res Function(HealthScoreQuestionModel) then) =
      _$HealthScoreQuestionModelCopyWithImpl<$Res, HealthScoreQuestionModel>;
  @useResult
  $Res call({String option, int marks});
}

/// @nodoc
class _$HealthScoreQuestionModelCopyWithImpl<$Res,
        $Val extends HealthScoreQuestionModel>
    implements $HealthScoreQuestionModelCopyWith<$Res> {
  _$HealthScoreQuestionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HealthScoreQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? option = null,
    Object? marks = null,
  }) {
    return _then(_value.copyWith(
      option: null == option
          ? _value.option
          : option // ignore: cast_nullable_to_non_nullable
              as String,
      marks: null == marks
          ? _value.marks
          : marks // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HealthScoreQuestionModelImplCopyWith<$Res>
    implements $HealthScoreQuestionModelCopyWith<$Res> {
  factory _$$HealthScoreQuestionModelImplCopyWith(
          _$HealthScoreQuestionModelImpl value,
          $Res Function(_$HealthScoreQuestionModelImpl) then) =
      __$$HealthScoreQuestionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String option, int marks});
}

/// @nodoc
class __$$HealthScoreQuestionModelImplCopyWithImpl<$Res>
    extends _$HealthScoreQuestionModelCopyWithImpl<$Res,
        _$HealthScoreQuestionModelImpl>
    implements _$$HealthScoreQuestionModelImplCopyWith<$Res> {
  __$$HealthScoreQuestionModelImplCopyWithImpl(
      _$HealthScoreQuestionModelImpl _value,
      $Res Function(_$HealthScoreQuestionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of HealthScoreQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? option = null,
    Object? marks = null,
  }) {
    return _then(_$HealthScoreQuestionModelImpl(
      option: null == option
          ? _value.option
          : option // ignore: cast_nullable_to_non_nullable
              as String,
      marks: null == marks
          ? _value.marks
          : marks // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthScoreQuestionModelImpl implements _HealthScoreQuestionModel {
  const _$HealthScoreQuestionModelImpl(
      {required this.option, required this.marks});

  factory _$HealthScoreQuestionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthScoreQuestionModelImplFromJson(json);

  @override
  final String option;
  @override
  final int marks;

  @override
  String toString() {
    return 'HealthScoreQuestionModel(option: $option, marks: $marks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthScoreQuestionModelImpl &&
            (identical(other.option, option) || other.option == option) &&
            (identical(other.marks, marks) || other.marks == marks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, option, marks);

  /// Create a copy of HealthScoreQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthScoreQuestionModelImplCopyWith<_$HealthScoreQuestionModelImpl>
      get copyWith => __$$HealthScoreQuestionModelImplCopyWithImpl<
          _$HealthScoreQuestionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthScoreQuestionModelImplToJson(
      this,
    );
  }
}

abstract class _HealthScoreQuestionModel implements HealthScoreQuestionModel {
  const factory _HealthScoreQuestionModel(
      {required final String option,
      required final int marks}) = _$HealthScoreQuestionModelImpl;

  factory _HealthScoreQuestionModel.fromJson(Map<String, dynamic> json) =
      _$HealthScoreQuestionModelImpl.fromJson;

  @override
  String get option;
  @override
  int get marks;

  /// Create a copy of HealthScoreQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthScoreQuestionModelImplCopyWith<_$HealthScoreQuestionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
