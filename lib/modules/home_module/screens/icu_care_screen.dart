import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/generated/assets.dart';
import 'package:qris_health/shared/components/bordered_container.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/request_callback_dialog.dart';

import '../../../styles/app_colors.dart';

class IcuCareScreen extends StatefulWidget {
  const IcuCareScreen({super.key});

  @override
  State<IcuCareScreen> createState() => _IcuCareScreenState();
}

class _IcuCareScreenState extends State<IcuCareScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Scaffold(
        appBar: CommonAppBar(title: 'ICU Care'),
        body: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
                horizontal: AppConstants.scaffoldPadding, vertical: 16),
            children: [
              Text(
                  'Professional ICU setup and 24x7 medical care for your loved ones — in the comfort of your home.',
                  style: textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.w400)),
              SizedBox(height: 20),
              Image.asset(Assets.illustrationsIcuIllustration),
              SizedBox(height: 20),
              Text('Why Choose Qris for ICU Care?',
                  style: textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontFamily: AppConstants.ubuntuFontFamily)),
              SizedBox(height: 10),
              BorderedContainer(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 8),
                      child: Column(spacing: 2, children: [
                        _buildBenefitRow(
                            title: 'Up to 40% Lower Costs vs. metro hospitals'),
                        _buildBenefitRow(
                            title:
                                'Critical Care Supervision from certified intensivists'),
                        _buildBenefitRow(
                            title:
                                'Partnered with Trustworthy Hospitals near you'),
                        _buildBenefitRow(
                            title: 'Quick Bed Access in Emergencies'),
                        _buildBenefitRow(
                            title: 'Transparent Communication with families'),
                        _buildBenefitRow(
                            title: 'Digital Record Integration with Qris App'),
                      ]))),
              SizedBox(height: 20),
              Text(
                  'Would you like to receive more information about Qris ICU Care services?',
                  style: textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.w400)),
              SizedBox(height: 2),
              Text('(We’ll get in touch with you shortly)',
                  style: textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightSubTextColor)),
              SizedBox(height: 16),
              SizedBox(
                height: 36,
                child: Row(children: [
                  Expanded(
                      child: OutlinedButton(
                          onPressed: Navigator.of(context).pop,
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(color: AppColors.primaryBlue)),
                          child: Text('No',
                              style: textTheme.bodyLarge!
                                  .copyWith(fontWeight: FontWeight.w500)))),
                  SizedBox(width: 8),
                  Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryBlue),
                          onPressed: () async {
                            await showDialog(
                                context: context,
                                builder: (context) => RequestCallbackDialog(
                                    query: 'I want your help about ICU Care'));
                          },
                          child: Text('Yes',
                              style: textTheme.bodyLarge!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500))))
                ]),
              ),
            ]));
  }

  Widget _buildBenefitRow({required String title}) {
    return Row(children: [
      SvgPicture.asset(Assets.testBenefitIconsVerifiedBenefitIcon,
          color: AppColors.primaryBlue,
          fit: BoxFit.fill,
          height: 24,
          width: 24),
      SizedBox(width: 4),
      Expanded(
          child: Text(title,
              style: Get.textTheme.bodySmall!.copyWith(
                  color: AppColors.primaryPink, fontWeight: FontWeight.w400)))
    ]);
  }
}
