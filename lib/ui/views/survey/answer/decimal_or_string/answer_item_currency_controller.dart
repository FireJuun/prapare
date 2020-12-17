import 'package:get/get.dart';
import 'package:money2/money2.dart';

class AnswerItemCurrencyController extends GetxController {
  final Rx<Currency> activeCurrency = CommonCurrencies().usd.obs;

  // @override
  // void onInit() {
  //   CommonCurrencies().registerAll();
  //   super.onInit();
  // }
}
