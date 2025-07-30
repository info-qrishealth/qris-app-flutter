import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/generated/assets.dart';
import 'package:qris_health/modules/home_module/components/prescription_upload_success_dialog.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/styles/app_colors.dart';

class UploadPrescriptionScreen extends StatelessWidget {
  const UploadPrescriptionScreen({super.key});

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
                    onPressed: () async {
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
                            title: 'Take photo')),
                    SizedBox(width: 10),
                    Expanded(
                        child: _buildContainer(
                            assetPath: Assets.iconsUploadIcon,
                            title: 'Upload from gallery')),
                  ])),
              SizedBox(height: 12),
              ...List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: _buildFileListTile(),
                );
              }),
            ])));
  }

  Widget _buildContainer({required String assetPath, required String title}) {
    return DottedBorder(
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
            ])));
  }

  Widget _buildFileListTile() {
    final textTheme = Get.textTheme;

    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SvgPicture.asset(Assets.extensionIconsImageExtensionIcon),
      SizedBox(width: 8),
      Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(children: [
          Flexible(
              child: Text('raj sharma.pdf',
                  style: textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.w400))),
          SizedBox(width: 6),
          Text('4.8MB',
              style: textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.45))),
        ]),
        SizedBox(height: 2),
        Text('Maximum file size limit exceeded.',
            style: textTheme.labelSmall!
                .copyWith(color: AppColors.red, fontWeight: FontWeight.w400)),
      ])),
      Padding(
          padding: const EdgeInsets.all(4.0).copyWith(right: 0),
          child: InkWell(
              onTap: () {}, child: SvgPicture.asset(Assets.iconsDeleteIcon))),
    ]);
  }
}
