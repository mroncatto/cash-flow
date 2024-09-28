import 'package:cashflow/common/common.dart';
import 'package:cashflow/common/models/cuenta_models/cuenta_model.dart';
import 'package:cashflow/common/widgets/account_item.dart';
import 'package:cashflow/common/widgets/custom_appbar.dart';
import 'package:cashflow/common/widgets/empty_states/offline_user_state.dart';
import 'package:cashflow/common/widgets/shimmers/accounts_shimmer.dart';
import 'package:cashflow/features/accounts_feature/presentation/controller/accounts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/empty_states/empty_result_state.dart';

class AccountsView extends GetView<AccountsController> {
  const AccountsView({super.key});

  void _abrirNovaConta() {
    Get.offNamedUntil(RoutesName.newAccount, (route) => route.isFirst)
        ?.then((value) {
      if (value != null && value) {
        controller.fetchAllAccounts();
      }
    });
  }

  void _abrirDetalheConta(accountId) {
    Get.toNamed(RoutesName.detailAccount,
            arguments: [accountId, controller.fetchAccountById(accountId)])
        ?.then((value) {
      if (value != null && value) {
        controller.fetchAllAccounts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: const CustomAppBar(
        title: "Cuentas",
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            child: Column(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: controller.obx(
                    (state) {
                      List<CuentaModel>? model =
                          controller.cuentaDataList.data!.cuentaList;
                      return RefreshIndicator(
                          color: theme.primaryColor,
                          backgroundColor: theme.cardColor,
                          onRefresh: () {
                            return controller.fetchAllAccounts();
                          },
                          child: ListView.builder(
                              physics: const AlwaysScrollableScrollPhysics(),
                              primary: false,
                              itemCount: model?.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () {
                                      _abrirDetalheConta(model?[index].id);
                                    },
                                    child: AccountItem(
                                      index: index,
                                      model: model,
                                    ));
                              }));
                    },
                    onError: (error) => OfflineUserState(
                        onPressed: () {
                          controller.fetchAllAccounts();
                        },
                        mainAxisAlignment: MainAxisAlignment.center),
                    onEmpty: const EmptyResultState(
                        msg: "No hay cuentas registradas!"),
                    onLoading: const ShimmerLoadingAccounts(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _abrirNovaConta,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
