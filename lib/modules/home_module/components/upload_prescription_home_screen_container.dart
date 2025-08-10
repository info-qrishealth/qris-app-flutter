import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';

import '../../../generated/assets.dart';
import '../../../shared/models/file_upload_model/file_upload_model.dart';
import '../../../shared/services/file_service.dart';
import '../../../shared/utils/file_util.dart';
import '../../../styles/app_colors.dart';
import '../../users_module/cubits/user_cubit.dart';

class UploadPrescriptionHomeScreenContainer extends StatefulWidget {
  const UploadPrescriptionHomeScreenContainer({super.key});

  @override
  State<UploadPrescriptionHomeScreenContainer> createState() =>
      _UploadPrescriptionHomeScreenContainerState();
}

class _UploadPrescriptionHomeScreenContainerState
    extends State<UploadPrescriptionHomeScreenContainer> {
  bool _uploading = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(12)),
        child: Row(children: [
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(
                  'Not sure what to book?',
                  style: textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                Text('Upload a prescription for tests and scans!',
                    style: textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightSubTextColor))
              ])),
          SizedBox(
              height: 30,
              child: ElevatedButton(
                  onPressed: _uploading ? null : _pickAndUploadFiles,
                  child: _uploading
                      ? SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(
                              strokeWidth: 2, color: Colors.white))
                      : Row(children: [
                          Text('Upload',
                              style: textTheme.bodySmall!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white)),
                          SizedBox(width: 4),
                          SvgPicture.asset(Assets.iconsUploadIcon)
                        ])))
        ]));
  }

  Future<void> _pickAndUploadFiles() async {
    final List<File> filesToUpload = [];

    final pickedFiles = await ImagePicker().pickMultiImage();

    if (pickedFiles.isNotEmpty) {
      for (var pickedFile in pickedFiles) {
        final file = File(pickedFile.path);
        filesToUpload.add(file);
      }
    }

    if (filesToUpload.isNotEmpty) {
      try {
        setState(() {
          _uploading = true;
        });

        final fileUrls = await FileUtil.uploadFiles(
            context: context, files: filesToUpload, ref: 'prescriptions');

        await FileService.uploadPrescriptionUrls(
            fileUploadModel: FileUploadModel(
                userId: BlocProvider.of<UserCubit>(context).state.user.id!,
                urls: fileUrls));

        AppConstants.showSnackbar(
            text: 'Prescriptions uploaded successfully',
            type: SnackbarType.success);
      } catch (e) {
        AppConstants.showSnackbar(text: e.toString(), type: SnackbarType.error);
      } finally {
        setState(() {
          _uploading = false;
        });
      }
    }
  }
}
