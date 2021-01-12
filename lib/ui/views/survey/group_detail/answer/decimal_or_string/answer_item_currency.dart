import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get/get.dart';
import 'package:money2/money2.dart';
import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/ui/localization.dart';
import 'package:prapare/_internal/enums/item_type_enum.dart';
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
    // this controller would be useful if we plan to use different currency types
    final AnswerItemCurrencyController currencyController =
        Get.find(tag: answer.code);
    final labels = AppLocalizations.of(context);
    final bool _isAnswerAnInteger = answer.answerItemType == ItemType.integer;

    return TextFormField(
      inputFormatters: [
        MoneyInputFormatter(
          // since cents aren't being used here, we will add them later to the USD validation step
          mantissaLength: 0,
          // leadingSymbol: MoneySymbols.DOLLAR_SIGN,
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
        // todo: make validatorMessage nullable, when feature is enabled
        String validatorMessage;

        /// On repeatedly pressing back, MoneyInputFormatter defaults to $0 instead of null
        /// This changes the cursors location, which is a poor user experience
        /// Our workaround: if a 0 is added to a blank line, it is cleared back to null
        if (newValue == '0') {
          newValue = '';
          controller.textEditingController.text = '';
          validatorMessage = null;
        } else {
          // temporary workaround, specific to USD and without .00 being stored
          validatorMessage = ValidatorsUtil().isValidCurrency(
                  r'$' + newValue + '.00',
                  currencyController.activeCurrency.value)
              ? null
              : labels.validation.error;
        }

        print('newValue: $newValue');
        return validatorMessage;
      },
    );
  }
}
