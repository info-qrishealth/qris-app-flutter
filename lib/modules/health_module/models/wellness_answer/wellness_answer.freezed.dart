// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wellness_answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WellnessAnswer _$WellnessAnswerFromJson(Map<String, dynamic> json) {
  return _WellnessAnswer.fromJson(json);
}

/// @nodoc
mixin _$WellnessAnswer {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  int? get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ptnt_id')
  String? get ptntId => throw _privateConstructorUsedError;
  @JsonKey(name: 'prd_id')
  String? get prdId => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_id')
  int get questionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'question')
  String get question => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer')
  String get answer => throw _privateConstructorUsedError;

  /// Serializes this WellnessAnswer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WellnessAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WellnessAnswerCopyWith<WellnessAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WellnessAnswerCopyWith<$Res> {
  factory $WellnessAnswerCopyWith(
          WellnessAnswer value, $Res Function(WellnessAnswer) then) =
      _$WellnessAnswerCopyWithImpl<$Res, WellnessAnswer>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'order_id') int? orderId,
      @JsonKey(name: 'ptnt_id') String? ptntId,
      @JsonKey(name: 'prd_id') String? prdId,
      @JsonKey(name: 'question_id') int questionId,
      @JsonKey(name: 'question') String question,
      @JsonKey(name: 'answer') String answer});
}

/// @nodoc
class _$WellnessAnswerCopyWithImpl<$Res, $Val extends WellnessAnswer>
    implements $WellnessAnswerCopyWith<$Res> {
  _$WellnessAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WellnessAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? orderId = freezed,
    Object? ptntId = freezed,
    Object? prdId = freezed,
    Object? questionId = null,
    Object? question = null,
    Object? answer = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
      ptntId: freezed == ptntId
          ? _value.ptntId
          : ptntId // ignore: cast_nullable_to_non_nullable
              as String?,
      prdId: freezed == prdId
          ? _value.prdId
          : prdId // ignore: cast_nullable_to_non_nullable
              as String?,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WellnessAnswerImplCopyWith<$Res>
    implements $WellnessAnswerCopyWith<$Res> {
  factory _$$WellnessAnswerImplCopyWith(_$WellnessAnswerImpl value,
          $Res Function(_$WellnessAnswerImpl) then) =
      __$$WellnessAnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'order_id') int? orderId,
      @JsonKey(name: 'ptnt_id') String? ptntId,
      @JsonKey(name: 'prd_id') String? prdId,
      @JsonKey(name: 'question_id') int questionId,
      @JsonKey(name: 'question') String question,
      @JsonKey(name: 'answer') String answer});
}

/// @nodoc
class __$$WellnessAnswerImplCopyWithImpl<$Res>
    extends _$WellnessAnswerCopyWithImpl<$Res, _$WellnessAnswerImpl>
    implements _$$WellnessAnswerImplCopyWith<$Res> {
  __$$WellnessAnswerImplCopyWithImpl(
      _$WellnessAnswerImpl _value, $Res Function(_$WellnessAnswerImpl) _then)
      : super(_value, _then);

  /// Create a copy of WellnessAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? orderId = freezed,
    Object? ptntId = freezed,
    Object? prdId = freezed,
    Object? questionId = null,
    Object? question = null,
    Object? answer = null,
  }) {
    return _then(_$WellnessAnswerImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
      ptntId: freezed == ptntId
          ? _value.ptntId
          : ptntId // ignore: cast_nullable_to_non_nullable
              as String?,
      prdId: freezed == prdId
          ? _value.prdId
          : prdId // ignore: cast_nullable_to_non_nullable
              as String?,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WellnessAnswerImpl implements _WellnessAnswer {
  _$WellnessAnswerImpl(
      {this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'order_id') this.orderId,
      @JsonKey(name: 'ptnt_id') this.ptntId,
      @JsonKey(name: 'prd_id') this.prdId,
      @JsonKey(name: 'question_id') required this.questionId,
      @JsonKey(name: 'question') required this.question,
      @JsonKey(name: 'answer') required this.answer});

  factory _$WellnessAnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$WellnessAnswerImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'order_id')
  final int? orderId;
  @override
  @JsonKey(name: 'ptnt_id')
  final String? ptntId;
  @override
  @JsonKey(name: 'prd_id')
  final String? prdId;
  @override
  @JsonKey(name: 'question_id')
  final int questionId;
  @override
  @JsonKey(name: 'question')
  final String question;
  @override
  @JsonKey(name: 'answer')
  final String answer;

  @override
  String toString() {
    return 'WellnessAnswer(id: $id, userId: $userId, orderId: $orderId, ptntId: $ptntId, prdId: $prdId, questionId: $questionId, question: $question, answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WellnessAnswerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.ptntId, ptntId) || other.ptntId == ptntId) &&
            (identical(other.prdId, prdId) || other.prdId == prdId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, orderId, ptntId,
      prdId, questionId, question, answer);

  /// Create a copy of WellnessAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WellnessAnswerImplCopyWith<_$WellnessAnswerImpl> get copyWith =>
      __$$WellnessAnswerImplCopyWithImpl<_$WellnessAnswerImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WellnessAnswerImplToJson(
      this,
    );
  }
}

abstract class _WellnessAnswer implements WellnessAnswer {
  factory _WellnessAnswer(
          {final int? id,
          @JsonKey(name: 'user_id') final int? userId,
          @JsonKey(name: 'order_id') final int? orderId,
          @JsonKey(name: 'ptnt_id') final String? ptntId,
          @JsonKey(name: 'prd_id') final String? prdId,
          @JsonKey(name: 'question_id') required final int questionId,
          @JsonKey(name: 'question') required final String question,
          @JsonKey(name: 'answer') required final String answer}) =
      _$WellnessAnswerImpl;

  factory _WellnessAnswer.fromJson(Map<String, dynamic> json) =
      _$WellnessAnswerImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'order_id')
  int? get orderId;
  @override
  @JsonKey(name: 'ptnt_id')
  String? get ptntId;
  @override
  @JsonKey(name: 'prd_id')
  String? get prdId;
  @override
  @JsonKey(name: 'question_id')
  int get questionId;
  @override
  @JsonKey(name: 'question')
  String get question;
  @override
  @JsonKey(name: 'answer')
  String get answer;

  /// Create a copy of WellnessAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WellnessAnswerImplCopyWith<_$WellnessAnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
