// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chronic_disease_package.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChronicDiseasePackage _$ChronicDiseasePackageFromJson(
    Map<String, dynamic> json) {
  return _ChronicDiseasePackage.fromJson(json);
}

/// @nodoc
mixin _$ChronicDiseasePackage {
  String get title => throw _privateConstructorUsedError;
  String? get idealFor => throw _privateConstructorUsedError;
  String? get why => throw _privateConstructorUsedError;
  List<ChronicPackageItem> get includes => throw _privateConstructorUsedError;
  double get originalPrice => throw _privateConstructorUsedError;
  double get discountedPrice => throw _privateConstructorUsedError;

  /// Serializes this ChronicDiseasePackage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChronicDiseasePackage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChronicDiseasePackageCopyWith<ChronicDiseasePackage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChronicDiseasePackageCopyWith<$Res> {
  factory $ChronicDiseasePackageCopyWith(ChronicDiseasePackage value,
          $Res Function(ChronicDiseasePackage) then) =
      _$ChronicDiseasePackageCopyWithImpl<$Res, ChronicDiseasePackage>;
  @useResult
  $Res call(
      {String title,
      String? idealFor,
      String? why,
      List<ChronicPackageItem> includes,
      double originalPrice,
      double discountedPrice});
}

/// @nodoc
class _$ChronicDiseasePackageCopyWithImpl<$Res,
        $Val extends ChronicDiseasePackage>
    implements $ChronicDiseasePackageCopyWith<$Res> {
  _$ChronicDiseasePackageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChronicDiseasePackage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? idealFor = freezed,
    Object? why = freezed,
    Object? includes = null,
    Object? originalPrice = null,
    Object? discountedPrice = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      idealFor: freezed == idealFor
          ? _value.idealFor
          : idealFor // ignore: cast_nullable_to_non_nullable
              as String?,
      why: freezed == why
          ? _value.why
          : why // ignore: cast_nullable_to_non_nullable
              as String?,
      includes: null == includes
          ? _value.includes
          : includes // ignore: cast_nullable_to_non_nullable
              as List<ChronicPackageItem>,
      originalPrice: null == originalPrice
          ? _value.originalPrice
          : originalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      discountedPrice: null == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChronicDiseasePackageImplCopyWith<$Res>
    implements $ChronicDiseasePackageCopyWith<$Res> {
  factory _$$ChronicDiseasePackageImplCopyWith(
          _$ChronicDiseasePackageImpl value,
          $Res Function(_$ChronicDiseasePackageImpl) then) =
      __$$ChronicDiseasePackageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String? idealFor,
      String? why,
      List<ChronicPackageItem> includes,
      double originalPrice,
      double discountedPrice});
}

