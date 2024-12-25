import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/modules/home_module/components/package_tile.dart';

class SelectPatientTab extends StatefulWidget {
  const SelectPatientTab({super.key});

  @override
  State<SelectPatientTab> createState() => _SelectPatientTabState();
}

class _SelectPatientTabState extends State<SelectPatientTab> {
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Text('Package Details',
          style: _textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700)),
      SizedBox(height: 18),
      PackageTileHorizontal(onBookNowTap: null),
    ]);
  }
}
