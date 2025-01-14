// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Faq _$FaqFromJson(Map<String, dynamic> json) {
  return _Faq.fromJson(json);
}

/// @nodoc
mixin _$Faq {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'test_id')
  int get testId => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  @JsonKey(name: 'dis_order')
  int get disOrder => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this Faq to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Faq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FaqCopyWith<Faq> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqCopyWith<$Res> {
  factory $FaqCopyWith(Faq value, $Res Function(Faq) then) =
      _$FaqCopyWithImpl<$Res, Faq>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'test_id') int testId,
      String question,
      String answer,
      @JsonKey(name: 'dis_order') int disOrder,
      String status});
}

/// @nodoc
class _$FaqCopyWithImpl<$Res, $Val extends Faq> implements $FaqCopyWith<$Res> {
  _$FaqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Faq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? testId = null,
    Object? question = null,
    Object? answer = null,
    Object? disOrder = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      testId: null == testId
          ? _value.testId
          : testId // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
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
abstract class _$$FaqImplCopyWith<$Res> implements $FaqCopyWith<$Res> {
  factory _$$FaqImplCopyWith(_$FaqImpl value, $Res Function(_$FaqImpl) then) =
      __$$FaqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'test_id') int testId,
      String question,
      String answer,
      @JsonKey(name: 'dis_order') int disOrder,
      String status});
}

/// @nodoc
class __$$FaqImplCopyWithImpl<$Res> extends _$FaqCopyWithImpl<$Res, _$FaqImpl>
    implements _$$FaqImplCopyWith<$Res> {
  __$$FaqImplCopyWithImpl(_$FaqImpl _value, $Res Function(_$FaqImpl) _then)
      : super(_value, _then);

  /// Create a copy of Faq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? testId = null,
    Object? question = null,
    Object? answer = null,
    Object? disOrder = null,
    Object? status = null,
  }) {
    return _then(_$FaqImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      testId: null == testId
          ? _value.testId
          : testId // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
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
class _$FaqImpl implements _Faq {
  const _$FaqImpl(
      {required this.id,
      @JsonKey(name: 'test_id') required this.testId,
      required this.question,
      required this.answer,
      @JsonKey(name: 'dis_order') required this.disOrder,
      required this.status});

  factory _$FaqImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaqImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'test_id')
  final int testId;
  @override
  final String question;
  @override
  final String answer;
  @override
  @JsonKey(name: 'dis_order')
  final int disOrder;
  @override
  final String status;

  @override
  String toString() {
    return 'Faq(id: $id, testId: $testId, question: $question, answer: $answer, disOrder: $disOrder, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaqImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.testId, testId) || other.testId == testId) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.disOrder, disOrder) ||
                other.disOrder == disOrder) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, testId, question, answer, disOrder, status);

  /// Create a copy of Faq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FaqImplCopyWith<_$FaqImpl> get copyWith =>
      __$$FaqImplCopyWithImpl<_$FaqImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaqImplToJson(
      this,
    );
  }
}

abstract class _Faq implements Faq {
  const factory _Faq(
      {required final int id,
      @JsonKey(name: 'test_id') required final int testId,
      required final String question,
      required final String answer,
      @JsonKey(name: 'dis_order') required final int disOrder,
      required final String status}) = _$FaqImpl;

  factory _Faq.fromJson(Map<String, dynamic> json) = _$FaqImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'test_id')
  int get testId;
  @override
  String get question;
  @override
  String get answer;
  @override
  @JsonKey(name: 'dis_order')
  int get disOrder;
  @override
  String get status;

  /// Create a copy of Faq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FaqImplCopyWith<_$FaqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
