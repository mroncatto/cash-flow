import 'package:cashflow/common/models/accounts_models/account_data_list.dart';
import 'package:cashflow/features/accounts_feature/repository/accounts_repository.dart';
import 'package:get/get.dart';

class AccountsController extends GetxController with StateMixin<AccountDataList> {
  late final AccountsRepository _accountsRepository;
  AccountsController(this._accountsRepository);
  late AccountDataList accountsData;
  List<String> tipos = <String>['Banco', 'Carteira', 'Crypto'];
  List<String> moedas = <String>['Guarani - PYG', 'Dolar - USD', 'Real - BRL'];
  late String tipoValue;
  late String moedaValue;

  fetchAllAccounts() async {
    change(null, status: RxStatus.loading());
    try {
      var response = await _accountsRepository.getAllAcounts();

      if (response.statusCode == 200) {
        accountsData = AccountDataList.fromJson(response.data);

        change(accountsData, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error());
      }
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  fetchAccountById(accountId) async {
    return _accountsRepository.getAccountById(accountId);
  }

  @override
  void onInit() {
    fetchAllAccounts();
    super.onInit();
  }


}