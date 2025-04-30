import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qris_health/shared/components/common_html_text.dart';
import 'package:qris_health/shared/cubits/qris_config_cubit/qris_config_cubit.dart';

class CancelOrderPolicyDialog extends StatelessWidget {
  const CancelOrderPolicyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<QrisConfigCubit, QrisConfigState>(
                builder: (context, state) {
              return SingleChildScrollView(
                  child:
                      CommonHtmlText(text: state.config!.cancellationPolicy));
            })));
  }
}
