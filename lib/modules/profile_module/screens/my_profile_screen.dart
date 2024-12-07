import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/common_textfield.dart';
import 'package:qris_health/shared/components/gender_input_container_row.dart';

import '../../../styles/app_colors.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final _textTheme = Get.textTheme;
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
            padding: EdgeInsets.all(AppConstants.scaffoldPadding),
            child: SafeArea(
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue),
                    child: Text('Update',
                        style: _textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500))))),
        appBar: CommonAppBar(title: 'My Profile'),
        body: ListView(
            physics: BouncingScrollPhysics(),
            padding:
                EdgeInsets.symmetric(horizontal: AppConstants.scaffoldPadding),
            children: [
              SizedBox(height: 32),
              CommonTextField(
                  hintText: 'Enter your name',
                  controller: _nameController,
                  textInputType: TextInputType.name,
                  headingText: 'Name'),
              SizedBox(height: 16),
              CommonTextField(
                  hintText: 'Enter your phone number',
                  controller: _mobileController,
                  textInputType: TextInputType.phone,
                  headingText: 'Mobile Number'),
              SizedBox(height: 16),
              CommonTextField(
                  hintText: 'Enter your email address',
                  controller: _emailController,
                  textInputType: TextInputType.emailAddress,
                  headingText: 'Email'),
              SizedBox(height: 16),
              GenderInputContainerRow(),
              SizedBox(height: 16),
              CommonTextField(
                  hintText: 'Enter your body weight',
                  controller: _weightController,
                  textInputType: TextInputType.phone,
                  headingText: 'Weight (in kg)'),
              SizedBox(height: 16),
              CommonTextField(
                  hintText: 'Enter your height',
                  controller: _heightController,
                  textInputType: TextInputType.phone,
                  headingText: 'Height (in cm)'),
            ]));
  }
}
