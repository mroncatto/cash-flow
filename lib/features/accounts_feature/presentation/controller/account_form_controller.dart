import 'dart:developer';

import 'package:cashflow/common/helper/modo_formulario_helper.dart';
import 'package:cashflow/common/models/cuenta_models/account_form_data_list.dart';
import 'package:cashflow/common/models/cuenta_models/cuenta_model.dart';
import 'package:cashflow/common/models/cuenta_models/cuenta_tipo_data.dart';
import 'package:cashflow/common/models/common/moneda_data.dart';
import 'package:cashflow/features/accounts_feature/repository/cuentas_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountFormController extends GetxController
    with StateMixin<AccountFormDataList> {
  late final CuentasRepository _cuentasRepository;
  AccountFormController(this._cuentasRepository);

  late List<CuentaTipoData> tiposCuenta;
  late List<MonedaData> monedas;
  final TextEditingController descricaoController = TextEditingController();
  late MonedaData monedaValue;
  late CuentaTipoData tipoCuentaValue;
  late ModoFormularioHelper modoFormulario;
  late CuentaModel cuenta;

  void setMonedaValue(MonedaData? value) {
    if (value != null) {
      monedaValue = value;
    }
  }

  void setTipoContaValue(CuentaTipoData? value) {
    if (value != null) {
      tipoCuentaValue = value;
    }
  }

  salvarConta() async {
    cuenta = CuentaModel(
        descripcion: descricaoController.text,
        tipo: tipoCuentaValue,
        color: "#FF8524",
        moneda: monedaValue,
        activo: true,
        saldo: 0);

    if (validarDados(cuenta)) {
      // TODO: Ver uma forma de bloquear tela ao tentar salvar !!!
      try {
        if (modoFormulario.isInsert()) {
          var response = await _cuentasRepository.salvarCuenta(cuenta);

          if (response.statusCode == 201) {
            fecharView(true);
          } else {
            mostrarError("Error al salvar cuenta");
          }
        } else {
          // update
        }
      } catch (err) {
        log(err.toString());
        mostrarError("Error al salvar cuenta");
      }
    }
  }

  void mostrarError(String error) {
    Get.snackbar("Error", error,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white);
  }

  void mostrarAlerta(String msg) {
    Get.defaultDialog(
        title: "Atencion",
        middleText: msg,
        onConfirm: () {
          Get.back();
        });
  }

  carregarCuentaPorId(int id) async {
    change(null, status: RxStatus.loading());

    try {
      var response = await _cuentasRepository.getCuentaById(id);

      if (response.statusCode == 200) {
        cuenta = CuentaModel.fromMap(response.data);
        //monedaValue = cuenta.moneda;
        //tipoCuentaValue = cuenta.tipo;
        //change(cuenta, status: RxStatus.success());
      } else {
        //change(null, status: RxStatus.error());
      }
    } catch (e) {
      //change(null, status: RxStatus.error());
    }
  }

  bool validarDados(CuentaModel novaConta) {
    if (novaConta.descripcion.isEmpty) {
      mostrarAlerta("Informe un nombre para la cuenta!");
      return false;
    }

    return true;
  }

  void fecharView(bool reload) {
    descricaoController.clear();
    monedaValue = monedas.first;
    tipoCuentaValue = tiposCuenta.first;
    Get.back(result: reload);
  }

  @override
  void onInit() {
    tiposCuenta = _cuentasRepository.getAllTipoCuenta();
    monedas = _cuentasRepository.getAllMonedas();

    if (Get.arguments != null && Get.arguments[0] != null) {
      int idConta = Get.arguments[0];
      carregarCuentaPorId(idConta);
      modoFormulario = ModoFormularioHelper.update;
    } else {
      modoFormulario = ModoFormularioHelper.insert;
      monedaValue = monedas.first;
      tipoCuentaValue = tiposCuenta.first;
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    log("tela aprensentada");
  }

  @override
  void onClose() {
    super.onClose();
    log("fechando a tela");
  }


}
