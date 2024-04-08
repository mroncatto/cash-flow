import 'package:cashflow/common/common.dart';
import 'package:cashflow/common/models/accounts_models/account_data.dart';
import 'package:cashflow/common/widgets/account_item.dart';
import 'package:cashflow/common/widgets/empty_states/offline_user_state.dart';
import 'package:cashflow/common/widgets/shimmers/home_shimmer.dart';
import 'package:cashflow/features/accounts_feature/presentation/controller/accounts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountsView extends GetView<AccountsController> {
  const AccountsView({super.key});

  void _abrirNovaConta() {
    Get.offNamedUntil(RoutesName.newAccount, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(title: Text("Contas")),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            child: Column(
              children: [
                Text("teste"),
                Flexible(
                  fit: FlexFit.tight,
                  child: controller.obx((state) {
                    List<AccountData>? model =
                        controller.accountsData.data!.accountDataList;
                    return RefreshIndicator(
                        color: theme.primaryColor,
                        backgroundColor: theme.cardColor,
                        onRefresh: () {
                          return controller.fetchAllAccounts();
                        },
                        child: ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            primary: false,
                            itemCount: model!.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {},
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

                    /// on Loading Time, this view will show
                    onLoading: const ShimmerLoadingHome(),
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
