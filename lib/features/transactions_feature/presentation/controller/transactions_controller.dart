import 'package:cashflow/common/common.dart';
import 'package:cashflow/features/transactions_feature/repository/transactions_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionsController extends GetxController with StateMixin<AllTransactionModel> {
  late final TransactionsRepository _transactionsRepository; 
  TransactionsController(this._transactionsRepository);


  late AllTransactionModel transactionData;
  RxInt currentChoiceIndex = 0.obs;

  fetchAllMonthTransactions() async {
    currentChoiceIndex.value = 0;

    change(null, status: RxStatus.loading());
    try {
      var response = await _transactionsRepository.getTopMarketData();

      if (response.statusCode == 200) {
        transactionData = AllTransactionModel.fromJson(response.data);

        change(transactionData, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error());
      }
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  @override
  void onInit() {
    fetchAllMonthTransactions();
    super.onInit();
  }

}
