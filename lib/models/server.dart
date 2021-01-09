import 'package:fhir_auth/fhir_auth.dart';

class Server {
  final List<String> resourcesToUpload = [
    'QuestionnaireResponse',
    'Condition',
    'Observation',
  ];

  final clinicalScopes = [
    ClinicalScope.r4(
      role: Role.patient,
      type: R4Types.patient,
      interaction: Interaction.any,
    ),
    ClinicalScope.r4(
      role: Role.patient,
      type: R4Types.questionnaire,
      interaction: Interaction.any,
    ),
    ClinicalScope.r4(
      role: Role.patient,
      type: R4Types.questionnaireresponse,
      interaction: Interaction.any,
    ),
    ClinicalScope.r4(
      role: Role.patient,
      type: R4Types.condition,
      interaction: Interaction.any,
    ),
    ClinicalScope.r4(
      role: Role.patient,
      type: R4Types.observation,
      interaction: Interaction.any,
    ),
    ClinicalScope.r4(
      role: Role.patient,
      type: R4Types.bundle,
      interaction: Interaction.any,
    ),
  ];
}
