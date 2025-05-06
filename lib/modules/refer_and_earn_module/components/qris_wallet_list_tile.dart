import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qris_health/modules/refer_and_earn_module/models/wallet_entry/qris_wallet_entry.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';

import '../../../constants/enums/transaction_type.dart';
import '../../../styles/app_colors.dart';

class QrisWalletListTile extends StatelessWidget {
  final QrisWalletEntry walletEntry;
  const QrisWalletListTile({super.key, required this.walletEntry});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Row(children: [
      Container(
          padding: EdgeInsets.all(9),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: AppColors.primaryBlue),
          child: SvgPicture.asset(walletEntry.txnType == TransactionType.debit
              ? 'assets/images/icons/minus_icon.svg'
              : 'assets/images/icons/plus_icon.svg')),
      SizedBox(width: 9),
      Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(
            walletEntry.remark.isNullOrEmpty
                ? '${walletEntry.txnType.name.formattedEnumName}'
                : walletEntry.remark!.capitalize!,
            style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w400)),
        SizedBox(height: 5),
        Text(
            walletEntry.dated.toDateTime != null
                ? DateFormat()
                    .add_yMMMEd()
                    .add_jm()
                    .format(walletEntry.dated.toDateTime!)
                : walletEntry.dated,
            style: textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w300,
                color: AppColors.lightSubTextColor))
      ])),
      SizedBox(width: 16),
      Text('₹ ${walletEntry.amount.toInt()}',
          style: textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: walletEntry.txnType == TransactionType.credit
                  ? AppColors.green
                  : AppColors.red))
    ]);
  }
}
