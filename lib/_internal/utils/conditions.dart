import 'package:fhir/r4.dart';
import 'package:prapare/_internal/constants/snomed_enum.dart';

Condition getCondition(SNOMED snomed, Id id) => Condition(
      subject: Reference(reference: 'Patient/$id'),
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
      code: sdohConcept[snomed],
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

final sdohConcept = {
  SNOMED.homeless: CodeableConcept(
    coding: [
      Coding(
        system: FhirUri('http://snomed.info/sct'),
        code: Code('32911000'),
        display: 'Homeless',
      ),
    ],
    text: 'Homeless (finding)',
  ),
  SNOMED.unemployed: CodeableConcept(
    coding: [
      Coding(
        system: FhirUri('http://snomed.info/sct'),
        code: Code('73438004'),
        display: 'Without employment',
      ),
    ],
    text: 'Unemployed (finding)',
  ),
  SNOMED.food_insecurity: CodeableConcept(
    coding: [
      Coding(
        system: FhirUri('http://snomed.info/sct'),
        code: Code('733423003'),
        display: 'Food insecurity',
      ),
    ],
    text: 'Food insecurity (finding)',
  ),
};
