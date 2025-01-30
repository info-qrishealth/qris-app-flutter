import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/api_params.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';
import 'package:qris_health/modules/orders_modele/services/order_service.dart';
import 'package:qris_health/modules/patients_module/models/patient/patient.dart';
import 'package:qris_health/modules/patients_module/services/patient_service.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/common_filled_chip.dart';
import 'package:qris_health/shared/components/common_listview_shimmer.dart';

import '../components/order_list_tile.dart';
import '../models/order/order.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  late final Future<List<Patient>> _patientsFuture;
  late final Future<List<Order>> _ordersFuture;
  Patient? _selectedPatient;

  @override
  void initState() {
    super.initState();
    _patientsFuture = PatientService.getPatientsOfUser(
        userId: ApiParams.getInstance()!.userId.toString());
    _ordersFuture = OrderService.getAllOrdersForUser(
        userId: ApiParams.getInstance()!.userId.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Bookings/Reports'),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 16),
          FutureBuilder<List<Patient>>(
              future: _patientsFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final patients = snapshot.data!;

                  return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppConstants.scaffoldPadding),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedPatient = null;
                                      });
                                    },
                                    child: CommonFilledChip(
                                        isSelected: _selectedPatient == null,
                                        title: 'All')),
                                SizedBox(width: 4),
                                ...patients.map((patient) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _selectedPatient = patient;
                                          });
                                        },
                                        child: CommonFilledChip(
                                            isSelected: _selectedPatient?.id ==
                                                patient.id,
                                            title:
                                                '${patient.name?.capitalize}')))),
                              ])));
                }

                return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.scaffoldPadding),
                    child: FadeShimmer(
                        width: double.infinity,
                        height: 30,
                        fadeTheme: FadeTheme.light));
              }),
          SizedBox(height: 18),
          Expanded(
              child: FutureBuilder<List<Order>>(
                  future: OrderService.getAllOrdersForUser(
                      userId: ApiParams.getInstance()!.userId.toString()),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      AppConstants.showSnackbar(
                          text: snapshot.error.toString(),
                          type: SnackbarType.error);
                    }

                    if (snapshot.hasData) {
                      final orders = snapshot.data!.reversed.toList();

                      return ListView.separated(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppConstants.scaffoldPadding),
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return OrderListTile(order: orders[index]);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 10);
                          },
                          itemCount: orders.length);
                    }

                    return CommonListviewShimmer();
                  }))
        ]));
  }
}
