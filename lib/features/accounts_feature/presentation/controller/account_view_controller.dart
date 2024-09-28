import 'package:cashflow/common/models/cuenta_models/cuenta_model.dart';
import 'package:cashflow/common/routers/routes_name.dart';
import 'package:cashflow/features/accounts_feature/repository/cuentas_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountViewController extends GetxController
    with StateMixin<CuentaModel> {
  late final CuentasRepository _cuentasRepository;
  AccountViewController(this._cuentasRepository);
  late CuentaModel cuenta;

  buscarContaPorId(int? id) async {
    change(null, status: RxStatus.loading());

    try {
      if (id == null) throw Exception("ID invalido!");
      var response = await _cuentasRepository.getCuentaById(id);

      if (response.statusCode == 200) {
        cuenta = CuentaModel.fromMap(response.data);

        change(cuenta, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error());
      }
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  arquivarCuenta() async {
    Get.defaultDialog(
        title: "Atencion",
        middleText: "Deseas arquivar la cuenta?",
        contentPadding: const EdgeInsets.all(15),
        onConfirm: () async {
          await _cuentasRepository.arquivarCuentaById(cuenta.id);
          Get.back();
          cerrarView();
        },
        onCancel: () {});
  }

  alterarCuenta() async {
    Get.toNamed(RoutesName.newAccount, arguments: cuenta.id)?.then((value) {
      if (value != null && value) {
        buscarContaPorId(cuenta.id);
      }
    });
  }

  @override
  void onInit() {
    buscarContaPorId(Get.arguments[0]);
    super.onInit();
  }

  void cerrarView() {
    Get.back(result: true);
  }
}
