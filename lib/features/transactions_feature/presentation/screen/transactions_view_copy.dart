import 'package:cashflow/common/widgets/shimmers/home_shimmer.dart';
import 'package:cashflow/common/widgets/transaction_item.dart';
import 'package:cashflow/features/transactions_feature/presentation/components/custom_floating_action_button/action-button.dart';
import 'package:cashflow/features/transactions_feature/presentation/components/custom_floating_action_button/expandable_fab.dart';
import 'package:cashflow/features/transactions_feature/presentation/controller/transactions_controller.dart';
import 'package:flutter/material.dart';
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
          child: RefreshIndicator(
              color: theme.primaryColor,
              backgroundColor: theme.cardColor,
              onRefresh: () {
                //articleController.fetchTop10Article();
                //animatedNewsController.fetchNews();
                return controller.fetchAllMonthTransactions();
              },
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: SizedBox(
                    width: size.width,
                    height: size.height * 0.95,
                    child: controller.obx(
                            (state) {
                          List<TransactionData>? model = controller
                              .transactionData.data!.cryptoCurrencyList;

                          /// Success
                          return ListView.builder(
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

                              return GestureDetector(
                                onTap: () {},
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
                              );
                            },
                          );
                        },
                        onLoading: const ShimmerLoadingHome(),
                        onError: (_) {
                          return Container();
                        }),
                  ),
                )
              )),
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
