import 'package:fhir/r4.dart';
import 'package:prapare/_internal/enums/sdoh_factor_enum.dart';

class ConditionUtil {
  Condition fhirCondition(SDOH_FACTOR factor, Id patientId) => Condition(
        subject: Reference(reference: 'Patient/$patientId'),
        clinicalStatus: CodeableConcept(
          coding: [
            Coding(
              system: FhirUri(
                  'http://terminology.hl7.org/CodeSystem/condition-clinical'),
              code: Code('active'),
              display: 'Active',
            ),
          ],
        ),
        verificationStatus: CodeableConcept(
          coding: [
            Coding(
                system: FhirUri(
                    'http://terminology.hl7.org/CodeSystem/condition-ver-status'),
                code: Code('confirmed'),
                display: 'Confirmed')
          ],
        ),
        category: [
          CodeableConcept(
            coding: [
              Coding(
                system: FhirUri(
                    'http://hl7.org/fhir/us/core/CodeSystem/condition-category'),
                code: Code('health-concern'),
              )
            ],
          )
        ],
        code: _sdohFactorToCodeableConceptMap[factor],
        onsetPeriod: Period(
          start: FhirDateTime(
            DateTime(
              DateTime.now().year - 1,
              DateTime.now().month,
              DateTime.now().day,
            ),
          ),
        ),
      );

  final Map<SDOH_FACTOR, CodeableConcept> _sdohFactorToCodeableConceptMap = {
    SDOH_FACTOR.homeless: CodeableConcept(
      coding: [
        Coding(
          system: FhirUri('http://factor.info/sct'),
          code: Code('32911000'),
          display: 'Homeless',
        ),
      ],
      text: 'Homeless (finding)',
    ),
    SDOH_FACTOR.unemployed: CodeableConcept(
      coding: [
        Coding(
          system: FhirUri('http://factor.info/sct'),
          code: Code('73438004'),
          display: 'Without employment',
        ),
      ],
      text: 'Unemployed (finding)',
    ),
    SDOH_FACTOR.food_insecurity: CodeableConcept(
      coding: [
        Coding(
          system: FhirUri('http://factor.info/sct'),
          code: Code('733423003'),
          display: 'Food insecurity',
        ),
      ],
      text: 'Food insecurity (finding)',
    ),
  };
}
