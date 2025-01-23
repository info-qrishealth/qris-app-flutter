import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/api_params.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';
import 'package:qris_health/modules/address_module/components/address_list_tile.dart';
import 'package:qris_health/modules/address_module/services/address_service.dart';
import 'package:qris_health/shared/components/common_action_app_bar_button.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/common_listview_shimmer.dart';
import 'package:qris_health/shared/components/no_item_found_container.dart';

import '../components/add_address_bottom_sheet.dart';
import '../models/address/address.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  late Future<List<Address>> _addressFuture;
  List<Address>? _addresses;

  @override
  void initState() {
    super.initState();
    _addressFuture = AddressService.getAddressesByUserId(
        userId: ApiParams.getInstance()!.userId!.toString());
  }

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
                    builder: (context) =>
                        AddAddressBottomSheet(onAddressAdded: (addedAddress) {
                          setState(() {
                            _addresses = [..._addresses ?? [], addedAddress];
                          });
                        }));
              })
        ]),
        body: FutureBuilder<List<Address>>(
            future: _addressFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _addresses ??= snapshot.data!
                    .where((element) => element.status == 1)
                    .toList();

                if (_addresses != null && _addresses!.isEmpty) {
                  return Center(
                      child: NoItemFoundContainer(title: 'No addresses found'));
                }

                return ListView.separated(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.scaffoldPadding, vertical: 16),
                    itemBuilder: (snapshot, index) {
                      final address = _addresses![index];
                      return AddressListTile(
                          address: address,
                          onDeleteTap: () =>
                              _changeStatus(addressId: address.id!));
                    },
                    separatorBuilder: (snapshot, index) {
                      return SizedBox(height: 18);
                    },
                    itemCount: _addresses?.length ?? 0);
              } else {
                return CommonListviewShimmer();
              }
            }));
  }

  Future<void> _changeStatus({required int addressId}) async {
    try {
      await AddressService.changeAddressStatus(
          addressId: addressId, desiredStatus: 0);
      _addresses!.removeWhere((element) => element.id == addressId);
      setState(() {});
      AppConstants.showSnackbar(
          text: 'Deleted successfully', type: SnackbarType.success);
    } catch (e) {
      AppConstants.showSnackbar(text: e.toString(), type: SnackbarType.error);
    }
  }
}
