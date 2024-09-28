import 'package:cashflow/common/models/common/moneda_data.dart';
import 'package:cashflow/features/accounts_feature/presentation/controller/accounts_controller.dart';
import 'package:cashflow/features/accounts_feature/presentation/controller/account_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/models/cuenta_models/cuenta_tipo_data.dart';
import '../../../../common/widgets/empty_states/offline_user_state.dart';

class NewAccountView extends GetView<AccountFormController> {
  const NewAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return PopScope(
        onPopInvokedWithResult: (didPop, result) {
          controller.fecharView(false);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("Nueva Cuenta", style: theme.textTheme.displaySmall),
          ),
          body: Center(
              child: Padding(
                padding: EdgeInsets.all(size.width * 0.03),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: controller.descricaoController,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.description),
                          hintText: 'Descricao da conta',
                          border: const OutlineInputBorder(),
                          hintStyle:
                          GoogleFonts.baiJamjuree(color: Colors.grey.shade500),
                          labelStyle:
                          GoogleFonts.baiJamjuree(color: Colors.grey.shade700)),
                    ),
                    const SizedBox(height: 10),
                    DropdownMenu<CuentaTipoData>(
                      initialSelection: controller.tipoCuentaValue,
                      onSelected: (CuentaTipoData? value) {
                        controller.setTipoContaValue(value);
                      },
                      enableSearch: true,
                      width: size.width * 0.94,
                      leadingIcon: const Icon(Icons.account_balance),
                      dropdownMenuEntries: controller.tiposCuenta
                          .map<DropdownMenuEntry<CuentaTipoData>>(
                              (CuentaTipoData value) {
                            return DropdownMenuEntry<CuentaTipoData>(
                              value: value,
                              label: value.tipo,
                            );
                          }).toList(),
                    ),
                    const SizedBox(height: 10),
                    DropdownMenu<MonedaData>(
                      initialSelection: controller.monedaValue,
                      onSelected: (MonedaData? value) {
                        controller.setMonedaValue(value);
                      },
                      enableSearch: true,
                      width: size.width * 0.94,
                      leadingIcon: const Icon(Icons.attach_money),
                      dropdownMenuEntries: controller.monedas
                          .map<DropdownMenuEntry<MonedaData>>((MonedaData value) {
                        return DropdownMenuEntry<MonedaData>(
                          value: value,
                          label: value.nombre,
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 10),
                    Text("Falta o color picker")
                  ],
                ),
              )),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.salvarConta();
            },
            child: const Icon(Icons.check),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        )
    );
  }
}
