import 'package:flutter/material.dart';
import 'package:qris_health/constants/app_constants.dart';

import 'ios_handle.dart';

class CommonBottomSheetTemplate extends StatelessWidget {
  final Widget child;
  final bool isExtendedWidget;
  const CommonBottomSheetTemplate(
      {super.key, required this.child, this.isExtendedWidget = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            left: AppConstants.scaffoldPadding,
            right: AppConstants.scaffoldPadding,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SafeArea(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              const SizedBox(height: 12),
              const IosHandle(),
              if (isExtendedWidget) Expanded(child: child) else child
            ])));
  }
}
