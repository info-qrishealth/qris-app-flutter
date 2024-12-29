import 'package:flutter/material.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';

class MalePerformanceScreen extends StatefulWidget {
  const MalePerformanceScreen({super.key});

  @override
  State<MalePerformanceScreen> createState() => _MalePerformanceScreenState();
}

class _MalePerformanceScreenState extends State<MalePerformanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Details'),
    );
  }
}
