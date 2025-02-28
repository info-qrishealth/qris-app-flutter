import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/users_module/cubits/user_cubit.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';

import '../../../constants/enums/snackbar_type.dart';
import '../../../styles/app_colors.dart';

class ReferAndEarnScreen extends StatefulWidget {
  const ReferAndEarnScreen({super.key});

  @override
  State<ReferAndEarnScreen> createState() => _ReferAndEarnScreenState();
}

class _ReferAndEarnScreenState extends State<ReferAndEarnScreen> {
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Refer & Earn'),
        body: SafeArea(child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            return ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.scaffoldPadding, vertical: 24),
                children: [
                  Image.asset(
                      'assets/images/illustrations/refer_and_earn_illustration.png'),
                  SizedBox(height: 28),
                  UnconstrainedBox(
                      child: GestureDetector(
                    onTap: () async {
                      if (state.user.referCode != null) {
                        await Clipboard.setData(
                            ClipboardData(text: state.user.referCode!));

                        AppConstants.showSnackbar(
                            text: 'Refer code copied',
                            type: SnackbarType.success);
                      }
                    },
                    child: DottedBorder(
                        strokeWidth: 0.5,
                        dashPattern: const [10, 11],
                        color: AppColors.primaryBlue,
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(10),
                        padding: const EdgeInsets.all(24),
                        child: IntrinsicHeight(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 200),
                                    child: Text(state.user.referCode ?? 'N/A',
                                        style: _textTheme.headlineLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.black))),
                                const SizedBox(width: 24),
                                const VerticalDivider(
                                    color: AppColors.lightGrey),
                                const SizedBox(width: 8),
                                SvgPicture.asset(
                                    'assets/images/icons/copy_icon.svg',
                                    height: 26),
                              ]),
                        ))),
                  )),
                  SizedBox(height: 12),
                  Text('Tap to copy link',
                      style: _textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryBlue),
                      textAlign: TextAlign.center),
                  SizedBox(height: 18),
                  Text('Share through',
                      style: _textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontFamily: AppConstants.ubuntuFontFamily),
                      textAlign: TextAlign.center),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.scaffoldPadding),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildImage(
                              imagePath:
                                  'assets/images/icons/social_media_icons/instagram_icon.png'),
                          _buildImage(
                              imagePath:
                                  'assets/images/icons/social_media_icons/twitter_icon.png'),
                          _buildImage(
                              imagePath:
                                  'assets/images/icons/social_media_icons/facebook_icon.png'),
                          _buildImage(
                              imagePath:
                                  'assets/images/icons/social_media_icons/whatsapp_icon.png'),
                          _buildImage(
                              imagePath:
                                  'assets/images/icons/social_media_icons/google_icon.png'),
                        ]),
                  ),
                  SizedBox(height: 34),
                  Text.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: 'By participating, you agree to the ',
                            style: _textTheme.bodyLarge!.copyWith(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            text: 'Terms & Conditions',
                            style: _textTheme.bodyLarge!.copyWith(
                                color: AppColors.primaryBlue,
                                fontWeight: FontWeight.w400))
                      ]),
                      textAlign: TextAlign.center),
                ]);
          },
        )));
  }

  Widget _buildImage({required String imagePath}) {
    return Image.asset(imagePath, height: 36);
  }
}
