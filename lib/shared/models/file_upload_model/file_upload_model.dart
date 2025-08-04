import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_upload_model.freezed.dart';
part 'file_upload_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class FileUploadModel with _$FileUploadModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FileUploadModel({
    required int userId,
    @Default([]) List<FileUrl> urls,
  }) = _FileUploadModel;

  factory FileUploadModel.fromJson(Map<String, dynamic> json) =>
      _$FileUploadModelFromJson(json);
}

@freezed
class FileUrl with _$FileUrl {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FileUrl({
    required String fileName,
    required String fileUrl,
  }) = _FileUrl;

  factory FileUrl.fromJson(Map<String, dynamic> json) =>
      _$FileUrlFromJson(json);
}
