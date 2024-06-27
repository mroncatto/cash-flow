import 'package:cashflow/features/accounts_feature/presentation/controller/accounts_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NewAccountView extends GetView<AccountsController> {
  const NewAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    controller.tipoValue = controller.tipos.first;
    controller.moedaValue = controller.moedas.first;

    return Scaffold(
      appBar: AppBar(
        title: Text("Nova Conta", style: theme.textTheme.displaySmall),
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(size.width * 0.03),
        child: Column(
          children: [
            Container(
              width: size.width,
              height: 1,
              margin: EdgeInsets.symmetric(vertical: 10),
            ),
            Row(
              children: [
                Container(
                  width: size.width * 0.8,
                  child: TextFormField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    initialValue: "0",
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.monetization_on),
                        hintText: 'Saldo Inicial',
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.baiJamjuree(
                            color: Colors.grey.shade500),
                        labelStyle: GoogleFonts.baiJamjuree(
                            color: Colors.grey.shade700)),
                  ),
                )
              ],
            ),
            // Container(
            //   width: size.width,
            //   height: 1,
            //   margin: EdgeInsets.symmetric(vertical: 10),
            //   color: theme.secondaryHeaderColor,
            // ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.description),
                  hintText: 'Descricao da conta',
                  border: OutlineInputBorder(),
                  hintStyle:
                      GoogleFonts.baiJamjuree(color: Colors.grey.shade500),
                  labelStyle:
                      GoogleFonts.baiJamjuree(color: Colors.grey.shade700)),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.category_rounded),
                  hintText: 'Descricao da conta',
                  border: OutlineInputBorder(),
                  hintStyle:
                      GoogleFonts.baiJamjuree(color: Colors.grey.shade500),
                  labelStyle:
                      GoogleFonts.baiJamjuree(color: Colors.grey.shade700)),
            ),
            const SizedBox(height: 10),
            DropdownMenu<String>(
              initialSelection: controller.tipoValue,
              onSelected: (String? value) {  },
              enableSearch: true,
              width: size.width * 0.94,
              leadingIcon: const Icon(Icons.account_balance),
              dropdownMenuEntries:
                  controller.tipos.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(
                  value: value,
                  label: value,
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            DropdownMenu<String>(
              initialSelection: controller.moedaValue,
              onSelected: (String? value) {  },
              enableSearch: true,
              width: size.width * 0.94,
              leadingIcon: const Icon(Icons.attach_money),
              dropdownMenuEntries:
              controller.moedas.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(
                  value: value,
                  label: value,
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            Text("Falta o color picker")
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.check),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
