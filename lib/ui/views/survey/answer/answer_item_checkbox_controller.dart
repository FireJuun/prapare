import 'package:get/get.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class AnswerItemCheckboxController extends GetxController {
  final Rx<UserResponse> _rxUserResponse = UserResponse().obs;
  UserResponse get rxUserResponse => _rxUserResponse.value;
  set rxUserResponse(UserResponse value) => _rxUserResponse.value = value;
}
