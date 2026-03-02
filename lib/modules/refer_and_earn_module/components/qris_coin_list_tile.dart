import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qris_health/constants/enums/transaction_type.dart';
import 'package:qris_health/modules/refer_and_earn_module/models/qris_coin/qris_coin.dart';
import 'package:qris_health/shared/extensions/string_extension.dart';

import '../../../styles/app_colors.dart';

class QrisCoinListTile extends StatelessWidget {
  final QrisCoin coinEntry;
  const QrisCoinListTile({super.key, required this.coinEntry});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Row(children: [
      Container(
          padding: EdgeInsets.all(9),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: AppColors.primaryBlue),
          child: SvgPicture.asset(coinEntry.txnType == TransactionType.debit
              ? 'assets/images/icons/minus_icon.svg'
              : 'assets/images/icons/plus_icon.svg')),
      SizedBox(width: 9),
      Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(
            coinEntry.remark.isEmpty
                ? '${coinEntry.txnType.name.formattedEnumName}'
                : coinEntry.remark,
            style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w400)),
        SizedBox(height: 5),
        Text(
            coinEntry.dated.toDateTime != null
                ? DateFormat()
                    .add_yMMMEd()
                    .add_jm()
                    .format(coinEntry.dated.toDateTime!)
                : coinEntry.dated,
            style: textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w300,
                color: AppColors.lightSubTextColor))
      ])),
      SizedBox(width: 16),
      Text('${coinEntry.coins.toInt()}',
          style: textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: coinEntry.txnType == TransactionType.credit
                  ? AppColors.green
                  : AppColors.red))
    ]);
  }
}
