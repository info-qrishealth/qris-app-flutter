import 'package:flutter/material.dart';
import 'package:qris_health/constants/enums/subscan_type.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';

class SubscanInfoScreen extends StatefulWidget {
  final SubScanType subScanType;
  const SubscanInfoScreen({super.key, required this.subScanType});

  @override
  State<SubscanInfoScreen> createState() => _SubscanInfoScreenState();
}

class _SubscanInfoScreenState extends State<SubscanInfoScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: widget.subScanType.formattedName),
        body: ListView(children: []));
  }
}
