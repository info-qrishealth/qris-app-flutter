import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class GenderInputContainerRow extends StatefulWidget {
  const GenderInputContainerRow({super.key});

  @override
  State<GenderInputContainerRow> createState() =>
      _GenderInputContainerRowState();
}

class _GenderInputContainerRowState extends State<GenderInputContainerRow> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text(' Gender',
          style:
              Get.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400)),
      SizedBox(height: 12),
      Padding(
          padding: const EdgeInsets.only(left: 2),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            _buildSexContainer(
                svgPath: 'assets/images/icons/gender/male_icon.svg'),
            _buildSexContainer(
                svgPath: 'assets/images/icons/gender/female_icon.svg'),
            _buildSexContainer(
                svgPath: 'assets/images/icons/gender/others_icon.svg'),
          ])),
    ]);
  }

  Widget _buildSexContainer({required String svgPath}) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 26, vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.black.withOpacity(0.09))),
        child: SvgPicture.asset(svgPath));
  }
}