/// @nodoc
class __$$ChronicDiseasePackageImplCopyWithImpl<$Res>
    extends _$ChronicDiseasePackageCopyWithImpl<$Res,
        _$ChronicDiseasePackageImpl>
    implements _$$ChronicDiseasePackageImplCopyWith<$Res> {
  __$$ChronicDiseasePackageImplCopyWithImpl(_$ChronicDiseasePackageImpl _value,
      $Res Function(_$ChronicDiseasePackageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChronicDiseasePackage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? idealFor = freezed,
    Object? why = freezed,
    Object? includes = null,
    Object? originalPrice = null,
    Object? discountedPrice = null,
  }) {
    return _then(_$ChronicDiseasePackageImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      idealFor: freezed == idealFor
          ? _value.idealFor
          : idealFor // ignore: cast_nullable_to_non_nullable
              as String?,
      why: freezed == why
          ? _value.why
          : why // ignore: cast_nullable_to_non_nullable
              as String?,
      includes: null == includes
          ? _value._includes
          : includes // ignore: cast_nullable_to_non_nullable
              as List<ChronicPackageItem>,
      originalPrice: null == originalPrice
          ? _value.originalPrice
          : originalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      discountedPrice: null == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChronicDiseasePackageImpl implements _ChronicDiseasePackage {
  const _$ChronicDiseasePackageImpl(
      {required this.title,
      this.idealFor,
      this.why,
      required final List<ChronicPackageItem> includes,
      required this.originalPrice,
      required this.discountedPrice})
      : _includes = includes;

  factory _$ChronicDiseasePackageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChronicDiseasePackageImplFromJson(json);

  @override
  final String title;
  @override
  final String? idealFor;
  @override
  final String? why;
  final List<ChronicPackageItem> _includes;
  @override
  List<ChronicPackageItem> get includes {
    if (_includes is EqualUnmodifiableListView) return _includes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_includes);
  }

  @override
  final double originalPrice;
  @override
  final double discountedPrice;

  @override
  String toString() {
    return 'ChronicDiseasePackage(title: $title, idealFor: $idealFor, why: $why, includes: $includes, originalPrice: $originalPrice, discountedPrice: $discountedPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChronicDiseasePackageImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.idealFor, idealFor) ||
                other.idealFor == idealFor) &&
            (identical(other.why, why) || other.why == why) &&
            const DeepCollectionEquality().equals(other._includes, _includes) &&
            (identical(other.originalPrice, originalPrice) ||
                other.originalPrice == originalPrice) &&
            (identical(other.discountedPrice, discountedPrice) ||
                other.discountedPrice == discountedPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      idealFor,
      why,
      const DeepCollectionEquality().hash(_includes),
      originalPrice,
      discountedPrice);

  /// Create a copy of ChronicDiseasePackage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChronicDiseasePackageImplCopyWith<_$ChronicDiseasePackageImpl>
      get copyWith => __$$ChronicDiseasePackageImplCopyWithImpl<
          _$ChronicDiseasePackageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChronicDiseasePackageImplToJson(
      this,
    );
  }
}

abstract class _ChronicDiseasePackage implements ChronicDiseasePackage {
  const factory _ChronicDiseasePackage(
      {required final String title,
      final String? idealFor,
      final String? why,
      required final List<ChronicPackageItem> includes,
      required final double originalPrice,
      required final double discountedPrice}) = _$ChronicDiseasePackageImpl;

  factory _ChronicDiseasePackage.fromJson(Map<String, dynamic> json) =
      _$ChronicDiseasePackageImpl.fromJson;

  @override
  String get title;
  @override
  String? get idealFor;
  @override
  String? get why;
  @override
  List<ChronicPackageItem> get includes;
  @override
  double get originalPrice;
  @override
  double get discountedPrice;

  /// Create a copy of ChronicDiseasePackage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChronicDiseasePackageImplCopyWith<_$ChronicDiseasePackageImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChronicPackageItem _$ChronicPackageItemFromJson(Map<String, dynamic> json) {
  return _ChronicPackageItem.fromJson(json);
}

/// @nodoc
mixin _$ChronicPackageItem {
  ChronicPackageItemType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get details => throw _privateConstructorUsedError;

  /// Serializes this ChronicPackageItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChronicPackageItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChronicPackageItemCopyWith<ChronicPackageItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChronicPackageItemCopyWith<$Res> {
  factory $ChronicPackageItemCopyWith(
          ChronicPackageItem value, $Res Function(ChronicPackageItem) then) =
      _$ChronicPackageItemCopyWithImpl<$Res, ChronicPackageItem>;
  @useResult
  $Res call({ChronicPackageItemType type, String title, String? details});
}

/// @nodoc
class _$ChronicPackageItemCopyWithImpl<$Res, $Val extends ChronicPackageItem>
    implements $ChronicPackageItemCopyWith<$Res> {
  _$ChronicPackageItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChronicPackageItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? title = null,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChronicPackageItemType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChronicPackageItemImplCopyWith<$Res>
    implements $ChronicPackageItemCopyWith<$Res> {
  factory _$$ChronicPackageItemImplCopyWith(_$ChronicPackageItemImpl value,
          $Res Function(_$ChronicPackageItemImpl) then) =
      __$$ChronicPackageItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ChronicPackageItemType type, String title, String? details});
}

/// @nodoc
class __$$ChronicPackageItemImplCopyWithImpl<$Res>
    extends _$ChronicPackageItemCopyWithImpl<$Res, _$ChronicPackageItemImpl>
    implements _$$ChronicPackageItemImplCopyWith<$Res> {
  __$$ChronicPackageItemImplCopyWithImpl(_$ChronicPackageItemImpl _value,
      $Res Function(_$ChronicPackageItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChronicPackageItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? title = null,
    Object? details = freezed,
  }) {
    return _then(_$ChronicPackageItemImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChronicPackageItemType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChronicPackageItemImpl implements _ChronicPackageItem {
  const _$ChronicPackageItemImpl(
      {required this.type, required this.title, this.details});

  factory _$ChronicPackageItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChronicPackageItemImplFromJson(json);

  @override
  final ChronicPackageItemType type;
  @override
  final String title;
  @override
  final String? details;

  @override
  String toString() {
    return 'ChronicPackageItem(type: $type, title: $title, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChronicPackageItemImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, title, details);

  /// Create a copy of ChronicPackageItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChronicPackageItemImplCopyWith<_$ChronicPackageItemImpl> get copyWith =>
      __$$ChronicPackageItemImplCopyWithImpl<_$ChronicPackageItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChronicPackageItemImplToJson(
      this,
    );
  }
}

abstract class _ChronicPackageItem implements ChronicPackageItem {
  const factory _ChronicPackageItem(
      {required final ChronicPackageItemType type,
      required final String title,
      final String? details}) = _$ChronicPackageItemImpl;

  factory _ChronicPackageItem.fromJson(Map<String, dynamic> json) =
      _$ChronicPackageItemImpl.fromJson;

  @override
  ChronicPackageItemType get type;
  @override
  String get title;
  @override
  String? get details;

  /// Create a copy of ChronicPackageItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChronicPackageItemImplCopyWith<_$ChronicPackageItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
