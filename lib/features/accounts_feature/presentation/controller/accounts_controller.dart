import 'package:cashflow/common/models/cuenta_models/cuenta_data_list.dart';
import 'package:cashflow/features/accounts_feature/repository/cuentas_repository.dart';
import 'package:get/get.dart';

class AccountsController extends GetxController
    with StateMixin<CuentaDataList> {
  late final CuentasRepository _cuentasRepository;
  AccountsController(this._cuentasRepository);
  late CuentaDataList cuentaDataList;

  late String tipoValue;
  late String moedaValue;

  fetchAllAccounts() async {
    change(null, status: RxStatus.loading());
    try {
      var response = await _cuentasRepository.getAllCuentas();

      if (response.statusCode == 200) {
        cuentaDataList = CuentaDataList.fromMap(response.data);

        change(cuentaDataList, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error());
      }
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  fetchAccountById(accountId) async {
    //return _accountsRepository.getAccountById(accountId);
  }

  @override
  void onInit() {
    fetchAllAccounts();
    super.onInit();
  }
}
