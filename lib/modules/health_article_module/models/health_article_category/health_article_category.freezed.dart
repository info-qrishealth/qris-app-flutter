// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_article_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HealthArticleCategory _$HealthArticleCategoryFromJson(
    Map<String, dynamic> json) {
  return _HealthArticleCategory.fromJson(json);
}

/// @nodoc
mixin _$HealthArticleCategory {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'dis_order')
  String get disOrder => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'meta_title')
  String get metaTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'meta_key')
  String get metaKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'meta_desc')
  String get metaDesc => throw _privateConstructorUsedError;
  String get canonical => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get pic => throw _privateConstructorUsedError;
  @JsonKey(name: 'alt_tag')
  String get altTag => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon')
  String? get icon => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon_bg')
  String? get iconBg => throw _privateConstructorUsedError;

  /// Serializes this HealthArticleCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HealthArticleCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthArticleCategoryCopyWith<HealthArticleCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthArticleCategoryCopyWith<$Res> {
  factory $HealthArticleCategoryCopyWith(HealthArticleCategory value,
          $Res Function(HealthArticleCategory) then) =
      _$HealthArticleCategoryCopyWithImpl<$Res, HealthArticleCategory>;
  @useResult
  $Res call(
      {int id,
      String title,
      @JsonKey(name: 'dis_order') String disOrder,
      String status,
      @JsonKey(name: 'meta_title') String metaTitle,
      @JsonKey(name: 'meta_key') String metaKey,
      @JsonKey(name: 'meta_desc') String metaDesc,
      String canonical,
      String slug,
      String pic,
      @JsonKey(name: 'alt_tag') String altTag,
      @JsonKey(name: 'icon') String? icon,
      @JsonKey(name: 'icon_bg') String? iconBg});
}

/// @nodoc
class _$HealthArticleCategoryCopyWithImpl<$Res,
        $Val extends HealthArticleCategory>
    implements $HealthArticleCategoryCopyWith<$Res> {
  _$HealthArticleCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HealthArticleCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? disOrder = null,
    Object? status = null,
    Object? metaTitle = null,
    Object? metaKey = null,
    Object? metaDesc = null,
    Object? canonical = null,
    Object? slug = null,
    Object? pic = null,
    Object? altTag = null,
    Object? icon = freezed,
    Object? iconBg = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      disOrder: null == disOrder
          ? _value.disOrder
          : disOrder // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      metaTitle: null == metaTitle
          ? _value.metaTitle
          : metaTitle // ignore: cast_nullable_to_non_nullable
              as String,
      metaKey: null == metaKey
          ? _value.metaKey
          : metaKey // ignore: cast_nullable_to_non_nullable
              as String,
      metaDesc: null == metaDesc
          ? _value.metaDesc
          : metaDesc // ignore: cast_nullable_to_non_nullable
              as String,
      canonical: null == canonical
          ? _value.canonical
          : canonical // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      pic: null == pic
          ? _value.pic
          : pic // ignore: cast_nullable_to_non_nullable
              as String,
      altTag: null == altTag
          ? _value.altTag
          : altTag // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      iconBg: freezed == iconBg
          ? _value.iconBg
          : iconBg // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HealthArticleCategoryImplCopyWith<$Res>
    implements $HealthArticleCategoryCopyWith<$Res> {
  factory _$$HealthArticleCategoryImplCopyWith(
          _$HealthArticleCategoryImpl value,
          $Res Function(_$HealthArticleCategoryImpl) then) =
      __$$HealthArticleCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      @JsonKey(name: 'dis_order') String disOrder,
      String status,
      @JsonKey(name: 'meta_title') String metaTitle,
      @JsonKey(name: 'meta_key') String metaKey,
      @JsonKey(name: 'meta_desc') String metaDesc,
      String canonical,
      String slug,
      String pic,
      @JsonKey(name: 'alt_tag') String altTag,
      @JsonKey(name: 'icon') String? icon,
      @JsonKey(name: 'icon_bg') String? iconBg});
}

