import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get/get.dart';
import 'package:money2/money2.dart';
import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/localization.dart';
import 'package:prapare/models/fhir_questionnaire/survey/enums/item_type.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'answer_item_currency_controller.dart';
import 'answer_item_decimal.dart';
import 'answer_item_decimal_or_string_controller.dart';

class AnswerItemCurrency extends AnswerItemDecimal {
  const AnswerItemCurrency(
      {Key key,
      @required Question question,
      @required Answer answer,
      @required Rx<UserResponse> userResponse})
      : assert(question != null),
        assert(answer != null),
        assert(userResponse != null),
        super(
            key: key,
            question: question,
            answer: answer,
            userResponse: userResponse);

  @override
  Widget buildAnswer(BuildContext context) {
    return GetBuilder<AnswerItemCurrencyController>(
      init: AnswerItemCurrencyController(),
      tag: answer.code,
      initState: (_) {},
      builder: (_) => super.buildAnswer(context),
    );
  }

  @override
  Widget buildLeading(BuildContext context) {
    final AnswerItemCurrencyController currencyController =
        Get.find(tag: answer.code);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Obx(() => Text(currencyController.activeCurrency.value.symbol)),
    );
  }

  // @override
  // Widget buildTrailing(BuildContext context) {
  //   final AnswerItemCurrencyController currencyController =
  //       Get.find(tag: answer.code);

  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
  //     child: Row(
  //       children: [
  //         Text(currencyController.activeCurrency.value.code),
  //         const SizedBox(width: 16.0),
  //         IconButton(
  //           icon: const Icon(Icons.settings),
  //           onPressed: () {},
  //         )
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget buildTextFormField(BuildContext context) {
    final AnswerItemDecimalOrStringController controller =
        Get.find(tag: answer.code);
    final AnswerItemCurrencyController currencyController =
        Get.find(tag: answer.code);
    final labels = AppLocalizations.of(context);
    final bool _isAnswerAnInteger = answer.answerItemType == ItemType.integer;

    return TextFormField(
        inputFormatters: [
          MoneyInputFormatter(
            // leadingSymbol: MoneySymbols.DOLLAR_SIGN,
            mantissaLength: 0,
            useSymbolPadding: true,
          ),
        ],
        controller: controller.textEditingController,
        onChanged: (newValue) {
          controller.obj.value = newValue;
        },
        keyboardType:
            TextInputType.numberWithOptions(decimal: !_isAnswerAnInteger),
        style: context.textTheme.bodyText2.apply(
            decoration: controller.isQuestionDeclined().value
                ? TextDecoration.lineThrough
                : null),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labels.validation.instructions.number,
        ),
        validator: (String newValue) {
          // String message;
          // Money money;
          // if (newValue == '0') {
          //   newValue = '';
          //   controller.textEditingController.text = '';
          // }
          // print(newValue);
          // try {
          //   money = Money.parse(
          //       newValue, currencyController.activeCurrency.value,
          //       pattern: '0');
          // } catch (error) {
          //   message = error;
          // }
          // print('');
          // return ValidatorsUtil().isNewAnswerValueValid(newValue, answer)
          //     ? null
          //     : labels.validation.error;
          return null;
        });
  }
}
