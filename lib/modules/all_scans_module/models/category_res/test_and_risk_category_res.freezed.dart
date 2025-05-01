// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_and_risk_category_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TestAndRiskCategoryRes _$TestAndRiskCategoryResFromJson(
    Map<String, dynamic> json) {
  return _TestAndRiskCategoryRes.fromJson(json);
}

/// @nodoc
mixin _$TestAndRiskCategoryRes {
  List<RiskAreaCategory> get riskCategories =>
      throw _privateConstructorUsedError;
  List<TestCategoryModel> get testCategories =>
      throw _privateConstructorUsedError;

  /// Serializes this TestAndRiskCategoryRes to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TestAndRiskCategoryRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TestAndRiskCategoryResCopyWith<TestAndRiskCategoryRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestAndRiskCategoryResCopyWith<$Res> {
  factory $TestAndRiskCategoryResCopyWith(TestAndRiskCategoryRes value,
          $Res Function(TestAndRiskCategoryRes) then) =
      _$TestAndRiskCategoryResCopyWithImpl<$Res, TestAndRiskCategoryRes>;
  @useResult
  $Res call(
      {List<RiskAreaCategory> riskCategories,
      List<TestCategoryModel> testCategories});
}

/// @nodoc
class _$TestAndRiskCategoryResCopyWithImpl<$Res,
        $Val extends TestAndRiskCategoryRes>
    implements $TestAndRiskCategoryResCopyWith<$Res> {
  _$TestAndRiskCategoryResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TestAndRiskCategoryRes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? riskCategories = null,
    Object? testCategories = null,
  }) {
    return _then(_value.copyWith(
      riskCategories: null == riskCategories
          ? _value.riskCategories
          : riskCategories // ignore: cast_nullable_to_non_nullable
              as List<RiskAreaCategory>,
      testCategories: null == testCategories
          ? _value.testCategories
          : testCategories // ignore: cast_nullable_to_non_nullable
              as List<TestCategoryModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TestAndRiskCategoryResImplCopyWith<$Res>
    implements $TestAndRiskCategoryResCopyWith<$Res> {
  factory _$$TestAndRiskCategoryResImplCopyWith(
          _$TestAndRiskCategoryResImpl value,
          $Res Function(_$TestAndRiskCategoryResImpl) then) =
      __$$TestAndRiskCategoryResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<RiskAreaCategory> riskCategories,
      List<TestCategoryModel> testCategories});
}

/// @nodoc
class __$$TestAndRiskCategoryResImplCopyWithImpl<$Res>
    extends _$TestAndRiskCategoryResCopyWithImpl<$Res,
        _$TestAndRiskCategoryResImpl>
    implements _$$TestAndRiskCategoryResImplCopyWith<$Res> {
  __$$TestAndRiskCategoryResImplCopyWithImpl(
      _$TestAndRiskCategoryResImpl _value,
      $Res Function(_$TestAndRiskCategoryResImpl) _then)
      : super(_value, _then);

  /// Create a copy of TestAndRiskCategoryRes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? riskCategories = null,
    Object? testCategories = null,
  }) {
    return _then(_$TestAndRiskCategoryResImpl(
      riskCategories: null == riskCategories
          ? _value.riskCategories
          : riskCategories // ignore: cast_nullable_to_non_nullable
              as List<RiskAreaCategory>,
      testCategories: null == testCategories
          ? _value.testCategories
          : testCategories // ignore: cast_nullable_to_non_nullable
              as List<TestCategoryModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TestAndRiskCategoryResImpl implements _TestAndRiskCategoryRes {
  const _$TestAndRiskCategoryResImpl(
      {this.riskCategories = const [], this.testCategories = const []});

  factory _$TestAndRiskCategoryResImpl.fromJson(Map<String, dynamic> json) =>
      _$$TestAndRiskCategoryResImplFromJson(json);

  @override
  @JsonKey()
  final List<RiskAreaCategory> riskCategories;
  @override
  @JsonKey()
  final List<TestCategoryModel> testCategories;

  @override
  String toString() {
    return 'TestAndRiskCategoryRes(riskCategories: $riskCategories, testCategories: $testCategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestAndRiskCategoryResImpl &&
            const DeepCollectionEquality()
                .equals(other.riskCategories, riskCategories) &&
            const DeepCollectionEquality()
                .equals(other.testCategories, testCategories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(riskCategories),
      const DeepCollectionEquality().hash(testCategories));

  /// Create a copy of TestAndRiskCategoryRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TestAndRiskCategoryResImplCopyWith<_$TestAndRiskCategoryResImpl>
      get copyWith => __$$TestAndRiskCategoryResImplCopyWithImpl<
          _$TestAndRiskCategoryResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TestAndRiskCategoryResImplToJson(
      this,
    );
  }
}

abstract class _TestAndRiskCategoryRes implements TestAndRiskCategoryRes {
  const factory _TestAndRiskCategoryRes(
          {final List<RiskAreaCategory> riskCategories,
          final List<TestCategoryModel> testCategories}) =
      _$TestAndRiskCategoryResImpl;

  factory _TestAndRiskCategoryRes.fromJson(Map<String, dynamic> json) =
      _$TestAndRiskCategoryResImpl.fromJson;

  @override
  List<RiskAreaCategory> get riskCategories;
  @override
  List<TestCategoryModel> get testCategories;

  /// Create a copy of TestAndRiskCategoryRes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TestAndRiskCategoryResImplCopyWith<_$TestAndRiskCategoryResImpl>
      get copyWith => throw _privateConstructorUsedError;
}
