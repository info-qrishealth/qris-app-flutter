import 'package:flutter/material.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';

class HealthArticlesScreen extends StatefulWidget {
  const HealthArticlesScreen({super.key});

  @override
  State<HealthArticlesScreen> createState() => _HealthArticlesScreenState();
}

class _HealthArticlesScreenState extends State<HealthArticlesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Health Articles'),
        body: Column(children: [
          SingleChildScrollView(
              scrollDirection: Axis.horizontal, child: Row(children: [])),
        ]));
  }
}
