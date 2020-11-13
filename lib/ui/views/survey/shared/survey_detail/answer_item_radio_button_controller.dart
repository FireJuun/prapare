import 'package:get/get.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class AnswerItemRadioButtonController extends GetxController {
  final Rx<UserResponse> _rxUserResponse = UserResponse().obs;
  UserResponse get rxUserResponse => _rxUserResponse.value;
  set rxUserResponse(UserResponse value) => _rxUserResponse.value = value;

  final Rx<UserResponse> _rxActiveResponse = UserResponse().obs;
  UserResponse get rxActiveResponse => _rxActiveResponse.value;
  set rxActiveResponse(UserResponse value) => _rxActiveResponse.value = value;
}
