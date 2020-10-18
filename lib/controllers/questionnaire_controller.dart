import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/models/fhir_model.dart';

class QuestionnaireController extends GetxController {
  final FhirModel model;
  QuestionnaireController({@required this.model}) : assert(model != null);
}
