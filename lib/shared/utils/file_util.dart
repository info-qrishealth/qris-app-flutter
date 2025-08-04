import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qris_health/shared/models/file_upload_model/file_upload_model.dart';

import '../../modules/users_module/cubits/user_cubit.dart';

class FileUtil {
  static Future<List<FileUrl>> uploadFiles(
      {required BuildContext context,
      required List<File> files,
      required String ref}) async {
    final List<FileUrl> fileUrls = [];
    final user = BlocProvider.of<UserCubit>(context).state.user;

    for (var file in files) {
      final fileName = getFileName(file: file);

      final task = await FirebaseStorage.instance
          .ref(ref)
          .child(user.phone ?? user.userId)
          .child(fileName)
          .putFile(file);

      final url = await task.ref.getDownloadURL();
      fileUrls.add(FileUrl(fileName: fileName, fileUrl: url));
    }

    return fileUrls;
  }

  static Future<double> getFileSizeInMb({required File file}) async {
    final bytes = await file.length();
    final sizeInMB = bytes / (1024 * 1024);
    return sizeInMB;
  }

  static String getFileName({required File file}) {
    return file.path.split('/').last.replaceAll('image_picker_', '');
  }
}
