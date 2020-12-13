import 'package:fhir/r4.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/models/fhir_questionnaire/survey/enums/item_type.dart';
import 'package:prapare/models/fhir_questionnaire/survey/enums/qformat.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/ui/views/survey/answer/answer_item_checkbox_controller.dart';
import 'package:prapare/ui/views/survey/answer/answer_item_decimal_or_string_controller.dart';
import 'package:prapare/ui/views/survey/question/question_item_radio_button_controller.dart';

class UserResponseUtil {
  Rx<UserResponse> createBlankUserResponseByQuestionType(Question q) {
    switch (q.itemType) {

      /// Choice and Open-Choice use the AnswerList to provide all positive values
      /// All negative/false values are removed from this list
      /// Thus, these questions begin with a blank list
      case QuestionnaireItemType.choice:
      case QuestionnaireItemType.open_choice:
        return UserResponse(questionLinkId: q.linkId, answers: []).obs;

      /// For now, I'm setting the default boolean UserResponse to null
      /// It is possible to have 3-phase boolean responses (true / false / null), which we want to handle
      case QuestionnaireItemType.boolean:
        return UserResponse(
            questionLinkId: q.linkId,
            answers: [AnswerBoolean(q.linkId, null)]).obs;

      /// Decimals / Integers handled similarly to Question Mapping above, w/ default nulls
      case QuestionnaireItemType.decimal:
        return UserResponse(
            questionLinkId: q.linkId, answers: [AnswerDecimal(null)]).obs;
      case QuestionnaireItemType.integer:
        return UserResponse(
            questionLinkId: q.linkId, answers: [AnswerInteger(null)]).obs;

      /// Strings / text handled similarly to Question Mapping above, w/ default ''
      case QuestionnaireItemType.string:
        return UserResponse(
            questionLinkId: q.linkId, answers: [AnswerString('')]).obs;
      case QuestionnaireItemType.text:
        return UserResponse(questionLinkId: q.linkId, answers: [AnswerText('')])
            .obs;

      // todo: handle datetimes and other item types
      default:
        return UserResponse(
            questionLinkId: q.linkId, answers: [AnswerString('')]).obs;
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