/// @nodoc
class __$$HealthArticleCategoryImplCopyWithImpl<$Res>
    extends _$HealthArticleCategoryCopyWithImpl<$Res,
        _$HealthArticleCategoryImpl>
    implements _$$HealthArticleCategoryImplCopyWith<$Res> {
  __$$HealthArticleCategoryImplCopyWithImpl(_$HealthArticleCategoryImpl _value,
      $Res Function(_$HealthArticleCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of HealthArticleCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? disOrder = null,
    Object? status = null,
    Object? metaTitle = null,
    Object? metaKey = null,
    Object? metaDesc = null,
    Object? canonical = null,
    Object? slug = null,
    Object? pic = null,
    Object? altTag = null,
    Object? icon = freezed,
    Object? iconBg = freezed,
  }) {
    return _then(_$HealthArticleCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      disOrder: null == disOrder
          ? _value.disOrder
          : disOrder // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      metaTitle: null == metaTitle
          ? _value.metaTitle
          : metaTitle // ignore: cast_nullable_to_non_nullable
              as String,
      metaKey: null == metaKey
          ? _value.metaKey
          : metaKey // ignore: cast_nullable_to_non_nullable
              as String,
      metaDesc: null == metaDesc
          ? _value.metaDesc
          : metaDesc // ignore: cast_nullable_to_non_nullable
              as String,
      canonical: null == canonical
          ? _value.canonical
          : canonical // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      pic: null == pic
          ? _value.pic
          : pic // ignore: cast_nullable_to_non_nullable
              as String,
      altTag: null == altTag
          ? _value.altTag
          : altTag // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      iconBg: freezed == iconBg
          ? _value.iconBg
          : iconBg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthArticleCategoryImpl implements _HealthArticleCategory {
  const _$HealthArticleCategoryImpl(
      {required this.id,
      required this.title,
      @JsonKey(name: 'dis_order') required this.disOrder,
      required this.status,
      @JsonKey(name: 'meta_title') required this.metaTitle,
      @JsonKey(name: 'meta_key') required this.metaKey,
      @JsonKey(name: 'meta_desc') required this.metaDesc,
      required this.canonical,
      required this.slug,
      required this.pic,
      @JsonKey(name: 'alt_tag') required this.altTag,
      @JsonKey(name: 'icon') this.icon,
      @JsonKey(name: 'icon_bg') this.iconBg});

  factory _$HealthArticleCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthArticleCategoryImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  @JsonKey(name: 'dis_order')
  final String disOrder;
  @override
  final String status;
  @override
  @JsonKey(name: 'meta_title')
  final String metaTitle;
  @override
  @JsonKey(name: 'meta_key')
  final String metaKey;
  @override
  @JsonKey(name: 'meta_desc')
  final String metaDesc;
  @override
  final String canonical;
  @override
  final String slug;
  @override
  final String pic;
  @override
  @JsonKey(name: 'alt_tag')
  final String altTag;
  @override
  @JsonKey(name: 'icon')
  final String? icon;
  @override
  @JsonKey(name: 'icon_bg')
  final String? iconBg;

  @override
  String toString() {
    return 'HealthArticleCategory(id: $id, title: $title, disOrder: $disOrder, status: $status, metaTitle: $metaTitle, metaKey: $metaKey, metaDesc: $metaDesc, canonical: $canonical, slug: $slug, pic: $pic, altTag: $altTag, icon: $icon, iconBg: $iconBg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthArticleCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.disOrder, disOrder) ||
                other.disOrder == disOrder) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.metaTitle, metaTitle) ||
                other.metaTitle == metaTitle) &&
            (identical(other.metaKey, metaKey) || other.metaKey == metaKey) &&
            (identical(other.metaDesc, metaDesc) ||
                other.metaDesc == metaDesc) &&
            (identical(other.canonical, canonical) ||
                other.canonical == canonical) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.pic, pic) || other.pic == pic) &&
            (identical(other.altTag, altTag) || other.altTag == altTag) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.iconBg, iconBg) || other.iconBg == iconBg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, disOrder, status,
      metaTitle, metaKey, metaDesc, canonical, slug, pic, altTag, icon, iconBg);

  /// Create a copy of HealthArticleCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthArticleCategoryImplCopyWith<_$HealthArticleCategoryImpl>
      get copyWith => __$$HealthArticleCategoryImplCopyWithImpl<
          _$HealthArticleCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthArticleCategoryImplToJson(
      this,
    );
  }
}

abstract class _HealthArticleCategory implements HealthArticleCategory {
  const factory _HealthArticleCategory(
          {required final int id,
          required final String title,
          @JsonKey(name: 'dis_order') required final String disOrder,
          required final String status,
          @JsonKey(name: 'meta_title') required final String metaTitle,
          @JsonKey(name: 'meta_key') required final String metaKey,
          @JsonKey(name: 'meta_desc') required final String metaDesc,
          required final String canonical,
          required final String slug,
          required final String pic,
          @JsonKey(name: 'alt_tag') required final String altTag,
          @JsonKey(name: 'icon') final String? icon,
          @JsonKey(name: 'icon_bg') final String? iconBg}) =
      _$HealthArticleCategoryImpl;

  factory _HealthArticleCategory.fromJson(Map<String, dynamic> json) =
      _$HealthArticleCategoryImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(name: 'dis_order')
  String get disOrder;
  @override
  String get status;
  @override
  @JsonKey(name: 'meta_title')
  String get metaTitle;
  @override
  @JsonKey(name: 'meta_key')
  String get metaKey;
  @override
  @JsonKey(name: 'meta_desc')
  String get metaDesc;
  @override
  String get canonical;
  @override
  String get slug;
  @override
  String get pic;
  @override
  @JsonKey(name: 'alt_tag')
  String get altTag;
  @override
  @JsonKey(name: 'icon')
  String? get icon;
  @override
  @JsonKey(name: 'icon_bg')
  String? get iconBg;

  /// Create a copy of HealthArticleCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthArticleCategoryImplCopyWith<_$HealthArticleCategoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
