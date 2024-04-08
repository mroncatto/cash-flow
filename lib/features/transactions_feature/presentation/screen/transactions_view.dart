import 'package:cashflow/common/widgets/empty_states/offline_user_state.dart';
import 'package:cashflow/common/widgets/shimmers/home_shimmer.dart';
import 'package:cashflow/common/widgets/transaction_item.dart';
import 'package:cashflow/features/transactions_feature/presentation/components/custom_floating_action_button/action-button.dart';
import 'package:cashflow/features/transactions_feature/presentation/components/custom_floating_action_button/expandable_fab.dart';
import 'package:cashflow/features/transactions_feature/presentation/controller/transactions_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../../../../common/common.dart';

class TransactionsView extends GetView<TransactionsController> {
  const TransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
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

                          List<TransactionData>? model = controller
                              .transactionData.data!.cryptoCurrencyList;

                      /// Success
                      return RefreshIndicator(
                        color: theme.primaryColor,
                        backgroundColor: theme.cardColor,
                        onRefresh: () {
                          return controller.fetchAllMonthTransactions();
                        },
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            primary: false,
                            itemCount: model!.length,
                            itemBuilder: (context, index) {
                              var number = index + 1;
                              var tokenId = model[index].id;

                              // color for chart
                              MaterialColor filterColor =
                              DecimalRounder.setColorFilter(
                                model[index].quotes![0].percentChange24h,
                              );

                              // final price - removed decimal numbers as need
                              var finalPrice =
                              DecimalRounder.removePriceDecimals(
                                  model[index].quotes![0].price);

                              // percent change setup decimals and colors
                              var percentChange =
                              DecimalRounder.removePercentDecimals(
                                  model[index]
                                      .quotes![0]
                                      .percentChange24h);

                              // percent color - textStyle(color)
                              Color percentColor =
                              DecimalRounder.setPercentChangesColor(
                                  model[index]
                                      .quotes![0]
                                      .percentChange24h);

                              // percent icon - down or up
                              Icon percentIcon =
                              DecimalRounder.setPercentChangesIcon(
                                  model[index]
                                      .quotes![0]
                                      .percentChange24h);

                              return Slidable(
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      flex: 1,
                                      onPressed: (_) {
                                        // favoriteCoinsController.addToFavorite(
                                        //     model[index], context);
                                      },
                                      key: Key(tokenId.toString()),
                                      backgroundColor:
                                      theme.scaffoldBackgroundColor,
                                      foregroundColor: Get.isDarkMode
                                          ? Colors.white
                                          : theme.primaryColor,
                                      icon: Icons.ice_skating,
                                      label: 'Add to Favorite',
                                    ),
                                  ],
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    // Get.toNamed(RoutesName.detailsScreen,
                                    //     arguments: [
                                    //       tokenId!,
                                    //       _apiProvider
                                    //           .get(controller.filters())
                                    //     ]);
                                  },
                                  child: TransactionItem(
                                    number: number,
                                    tokenId: tokenId,
                                    model: model,
                                    filterColor: filterColor,
                                    finalPrice: finalPrice,
                                    percentIcon: percentIcon,
                                    percentChange: percentChange,
                                    percentColor: percentColor,
                                    index: index,
                                  ),
                                ),
                              );
                            }),
                      );
                    },

                    /// Any Error Happen, this view will show
                    onError: (error) => OfflineUserState(
                        onPressed: () {
                          // marketViewController.fetchAllCryptoData();
                          // animatedNewsController.fetchNews();
                        },
                        mainAxisAlignment: MainAxisAlignment.center),

                    /// on Loading Time, this view will show
                    onLoading: const ShimmerLoadingHome(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: ExpandableFab(
        distance: 100,
        children: [
          ActionButton(
            onPressed: () {},
            icon: const Icon(Icons.keyboard_arrow_down_outlined),
            color: Colors.red,
          ),
          ActionButton(
            onPressed: () {},
            icon: const Icon(Icons.keyboard_arrow_up_outlined),
            color: Colors.green,
          ),
          ActionButton(
            onPressed: () {},
            icon: const Icon(Icons.move_up_outlined),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
