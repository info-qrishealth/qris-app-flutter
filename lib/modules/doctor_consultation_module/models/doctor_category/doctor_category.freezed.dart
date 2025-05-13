// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DoctorCategory _$DoctorCategoryFromJson(Map<String, dynamic> json) {
  return _DoctorCategory.fromJson(json);
}

/// @nodoc
mixin _$DoctorCategory {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'h1')
  String? get h1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'slug')
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'pic')
  String? get pic => throw _privateConstructorUsedError;
  @JsonKey(name: 'meta_title')
  String? get metaTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'meta_key')
  String? get metaKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'meta_desc')
  String? get metaDesc => throw _privateConstructorUsedError;
  @JsonKey(name: 'published_on')
  DateTime? get publishedOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'dis_order')
  int? get disOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon')
  String? get icon => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon_bg')
  String? get iconBg => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;

  /// Serializes this DoctorCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoctorCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorCategoryCopyWith<DoctorCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorCategoryCopyWith<$Res> {
  factory $DoctorCategoryCopyWith(
          DoctorCategory value, $Res Function(DoctorCategory) then) =
      _$DoctorCategoryCopyWithImpl<$Res, DoctorCategory>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'h1') String? h1,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'pic') String? pic,
      @JsonKey(name: 'meta_title') String? metaTitle,
      @JsonKey(name: 'meta_key') String? metaKey,
      @JsonKey(name: 'meta_desc') String? metaDesc,
      @JsonKey(name: 'published_on') DateTime? publishedOn,
      @JsonKey(name: 'dis_order') int? disOrder,
      @JsonKey(name: 'icon') String? icon,
      @JsonKey(name: 'icon_bg') String? iconBg,
      @JsonKey(name: 'status') String? status});
}

/// @nodoc
class _$DoctorCategoryCopyWithImpl<$Res, $Val extends DoctorCategory>
    implements $DoctorCategoryCopyWith<$Res> {
  _$DoctorCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? h1 = freezed,
    Object? slug = freezed,
    Object? description = freezed,
    Object? pic = freezed,
    Object? metaTitle = freezed,
    Object? metaKey = freezed,
    Object? metaDesc = freezed,
    Object? publishedOn = freezed,
    Object? disOrder = freezed,
    Object? icon = freezed,
    Object? iconBg = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      h1: freezed == h1
          ? _value.h1
          : h1 // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      pic: freezed == pic
          ? _value.pic
          : pic // ignore: cast_nullable_to_non_nullable
              as String?,
      metaTitle: freezed == metaTitle
          ? _value.metaTitle
          : metaTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      metaKey: freezed == metaKey
          ? _value.metaKey
          : metaKey // ignore: cast_nullable_to_non_nullable
              as String?,
      metaDesc: freezed == metaDesc
          ? _value.metaDesc
          : metaDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedOn: freezed == publishedOn
          ? _value.publishedOn
          : publishedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      disOrder: freezed == disOrder
          ? _value.disOrder
          : disOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      iconBg: freezed == iconBg
          ? _value.iconBg
          : iconBg // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DoctorCategoryImplCopyWith<$Res>
    implements $DoctorCategoryCopyWith<$Res> {
  factory _$$DoctorCategoryImplCopyWith(_$DoctorCategoryImpl value,
          $Res Function(_$DoctorCategoryImpl) then) =
      __$$DoctorCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'h1') String? h1,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'pic') String? pic,
      @JsonKey(name: 'meta_title') String? metaTitle,
      @JsonKey(name: 'meta_key') String? metaKey,
      @JsonKey(name: 'meta_desc') String? metaDesc,
      @JsonKey(name: 'published_on') DateTime? publishedOn,
      @JsonKey(name: 'dis_order') int? disOrder,
      @JsonKey(name: 'icon') String? icon,
      @JsonKey(name: 'icon_bg') String? iconBg,
      @JsonKey(name: 'status') String? status});
}

