// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wellness_question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WellnessQuestion _$WellnessQuestionFromJson(Map<String, dynamic> json) {
  return _WellnessQuestion.fromJson(json);
}

/// @nodoc
mixin _$WellnessQuestion {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'prd_id')
  String get prdId => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: QuestionnaireTypeExtension.fromString,
      toJson: _toJson,
      name: 'question_type')
  QuestionnaireType get questionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_title')
  String get questionTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'options')
  String get options => throw _privateConstructorUsedError;
  @JsonKey(name: 'dis_order')
  int get disOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;

  /// Serializes this WellnessQuestion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WellnessQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WellnessQuestionCopyWith<WellnessQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WellnessQuestionCopyWith<$Res> {
  factory $WellnessQuestionCopyWith(
          WellnessQuestion value, $Res Function(WellnessQuestion) then) =
      _$WellnessQuestionCopyWithImpl<$Res, WellnessQuestion>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'prd_id') String prdId,
      @JsonKey(
          fromJson: QuestionnaireTypeExtension.fromString,
          toJson: _toJson,
          name: 'question_type')
      QuestionnaireType questionType,
      @JsonKey(name: 'question_title') String questionTitle,
      @JsonKey(name: 'options') String options,
      @JsonKey(name: 'dis_order') int disOrder,
      @JsonKey(name: 'status') String status});
}

/// @nodoc
class _$WellnessQuestionCopyWithImpl<$Res, $Val extends WellnessQuestion>
    implements $WellnessQuestionCopyWith<$Res> {
  _$WellnessQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WellnessQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? prdId = null,
    Object? questionType = null,
    Object? questionTitle = null,
    Object? options = null,
    Object? disOrder = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      prdId: null == prdId
          ? _value.prdId
          : prdId // ignore: cast_nullable_to_non_nullable
              as String,
      questionType: null == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as QuestionnaireType,
      questionTitle: null == questionTitle
          ? _value.questionTitle
          : questionTitle // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as String,
      disOrder: null == disOrder
          ? _value.disOrder
          : disOrder // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WellnessQuestionImplCopyWith<$Res>
    implements $WellnessQuestionCopyWith<$Res> {
  factory _$$WellnessQuestionImplCopyWith(_$WellnessQuestionImpl value,
          $Res Function(_$WellnessQuestionImpl) then) =
      __$$WellnessQuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'prd_id') String prdId,
      @JsonKey(
          fromJson: QuestionnaireTypeExtension.fromString,
          toJson: _toJson,
          name: 'question_type')
      QuestionnaireType questionType,
      @JsonKey(name: 'question_title') String questionTitle,
      @JsonKey(name: 'options') String options,
      @JsonKey(name: 'dis_order') int disOrder,
      @JsonKey(name: 'status') String status});
}

/// @nodoc
class __$$WellnessQuestionImplCopyWithImpl<$Res>
    extends _$WellnessQuestionCopyWithImpl<$Res, _$WellnessQuestionImpl>
    implements _$$WellnessQuestionImplCopyWith<$Res> {
  __$$WellnessQuestionImplCopyWithImpl(_$WellnessQuestionImpl _value,
      $Res Function(_$WellnessQuestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of WellnessQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? prdId = null,
    Object? questionType = null,
    Object? questionTitle = null,
    Object? options = null,
    Object? disOrder = null,
    Object? status = null,
  }) {
    return _then(_$WellnessQuestionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      prdId: null == prdId
          ? _value.prdId
          : prdId // ignore: cast_nullable_to_non_nullable
              as String,
      questionType: null == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as QuestionnaireType,
      questionTitle: null == questionTitle
          ? _value.questionTitle
          : questionTitle // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as String,
      disOrder: null == disOrder
          ? _value.disOrder
          : disOrder // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WellnessQuestionImpl implements _WellnessQuestion {
  const _$WellnessQuestionImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'prd_id') required this.prdId,
      @JsonKey(
          fromJson: QuestionnaireTypeExtension.fromString,
          toJson: _toJson,
          name: 'question_type')
      required this.questionType,
      @JsonKey(name: 'question_title') required this.questionTitle,
      @JsonKey(name: 'options') required this.options,
      @JsonKey(name: 'dis_order') required this.disOrder,
      @JsonKey(name: 'status') required this.status});

  factory _$WellnessQuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$WellnessQuestionImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'prd_id')
  final String prdId;
  @override
  @JsonKey(
      fromJson: QuestionnaireTypeExtension.fromString,
      toJson: _toJson,
      name: 'question_type')
  final QuestionnaireType questionType;
  @override
  @JsonKey(name: 'question_title')
  final String questionTitle;
  @override
  @JsonKey(name: 'options')
  final String options;
  @override
  @JsonKey(name: 'dis_order')
  final int disOrder;
  @override
  @JsonKey(name: 'status')
  final String status;

  @override
  String toString() {
    return 'WellnessQuestion(id: $id, prdId: $prdId, questionType: $questionType, questionTitle: $questionTitle, options: $options, disOrder: $disOrder, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WellnessQuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.prdId, prdId) || other.prdId == prdId) &&
            (identical(other.questionType, questionType) ||
                other.questionType == questionType) &&
            (identical(other.questionTitle, questionTitle) ||
                other.questionTitle == questionTitle) &&
            (identical(other.options, options) || other.options == options) &&
            (identical(other.disOrder, disOrder) ||
                other.disOrder == disOrder) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, prdId, questionType,
      questionTitle, options, disOrder, status);

  /// Create a copy of WellnessQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WellnessQuestionImplCopyWith<_$WellnessQuestionImpl> get copyWith =>
      __$$WellnessQuestionImplCopyWithImpl<_$WellnessQuestionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WellnessQuestionImplToJson(
      this,
    );
  }
}

abstract class _WellnessQuestion implements WellnessQuestion {
  const factory _WellnessQuestion(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'prd_id') required final String prdId,
          @JsonKey(
              fromJson: QuestionnaireTypeExtension.fromString,
              toJson: _toJson,
              name: 'question_type')
          required final QuestionnaireType questionType,
          @JsonKey(name: 'question_title') required final String questionTitle,
          @JsonKey(name: 'options') required final String options,
          @JsonKey(name: 'dis_order') required final int disOrder,
          @JsonKey(name: 'status') required final String status}) =
      _$WellnessQuestionImpl;

  factory _WellnessQuestion.fromJson(Map<String, dynamic> json) =
      _$WellnessQuestionImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'prd_id')
  String get prdId;
  @override
  @JsonKey(
      fromJson: QuestionnaireTypeExtension.fromString,
      toJson: _toJson,
      name: 'question_type')
  QuestionnaireType get questionType;
  @override
  @JsonKey(name: 'question_title')
  String get questionTitle;
  @override
  @JsonKey(name: 'options')
  String get options;
  @override
  @JsonKey(name: 'dis_order')
  int get disOrder;
  @override
  @JsonKey(name: 'status')
  String get status;

  /// Create a copy of WellnessQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WellnessQuestionImplCopyWith<_$WellnessQuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
