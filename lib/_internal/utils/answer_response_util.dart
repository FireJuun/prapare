import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/models/fhir_questionnaire/survey/enums/qformat.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/models/fhir_questionnaire/survey/enums/item_type.dart';
import 'package:prapare/ui/views/survey/answer/answer_item_checkbox_controller.dart';
import 'package:prapare/ui/views/survey/answer/answer_item_decimal_or_string_controller.dart';
import 'package:prapare/ui/views/survey/question/question_item_radio_button_controller.dart';
import 'package:validators/validators.dart' as validate;
import 'package:validators/sanitizers.dart' as sanitize;

class AnswerResponseUtil {
  AnswerResponse getAnswerResponseFromItemType(
          Rx<UserResponse> userResponse, Answer answer) =>
      userResponse.value.answers.firstWhere(
          (element) => element.responseItemType == answer.answerItemType,
          orElse: () => newAnswerResponseFromAnswerAndValue(
              answer: answer, newValue: ''));

  void setAnswerResponseValue(
          AnswerResponse answerResponse, dynamic newValue) =>
      answerResponse.value = newValue;

  AnswerResponse newAnswerResponseFromAnswerAndValue(
      {@required Answer answer, @required String newValue}) {
    switch (answer.answerItemType) {
      case ItemType.choice:
        {
          if (newValue != answer.code) {
            print('error: $newValue != ${answer.code}');
          }
          // should this just be answer.code or newValue?
          // technically, they should be the same
          return AnswerCode(answer.code);
        }
      case ItemType.open_choice:
        return AnswerOther(answer.code, newValue);
      case ItemType.boolean:
        {
          if (newValue == 'true') {
            return AnswerBoolean(answer.code, true);
          } else if (newValue == 'false') {
            return AnswerBoolean(answer.code, false);
          }
          return AnswerBoolean(answer.code, null);
        }
      case ItemType.decimal:
        {
          if (validate.isFloat(newValue)) {
            return AnswerDecimal(sanitize.toDouble(newValue));
          }
          return AnswerDecimal(null);
        }
        break;
      case ItemType.integer:
        {
          if (validate.isInt(newValue)) {
            return AnswerInteger(sanitize.toInt(newValue));
          }
          return AnswerInteger(null);
        }

      case ItemType.string:
        return AnswerString(newValue);

      case ItemType.text:
        return AnswerText(newValue);

      default:
        return AnswerString('');
    }
  }

  void _findAndResetAnswerItemCheckboxController(String answerCode) {
    final _ctrl = Get.find<AnswerItemCheckboxController>(tag: answerCode);
    if (_ctrl != null) {
      _ctrl.isSelected.value = false;
    }
  }

  void _findAndResetAnswerItemDecimalOrStringController(String answerCode) {
    final _ctrl =
        Get.find<AnswerItemDecimalOrStringController>(tag: answerCode);
    if (_ctrl != null) {
      _ctrl.obj.value = '';
      _ctrl.textEditingController.text = '';
    }
  }

  void findAndResetQuestionItemRadioButtonController(
      Rx<UserResponse> userResponse) {
    final _ctrl = Get.find<QuestionItemRadioButtonController>(
        tag: userResponse.value.questionLinkId);
    if (_ctrl != null) {
      _ctrl.activeCode.value = '';
    }
  }

  void clearUserResponse(
      {@required Answer answer,
      @required Rx<UserResponse> userResponse,
      @required QFormat qFormat,
      bool resetDecimalOrStringController = true}) {
    if (userResponse.value.answers != null) {
      switch (answer.answerItemType) {
        // checkboxes and radio buttons remove relevant item
        case ItemType.open_choice:
          {
            userResponse.value.answers.removeWhere(
                (ansResp) => (ansResp as AnswerOther).value == answer.code);
            // todo: when open choice is implemented, will need to reset its TextEditingController
            // checkboxes reset their controller's state
            if (qFormat == QFormat.check_box) {
              _findAndResetAnswerItemCheckboxController(answer.code);
            }
            return;
          }
        case ItemType.choice:
          {
            userResponse.value.answers.removeWhere(
                (ansResp) => (ansResp as AnswerCode).value == answer.code);
            // checkboxes reset their controller's state
            if (qFormat == QFormat.check_box) {
              _findAndResetAnswerItemCheckboxController(answer.code);
            }
            return;
          }

        // booleans, decimals, integers go back to null
        // decimals, integers also clear their controller
        case ItemType.boolean:
          {
            // find response
            final _ansResp = userResponse.value.answers.firstWhere(
              (ansResp) => (ansResp as AnswerBoolean).code == answer.code,
              orElse: () => AnswerBoolean('', null),
            );
            // reset values
            _ansResp.value = null;
            return;
          }
        case ItemType.decimal:
          {
            // find response
            final _ansResp = userResponse.value.answers.firstWhere(
              (ansResp) => ansResp is AnswerDecimal,
              orElse: () => AnswerDecimal(null),
            );
            // reset values
            _ansResp.value = null;
            if (resetDecimalOrStringController) {
              _findAndResetAnswerItemDecimalOrStringController(answer.code);
            }
            return;
          }
        case ItemType.integer:
          {
            // find response
            final _ansResp = userResponse.value.answers.firstWhere(
              (ansResp) => ansResp is AnswerInteger,
              orElse: () => AnswerInteger(null),
            );
            // reset values
            _ansResp.value = null;
            if (resetDecimalOrStringController) {
              _findAndResetAnswerItemDecimalOrStringController(answer.code);
            }
            return;
          }

        // strings, text go back to ''
        // strings, text also clear their controller
        case ItemType.string:
          {
            // find response
            final _ansResp = userResponse.value.answers.firstWhere(
              (ansResp) => ansResp is AnswerString,
              orElse: () => AnswerString(''),
            );
            // reset values
            _ansResp.value = '';
            if (resetDecimalOrStringController) {
              _findAndResetAnswerItemDecimalOrStringController(answer.code);
            }
            return;
          }
        case ItemType.text:
          {
            // find response
            final _ansResp = userResponse.value.answers.firstWhere(
              (ansResp) => ansResp is AnswerText,
              orElse: () => AnswerText(''),
            );
            // reset values
            _ansResp.value = '';
            if (resetDecimalOrStringController) {
              _findAndResetAnswerItemDecimalOrStringController(answer.code);
            }
            return;
          }

        default:
          return;
      }
    }
  }
}
