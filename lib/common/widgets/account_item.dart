import 'package:cashflow/common/helper/decimal_rounder.dart';
import 'package:cashflow/common/models/cuenta_models/cuenta_model.dart';
import 'package:flutter/material.dart';
import '../../common/common.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({
    super.key,
    required this.model,
    required this.index,
  });

  final List<CuentaModel>? model;
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
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: HexColor(model![index].color)),
                    child: Icon(
                      model![index].toIcon(),
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(model![index].descripcion,
                          style: theme.textTheme.displaySmall),
                      const SizedBox(height: 1),
                      Text("Saldo de la cuenta",
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
                  Text(model![index].moneda.codigo,
                      style: theme.textTheme.displayMedium
                          ?.copyWith(color: Colors.orange)),
                  Text(DecimalRounder.setMarketCap(model![index].saldo),
                      style: theme.textTheme.displayMedium
                          ?.copyWith(color: Colors.green)),
                ],
              ),
            )
          ],
        ));
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
