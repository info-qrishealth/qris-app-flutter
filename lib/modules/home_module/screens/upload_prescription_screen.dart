import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';
import 'package:qris_health/generated/assets.dart';
import 'package:qris_health/modules/home_module/components/prescription_upload_success_dialog.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/styles/app_colors.dart';

class UploadPrescriptionScreen extends StatefulWidget {
  const UploadPrescriptionScreen({super.key});

  @override
  State<UploadPrescriptionScreen> createState() =>
      _UploadPrescriptionScreenState();
}

class _UploadPrescriptionScreenState extends State<UploadPrescriptionScreen> {
  final List<File> _files = [];

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Scaffold(
        bottomNavigationBar: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.scaffoldPadding, vertical: 16),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue),
                    onPressed: _files.isEmpty
                        ? null
                        : () async {
                            await showDialog(
                                context: context,
                                builder: (context) =>
                                    PrescriptionUploadSuccessDialog());
                            Navigator.of(context).pop();
                          },
                    child: Text('Submit prescription')))),
        appBar: CommonAppBar(title: 'Upload prescription'),
        body: SafeArea(
            child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.scaffoldPadding, vertical: 16),
                children: [
              Text(
                  'Let our medical team guide you better. Upload a valid prescription and we’ll give you a call.',
                  style: textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.w400)),
              SizedBox(height: 24),
              Image.asset(Assets.illustrationsUploadPrescriptionIllustration,
                  height: 170),
              SizedBox(height: 24),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Note:',
                    style: textTheme.labelSmall!.copyWith(
                        color: AppColors.lightSubTextColor,
                        fontWeight: FontWeight.w700)),
                TextSpan(
                    text:
                        ' Ensure the entire prescription is visible and clear',
                    style: textTheme.labelSmall!.copyWith(
                        color: AppColors.lightSubTextColor,
                        fontWeight: FontWeight.w400)),
              ])),
              SizedBox(height: 4),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Max size:',
                    style: textTheme.labelSmall!.copyWith(
                        color: AppColors.lightSubTextColor,
                        fontWeight: FontWeight.w700)),
                TextSpan(
                    text: ' 5MB | Formats: JPG, PNG, PDF',
                    style: textTheme.labelSmall!.copyWith(
                        color: AppColors.lightSubTextColor,
                        fontWeight: FontWeight.w400))
              ])),
              SizedBox(height: 20),
              IntrinsicHeight(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                    Expanded(
                        child: _buildContainer(
                            assetPath: Assets.iconsCameraIcon,
                            title: 'Take photo',
                            onTap: () async {
                              try {
                                final image = await ImagePicker()
                                    .pickImage(source: ImageSource.camera);

                                if (image != null) {
                                  final file = File(image.path);
                                  _files.add(file);
                                  setState(() {});
                                }
                              } catch (e) {
                                AppConstants.showSnackbar(
                                    text: e.toString(),
                                    type: SnackbarType.error);
                              }
                            })),
                    SizedBox(width: 10),
                    Expanded(
                        child: _buildContainer(
                            assetPath: Assets.iconsUploadIcon,
                            title: 'Upload from gallery',
                            onTap: () async {
                              try {
                                final pickedFiles = await FilePicker.platform
                                    .pickFiles(
                                        type: FileType.custom,
                                        allowMultiple: true,
                                        allowedExtensions: [
                                      'csv',
                                      'jpg',
                                      'jpeg',
                                      'pdf',
                                      'png'
                                    ]);

                                if (pickedFiles?.xFiles != null &&
                                    pickedFiles!.xFiles.isNotEmpty) {
                                  for (var pickedFile in pickedFiles.xFiles) {
                                    final file = File(pickedFile.path);
                                    _files.add(file);
                                  }

                                  setState(() {});
                                }
                              } catch (e) {
                                AppConstants.showSnackbar(
                                    text: e.toString(),
                                    type: SnackbarType.error);
                              }
                            })),
                  ])),
              SizedBox(height: 12),
              ...List.generate(_files.length, (index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: _buildFileListTile(file: _files[index]));
              }),
            ])));
  }

  Widget _buildContainer(
      {required String assetPath,
      required String title,
      required Function() onTap}) {
    return InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: DottedBorder(
            dashPattern: const [5, 5],
            color: AppColors.borderColor,
            radius: Radius.circular(14),
            borderType: BorderType.RRect,
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  SvgPicture.asset(assetPath,
                      color: Colors.black, height: 24, width: 24),
                  SizedBox(height: 4),
                  Text(title,
                      style: Get.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightSubTextColor))
                ]))));
  }

  Widget _buildFileListTile({required File file}) {
    final textTheme = Get.textTheme;
    final fileName = file.path.split('/').last.replaceAll('image_picker_', '');

    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      SvgPicture.asset(Assets.extensionIconsImageExtensionIcon),
      SizedBox(width: 8),
      Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(children: [
          Flexible(
              child: Text(fileName,
                  style: textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.w400),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1)),
          SizedBox(width: 8),
          FutureBuilder<double>(
              future: _getFileSizeInMb(file: file),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final size = snapshot.data!;
                  return Text('${size.toStringAsFixed(2)} MB',
                      style: textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.45)));
                }
                return SizedBox.shrink();
              })
        ]),
        FutureBuilder<double>(
            future: _getFileSizeInMb(file: file),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data! > 5) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 2),
                      Text('Maximum file size limit exceeded.',
                          style: textTheme.labelSmall!.copyWith(
                              color: AppColors.red,
                              fontWeight: FontWeight.w400))
                    ]);
              }
              return SizedBox.shrink();
            }),
      ])),
      Padding(
          padding:
              const EdgeInsets.all(4.0).copyWith(right: 0, top: 0, left: 8),
          child: InkWell(
              onTap: () {
                _files.removeWhere((element) => element.path == file.path);
                setState(() {});
              },
              child: SvgPicture.asset(Assets.iconsDeleteIcon)))
    ]);
  }

  Future<double> _getFileSizeInMb({required File file}) async {
    final bytes = await file.length();
    final sizeInMB = bytes / (1024 * 1024);
    return sizeInMB;
  }
}
