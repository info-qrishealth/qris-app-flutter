import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';
import 'package:qris_health/shared/services/config_services.dart';
import 'package:qris_health/styles/app_colors.dart';

class RequestCallbackDialog extends StatefulWidget {
  final String query;
  const RequestCallbackDialog({super.key, required this.query});

  @override
  State<RequestCallbackDialog> createState() => _RequestCallbackDialogState();
}

class _RequestCallbackDialogState extends State<RequestCallbackDialog> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        insetPadding:
            EdgeInsets.symmetric(horizontal: AppConstants.scaffoldPadding),
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(
                  'You have requested a call back from a healthcare expert. Please confirm if you’d like to proceed.',
                  style: textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      height: 1.8,
                      color: AppColors.black),
                  textAlign: TextAlign.center),
              SizedBox(height: 24),
              SizedBox(
                  height: 40,
                  child: Row(children: [
                    Expanded(
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(color: AppColors.primaryBlue)),
                            onPressed: _isLoading
                                ? null
                                : () {
                                    Navigator.of(context).pop();
                                  },
                            child: Text('Cancel',
                                style: textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryBlue)))),
                    SizedBox(width: 8),
                    Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryBlue),
                            onPressed: _isLoading
                                ? null
                                : () async {
                                    try {
                                      setState(() {
                                        _isLoading = true;
                                      });

                                      await ConfigService.requestCallback(
                                          query: widget.query);

                                      Navigator.of(context).pop();
                                      AppConstants.showSnackbar(
                                          text:
                                              'Callback requested! You would get a callback from qris team ASAP',
                                          type: SnackbarType.success);
                                    } catch (e) {
                                      AppConstants.showSnackbar(
                                          text: e.toString(),
                                          type: SnackbarType.error);
                                    } finally {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    }
                                  },
                            child: Text(_isLoading ? 'Submitting...' : 'Confirm',
                                style: textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white))))
                  ]))
            ])));
  }
}
