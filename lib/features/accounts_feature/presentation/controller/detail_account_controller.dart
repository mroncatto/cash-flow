import 'package:cashflow/common/models/accounts_models/account_data.dart';
import 'package:cashflow/features/accounts_feature/repository/accounts_details_repository.dart';
import 'package:get/get.dart';

class DetailAccountController extends GetxController with StateMixin<dynamic> {
  late final AccountDetailRepository _accountDetailRepository;
  DetailAccountController(this._accountDetailRepository);
  late AccountData account;

  // getData(int id, dynamic api) async {
  //   change(null, status: RxStatus.loading());
  //
  //   try {
  //     var response = await api;
  //
  //     if (response.statusCode == 200) {
  //       account = AccountData.fromJson(response.data);
  //
  //       change(account, status: RxStatus.success());
  //     } else {
  //       change(null, status: RxStatus.error());
  //     }
  //   } catch (e) {
  //     change(null, status: RxStatus.error());
  //   }
  // }

  fetchAccountById(accountId) async {
    change(null, status: RxStatus.loading());
    try {
      var response = await _accountDetailRepository.getAccountById(accountId);

      if (response.statusCode == 200) {
        account = AccountData.fromJson(response.data);

        change(account, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error());
      }
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  @override
  void onInit() {
    fetchAccountById(Get.arguments[0]);
    super.onInit();
  }
}
