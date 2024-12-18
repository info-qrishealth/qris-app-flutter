import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/address_module/components/address_list_tile.dart';
import 'package:qris_health/shared/components/common_action_app_bar_button.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';

import '../components/add_address_bottom_sheet.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Addresses', actions: [
          CommonActionAppBarButton(
              title: '+ Add New Address',
              onTap: () async {
                await showModalBottomSheet(
                    isScrollControlled: true,
                    constraints: BoxConstraints(maxHeight: Get.height * 0.85),
                    context: context,
                    builder: (context) => AddAddressBottomSheet());
              })
        ]),
        body: ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
                horizontal: AppConstants.scaffoldPadding, vertical: 16),
            itemBuilder: (snapshot, index) {
              return AddressListTile();
            },
            separatorBuilder: (snapshot, index) {
              return SizedBox(height: 18);
            },
            itemCount: 10));
  }
}