/// @nodoc
class __$$DoctorCategoryImplCopyWithImpl<$Res>
    extends _$DoctorCategoryCopyWithImpl<$Res, _$DoctorCategoryImpl>
    implements _$$DoctorCategoryImplCopyWith<$Res> {
  __$$DoctorCategoryImplCopyWithImpl(
      _$DoctorCategoryImpl _value, $Res Function(_$DoctorCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of DoctorCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? h1 = freezed,
    Object? slug = freezed,
    Object? description = freezed,
    Object? pic = freezed,
    Object? metaTitle = freezed,
    Object? metaKey = freezed,
    Object? metaDesc = freezed,
    Object? publishedOn = freezed,
    Object? disOrder = freezed,
    Object? icon = freezed,
    Object? iconBg = freezed,
    Object? status = freezed,
  }) {
    return _then(_$DoctorCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      h1: freezed == h1
          ? _value.h1
          : h1 // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      pic: freezed == pic
          ? _value.pic
          : pic // ignore: cast_nullable_to_non_nullable
              as String?,
      metaTitle: freezed == metaTitle
          ? _value.metaTitle
          : metaTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      metaKey: freezed == metaKey
          ? _value.metaKey
          : metaKey // ignore: cast_nullable_to_non_nullable
              as String?,
      metaDesc: freezed == metaDesc
          ? _value.metaDesc
          : metaDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedOn: freezed == publishedOn
          ? _value.publishedOn
          : publishedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      disOrder: freezed == disOrder
          ? _value.disOrder
          : disOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      iconBg: freezed == iconBg
          ? _value.iconBg
          : iconBg // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorCategoryImpl implements _DoctorCategory {
  const _$DoctorCategoryImpl(
      {required this.id,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'h1') this.h1,
      @JsonKey(name: 'slug') this.slug,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'pic') this.pic,
      @JsonKey(name: 'meta_title') this.metaTitle,
      @JsonKey(name: 'meta_key') this.metaKey,
      @JsonKey(name: 'meta_desc') this.metaDesc,
      @JsonKey(name: 'published_on') this.publishedOn,
      @JsonKey(name: 'dis_order') this.disOrder,
      @JsonKey(name: 'icon') this.icon,
      @JsonKey(name: 'icon_bg') this.iconBg,
      @JsonKey(name: 'status') this.status});

  factory _$DoctorCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorCategoryImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'h1')
  final String? h1;
  @override
  @JsonKey(name: 'slug')
  final String? slug;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'pic')
  final String? pic;
  @override
  @JsonKey(name: 'meta_title')
  final String? metaTitle;
  @override
  @JsonKey(name: 'meta_key')
  final String? metaKey;
  @override
  @JsonKey(name: 'meta_desc')
  final String? metaDesc;
  @override
  @JsonKey(name: 'published_on')
  final DateTime? publishedOn;
  @override
  @JsonKey(name: 'dis_order')
  final int? disOrder;
  @override
  @JsonKey(name: 'icon')
  final String? icon;
  @override
  @JsonKey(name: 'icon_bg')
  final String? iconBg;
  @override
  @JsonKey(name: 'status')
  final String? status;

  @override
  String toString() {
    return 'DoctorCategory(id: $id, title: $title, h1: $h1, slug: $slug, description: $description, pic: $pic, metaTitle: $metaTitle, metaKey: $metaKey, metaDesc: $metaDesc, publishedOn: $publishedOn, disOrder: $disOrder, icon: $icon, iconBg: $iconBg, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.h1, h1) || other.h1 == h1) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.pic, pic) || other.pic == pic) &&
            (identical(other.metaTitle, metaTitle) ||
                other.metaTitle == metaTitle) &&
            (identical(other.metaKey, metaKey) || other.metaKey == metaKey) &&
            (identical(other.metaDesc, metaDesc) ||
                other.metaDesc == metaDesc) &&
            (identical(other.publishedOn, publishedOn) ||
                other.publishedOn == publishedOn) &&
            (identical(other.disOrder, disOrder) ||
                other.disOrder == disOrder) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.iconBg, iconBg) || other.iconBg == iconBg) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      h1,
      slug,
      description,
      pic,
      metaTitle,
      metaKey,
      metaDesc,
      publishedOn,
      disOrder,
      icon,
      iconBg,
      status);

  /// Create a copy of DoctorCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorCategoryImplCopyWith<_$DoctorCategoryImpl> get copyWith =>
      __$$DoctorCategoryImplCopyWithImpl<_$DoctorCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorCategoryImplToJson(
      this,
    );
  }
}

abstract class _DoctorCategory implements DoctorCategory {
  const factory _DoctorCategory(
      {required final int id,
      @JsonKey(name: 'title') final String? title,
      @JsonKey(name: 'h1') final String? h1,
      @JsonKey(name: 'slug') final String? slug,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'pic') final String? pic,
      @JsonKey(name: 'meta_title') final String? metaTitle,
      @JsonKey(name: 'meta_key') final String? metaKey,
      @JsonKey(name: 'meta_desc') final String? metaDesc,
      @JsonKey(name: 'published_on') final DateTime? publishedOn,
      @JsonKey(name: 'dis_order') final int? disOrder,
      @JsonKey(name: 'icon') final String? icon,
      @JsonKey(name: 'icon_bg') final String? iconBg,
      @JsonKey(name: 'status') final String? status}) = _$DoctorCategoryImpl;

  factory _DoctorCategory.fromJson(Map<String, dynamic> json) =
      _$DoctorCategoryImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'h1')
  String? get h1;
  @override
  @JsonKey(name: 'slug')
  String? get slug;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'pic')
  String? get pic;
  @override
  @JsonKey(name: 'meta_title')
  String? get metaTitle;
  @override
  @JsonKey(name: 'meta_key')
  String? get metaKey;
  @override
  @JsonKey(name: 'meta_desc')
  String? get metaDesc;
  @override
  @JsonKey(name: 'published_on')
  DateTime? get publishedOn;
  @override
  @JsonKey(name: 'dis_order')
  int? get disOrder;
  @override
  @JsonKey(name: 'icon')
  String? get icon;
  @override
  @JsonKey(name: 'icon_bg')
  String? get iconBg;
  @override
  @JsonKey(name: 'status')
  String? get status;

  /// Create a copy of DoctorCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorCategoryImplCopyWith<_$DoctorCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
