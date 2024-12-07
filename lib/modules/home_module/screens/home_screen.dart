import 'package:flutter/material.dart';
import 'package:qris_health/modules/home_module/components/home_screen_app_bar.dart';
import 'package:qris_health/shared/components/filter_textfield.dart';
import 'package:qris_health/shared/components/main_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                padding: EdgeInsets.symmetric(vertical: 24),
                children: [
              FilterTextField(
                  onFieldSubmitted: (value) {},
                  controller: _searchController,
                  onChanged: (value) {},
                  hintText: 'Search for Blood tests / Packages....',
                  suffixIcon: null),
              SizedBox(height: 24),
            ])));
  }
}
