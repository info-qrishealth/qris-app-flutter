import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/api_params.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/constants/enums/gender.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';
import 'package:qris_health/modules/patients_module/models/patient/patient.dart';
import 'package:qris_health/modules/patients_module/services/patient_service.dart';
import 'package:qris_health/modules/users_module/cubits/user_cubit.dart';
import 'package:qris_health/modules/users_module/services/user_service.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/common_textfield.dart';
import 'package:qris_health/shared/components/gender_input_container_row.dart';
import 'package:qris_health/shared/utils/enum_utils.dart';
import 'package:qris_health/shared/utils/search_pattern.dart';

import '../../../styles/app_colors.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final _textTheme = Get.textTheme;
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Gender? _selectedGender;
  Patient? _selfPatient;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    PatientService.getPatientsOfUser(
            userId: ApiParams.getInstance()!.userId!.toString())
        .then((patients) {
      _selfPatient =
          patients.firstWhereOrNull((element) => element.self == '1');
      _initializeHeightAndWeight();
    });

    final userCubit = BlocProvider.of<UserCubit>(context);
    final user = userCubit.state.user;

    _nameController.text = user.name ?? '';
    _phoneNumberController.text = user.phone ?? '';
    _emailController.text = user.email ?? '';
    _selectedGender = EnumUtils.getGenderFromNumberString(number: user.gender);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
            padding: EdgeInsets.all(AppConstants.scaffoldPadding),
            child: SafeArea(
                child: ElevatedButton(
                    onPressed: _loading ? null : _updateUser,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue),
                    child: Text('Update',
                        style: _textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500))))),
        appBar: CommonAppBar(title: 'My Profile'),
        body: Form(
          key: _formKey,
          child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.scaffoldPadding),
              children: [
                SizedBox(height: 32),
                CommonTextField(
                    validator: (name) {
                      if (name == null || name.isEmpty) {
                        return 'Field is required';
                      }

                      return null;
                    },
                    hintText: 'Enter your name',
                    controller: _nameController,
                    textInputType: TextInputType.name,
                    headingText: 'Name'),
                SizedBox(height: 16),
                CommonTextField(
                    readOnly: true,
                    hintText: 'Enter your phone number',
                    controller: _phoneNumberController,
                    textInputType: TextInputType.phone,
                    headingText: 'Mobile Number'),
                SizedBox(height: 16),
                CommonTextField(
                    validator: (email) {
                      if (!SearchPattern.isValidEmail(email)) {
                        return 'Please enter valid email';
                      }

                      return null;
                    },
                    hintText: 'Enter your email address',
                    controller: _emailController,
                    textInputType: TextInputType.emailAddress,
                    readOnly: true,
                    headingText: 'Email'),
                SizedBox(height: 16),
                BlocBuilder<UserCubit, UserState>(builder: (context, state) {
                  return GenderInputContainerRow(
                      onTap: (gender) {
                        setState(() {
                          _selectedGender = gender;
                        });
                      },
                      selectedGender: _selectedGender);
                }),
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
              ]),
        ));
  }

  Future<void> _updateUser() async {
    try {
      if (_formKey.currentState?.validate() == true) {
        setState(() {
          _loading = true;
        });

        if (_selfPatient != null) {
          final updatedSelf =
              await PatientService.updatePatient(_selfPatient!.copyWith.call(
                  gender: _selectedGender == Gender.MALE
                      ? '2'
                      : _selectedGender == Gender.FEMALE
                          ? '1'
                          : '0',
                  height: int.tryParse(_heightController.text),
                  weight: int.tryParse(_weightController.text),
                  name: _nameController.text,
                  email: _emailController.text));
          _selfPatient = updatedSelf;
        }

        final userCubit = BlocProvider.of<UserCubit>(context);

        final updatedUser = await UserService.updateUser(
            user: userCubit.state.user.copyWith.call(
                name: _nameController.text,
                email: _emailController.text,
                gender: _selectedGender?.number.toString() ?? '0'));
        userCubit.updateUser(user: updatedUser);

        AppConstants.showSnackbar(
            text: 'Updated successfully', type: SnackbarType.success);
      }
    } catch (e) {
      AppConstants.showSnackbar(text: e.toString(), type: SnackbarType.error);
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  void _initializeHeightAndWeight() {
    if (_selfPatient != null) {
      _heightController.text = '${_selfPatient!.height ?? ''}';
      _weightController.text = '${_selfPatient!.weight ?? ''}';
    }
  }
}
