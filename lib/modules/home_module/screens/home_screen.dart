import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/home_module/components/home_screen_app_bar.dart';
import 'package:qris_health/shared/components/filter_textfield.dart';
import 'package:qris_health/shared/components/main_drawer.dart';
import 'package:qris_health/shared/components/outlined_icon_button.dart';
import 'package:qris_health/styles/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _textTheme = Get.textTheme;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: MainDrawer(),
        appBar: HomeScreenAppBar(scaffoldKey: _scaffoldKey),
        body: SafeArea(
            child: ListView(
                padding: EdgeInsets.symmetric(
                    vertical: 24, horizontal: AppConstants.scaffoldPadding),
                children: [
              FilterTextField(
                  onFieldSubmitted: (value) {},
                  controller: _searchController,
                  onChanged: (value) {},
                  hintText: 'Search for Blood tests / Packages....',
                  suffixIcon: null),
              SizedBox(height: 24),
              Row(children: [
                Expanded(
                    child: Text('Popular blood test packages',
                        style: _textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.w700))),
                OutlinedIconButton(
                    onTap: () {},
                    icon: Icon(Icons.arrow_forward_ios,
                        color: AppColors.primaryBlue)),
              ])
            ])));
  }
}
