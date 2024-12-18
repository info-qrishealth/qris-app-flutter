import 'package:flutter/material.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/modules/family_members_module/components/member_list_tile.dart';
import 'package:qris_health/shared/components/common_action_app_bar_button.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';

import '../components/add_family_member_bottom_sheet.dart';

class FamilyMemberScreen extends StatefulWidget {
  const FamilyMemberScreen({super.key});

  @override
  State<FamilyMemberScreen> createState() => _FamilyMemberScreenState();
}

class _FamilyMemberScreenState extends State<FamilyMemberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Patients', actions: [
          CommonActionAppBarButton(
              title: '+ Add New Member',
              onTap: () async {
                await showModalBottomSheet(
                    isScrollControlled: true,
                    constraints: AppConstants.bottomSheetConstraints,
                    context: context,
                    builder: (context) {
                      return AddFamilyMemberBottomSheet();
                    });
              })
        ]),
        body: SafeArea(
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.scaffoldPadding, vertical: 24),
                itemBuilder: (context, index) {
                  return MemberListTile(index: index);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 18);
                },
                itemCount: 10)));
  }
}
