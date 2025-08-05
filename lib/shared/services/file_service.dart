import 'dart:convert';

import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/shared/models/app_banner/app_banner.dart';
import 'package:qris_health/shared/utils/wrappers/wrapper.dart';

import '../models/file_upload_model/file_upload_model.dart';

class FileService {
  static Future<void> uploadPharmacyPrescriptionUrls(
      {required FileUploadModel fileUploadModel}) async {
    final url =
        '${AppConstants.baseUrl}/file/upload-pharmacy-prescription-urls';
    await Wrapper.post(url, json.encode(fileUploadModel.toJson()));
  }

  static Future<void> uploadPrescriptionUrls(
      {required FileUploadModel fileUploadModel}) async {
    final url = '${AppConstants.baseUrl}/file/upload-prescription-urls';
    await Wrapper.post(url, json.encode(fileUploadModel.toJson()));
  }

  static Future<List<AppBanner>> getAllAppBanners() async {
    final url = '${AppConstants.baseUrl}/file/app-banner';
    final response = await Wrapper.get(url);

    return (json.decode(response)['body'] as List)
        .map((element) => AppBanner.fromJson(element))
        .toList();
  }
}
