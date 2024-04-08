import 'package:cashflow/common/helper/decimal_rounder.dart';
import 'package:cashflow/common/models/accounts_models/account_data.dart';
import 'package:flutter/material.dart';
import '../../common/common.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({
    super.key,
    required this.model,
    required this.index,
  });

  final List<AccountData>? model;
  final int index;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: theme.cardColor),
        margin: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
        height: size.height * 0.090,
        width: size.width,
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: const EdgeInsets.all(2),
                child: Row(children: [
                  Icon(
                    Icons.account_balance,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(model![index].descricao!,
                          style: theme.textTheme.displaySmall),
                      const SizedBox(height: 1),
                      Text("Saldo Disponivel",
                          style: theme.textTheme.displayMedium),
                    ],
                  ),
                ])),
            Padding(
              padding: const EdgeInsets.all(2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(model![index].currency!,
                      style: theme.textTheme.displayMedium?.copyWith(color: Colors.orange)),
                  Text( model![index].currency! != 'BTC'
                      ? DecimalRounder.setMarketCap(model![index].saldoInicial)
                      : DecimalRounder.removePriceDecimals(model![index].saldoInicial),
                      style: theme.textTheme.displayMedium?.copyWith(color: Colors.green)),
                ],
              ),
            )
          ],
        ));
  }
}
