import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/app_constants.dart';
import '../../constants/enums/snackbar_type.dart';
import '../../styles/app_colors.dart';

class NewUpdateDialog extends StatelessWidget {
  final bool showNoButton;
  const NewUpdateDialog({super.key, this.showNoButton = true});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('New Update Available',
                      style: textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryPink)),
                  const SizedBox(height: 12),
                  Text(
                      'Please tap on update to visit appstore and update the app for new and better experience.',
                      style: textTheme.bodyLarge?.copyWith(
                          height: 1.2,
                          color: AppColors.lightGrey,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 45,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (showNoButton)
                            OutlinedButton(
                                child: const Text('Later'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                }),
                          const SizedBox(width: 12),
                          ElevatedButton(
                              child: const Text('Update'),
                              onPressed: () async {
                                final appUrl = GetPlatform.isAndroid
                                    ? AppConstants.playStoreLink
                                    : AppConstants.appStoreLink;
                                try {
                                  if (await canLaunch(appUrl)) {
                                    await launch(appUrl);
                                  } else {
                                    AppConstants.showSnackbar(
                                        text:
                                            'Sorry!! url cannot be launched at this time, please go to the appstore and manually update your app',
                                        type: SnackbarType.warning);
                                  }
                                } catch (e) {
                                  AppConstants.showSnackbar(
                                      text: e.toString(),
                                      type: SnackbarType.error);
                                  rethrow;
                                }
                              }),
                        ]),
                  )
                ])));
  }
}
