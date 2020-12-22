import 'package:get/get.dart';
import 'package:money2/money2.dart';

class AnswerItemCurrencyController extends GetxController {
  // given this currency only handles salary, minor digits (cents) are ignored
  final Rx<Currency> activeCurrency = Currency.create('USD', 0).obs;
  // final Rx<Currency> activeCurrency = CommonCurrencies().usd.obs;

  // @override
  // void onInit() {
  //   CommonCurrencies().registerAll();
  //   super.onInit();
  // }
}
