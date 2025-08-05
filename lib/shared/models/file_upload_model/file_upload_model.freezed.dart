// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_upload_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FileUploadModel _$FileUploadModelFromJson(Map<String, dynamic> json) {
  return _FileUploadModel.fromJson(json);
}

/// @nodoc
mixin _$FileUploadModel {
  int get userId => throw _privateConstructorUsedError;
  List<FileUrl> get urls => throw _privateConstructorUsedError;

  /// Serializes this FileUploadModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FileUploadModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FileUploadModelCopyWith<FileUploadModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileUploadModelCopyWith<$Res> {
  factory $FileUploadModelCopyWith(
          FileUploadModel value, $Res Function(FileUploadModel) then) =
      _$FileUploadModelCopyWithImpl<$Res, FileUploadModel>;
  @useResult
  $Res call({int userId, List<FileUrl> urls});
}

/// @nodoc
class _$FileUploadModelCopyWithImpl<$Res, $Val extends FileUploadModel>
    implements $FileUploadModelCopyWith<$Res> {
  _$FileUploadModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FileUploadModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? urls = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      urls: null == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<FileUrl>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FileUploadModelImplCopyWith<$Res>
    implements $FileUploadModelCopyWith<$Res> {
  factory _$$FileUploadModelImplCopyWith(_$FileUploadModelImpl value,
          $Res Function(_$FileUploadModelImpl) then) =
      __$$FileUploadModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int userId, List<FileUrl> urls});
}

/// @nodoc
class __$$FileUploadModelImplCopyWithImpl<$Res>
    extends _$FileUploadModelCopyWithImpl<$Res, _$FileUploadModelImpl>
    implements _$$FileUploadModelImplCopyWith<$Res> {
  __$$FileUploadModelImplCopyWithImpl(
      _$FileUploadModelImpl _value, $Res Function(_$FileUploadModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FileUploadModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? urls = null,
  }) {
    return _then(_$FileUploadModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      urls: null == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<FileUrl>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$FileUploadModelImpl implements _FileUploadModel {
  const _$FileUploadModelImpl({required this.userId, this.urls = const []});

  factory _$FileUploadModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FileUploadModelImplFromJson(json);

  @override
  final int userId;
  @override
  @JsonKey()
  final List<FileUrl> urls;

  @override
  String toString() {
    return 'FileUploadModel(userId: $userId, urls: $urls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileUploadModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other.urls, urls));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, userId, const DeepCollectionEquality().hash(urls));

  /// Create a copy of FileUploadModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FileUploadModelImplCopyWith<_$FileUploadModelImpl> get copyWith =>
      __$$FileUploadModelImplCopyWithImpl<_$FileUploadModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FileUploadModelImplToJson(
      this,
    );
  }
}

abstract class _FileUploadModel implements FileUploadModel {
  const factory _FileUploadModel(
      {required final int userId,
      final List<FileUrl> urls}) = _$FileUploadModelImpl;

  factory _FileUploadModel.fromJson(Map<String, dynamic> json) =
      _$FileUploadModelImpl.fromJson;

  @override
  int get userId;
  @override
  List<FileUrl> get urls;

  /// Create a copy of FileUploadModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FileUploadModelImplCopyWith<_$FileUploadModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FileUrl _$FileUrlFromJson(Map<String, dynamic> json) {
  return _FileUrl.fromJson(json);
}

/// @nodoc
mixin _$FileUrl {
  String get fileName => throw _privateConstructorUsedError;
  String get fileUrl => throw _privateConstructorUsedError;

  /// Serializes this FileUrl to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FileUrl
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FileUrlCopyWith<FileUrl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileUrlCopyWith<$Res> {
  factory $FileUrlCopyWith(FileUrl value, $Res Function(FileUrl) then) =
      _$FileUrlCopyWithImpl<$Res, FileUrl>;
  @useResult
  $Res call({String fileName, String fileUrl});
}

/// @nodoc
class _$FileUrlCopyWithImpl<$Res, $Val extends FileUrl>
    implements $FileUrlCopyWith<$Res> {
  _$FileUrlCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FileUrl
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? fileUrl = null,
  }) {
    return _then(_value.copyWith(
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FileUrlImplCopyWith<$Res> implements $FileUrlCopyWith<$Res> {
  factory _$$FileUrlImplCopyWith(
          _$FileUrlImpl value, $Res Function(_$FileUrlImpl) then) =
      __$$FileUrlImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fileName, String fileUrl});
}

/// @nodoc
class __$$FileUrlImplCopyWithImpl<$Res>
    extends _$FileUrlCopyWithImpl<$Res, _$FileUrlImpl>
    implements _$$FileUrlImplCopyWith<$Res> {
  __$$FileUrlImplCopyWithImpl(
      _$FileUrlImpl _value, $Res Function(_$FileUrlImpl) _then)
      : super(_value, _then);

  /// Create a copy of FileUrl
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? fileUrl = null,
  }) {
    return _then(_$FileUrlImpl(
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$FileUrlImpl implements _FileUrl {
  const _$FileUrlImpl({required this.fileName, required this.fileUrl});

  factory _$FileUrlImpl.fromJson(Map<String, dynamic> json) =>
      _$$FileUrlImplFromJson(json);

  @override
  final String fileName;
  @override
  final String fileUrl;

  @override
  String toString() {
    return 'FileUrl(fileName: $fileName, fileUrl: $fileUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileUrlImpl &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fileName, fileUrl);

  /// Create a copy of FileUrl
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FileUrlImplCopyWith<_$FileUrlImpl> get copyWith =>
      __$$FileUrlImplCopyWithImpl<_$FileUrlImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FileUrlImplToJson(
      this,
    );
  }
}

abstract class _FileUrl implements FileUrl {
  const factory _FileUrl(
      {required final String fileName,
      required final String fileUrl}) = _$FileUrlImpl;

  factory _FileUrl.fromJson(Map<String, dynamic> json) = _$FileUrlImpl.fromJson;

  @override
  String get fileName;
  @override
  String get fileUrl;

  /// Create a copy of FileUrl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FileUrlImplCopyWith<_$FileUrlImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
