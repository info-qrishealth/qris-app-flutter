// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_upload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FileUploadModelImpl _$$FileUploadModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FileUploadModelImpl(
      userId: (json['user_id'] as num).toInt(),
      urls: (json['urls'] as List<dynamic>?)
              ?.map((e) => FileUrl.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$FileUploadModelImplToJson(
        _$FileUploadModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'urls': instance.urls,
    };

_$FileUrlImpl _$$FileUrlImplFromJson(Map<String, dynamic> json) =>
    _$FileUrlImpl(
      fileName: json['file_name'] as String,
      fileUrl: json['file_url'] as String,
    );

Map<String, dynamic> _$$FileUrlImplToJson(_$FileUrlImpl instance) =>
    <String, dynamic>{
      'file_name': instance.fileName,
      'file_url': instance.fileUrl,
    };
