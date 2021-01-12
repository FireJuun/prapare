import 'package:fhir/r4.dart';
import 'package:prapare/_internal/enums/sdoh_factor_enum.dart';

class ObservationUtil {
  Observation fhirObservation(SDOH_FACTOR factor, Id patientId) => Observation(
        subject: Reference(reference: 'Patient/$patientId'),
        status: ObservationStatus.final_,
        category: [
          CodeableConcept(
            coding: [
              Coding(
                system: FhirUri(
                    'http://hl7.org/fhir/us/core/CodeSystem/condition-category'),
                code: Code('social-history'),
                display: 'Social History',
              )
            ],
          ),
          CodeableConcept(
            coding: [
              Coding(
                system: FhirUri(
                    'http://hl7.org/fhir/us/core/CodeSystem/condition-category'),
                code: Code('survey'),
                display: 'Survey',
              )
            ],
          ),
        ],
        code: _sdohStatusForFactorMap[factor],
        effectivePeriod: Period(
          start: FhirDateTime(
            DateTime(
              DateTime.now().year - 1,
              DateTime.now().month,
              DateTime.now().day,
            ),
          ),
        ),
        valueCodeableConcept: _sdohFactorToCodeableConceptMap[factor],
      );

  final Map<SDOH_FACTOR, CodeableConcept> _sdohFactorToCodeableConceptMap = {
    SDOH_FACTOR.homeless: CodeableConcept(
      coding: [
        Coding(
          system: FhirUri('http://loinc.org'),
          code: Code('LA30190-5'),
          display: 'I do not have housing (staying with others, in a hotel, in '
              'a shelter, living outside on the street, on a beach, in a car, or'
              ' in a park)',
        ),
      ],
      text:
          'I do not have housing (staying with others, in a hotel, in a shelter, '
          'living outside on the street, on a beach, in a car, or in a park)',
    ),
    SDOH_FACTOR.unemployed: CodeableConcept(
      coding: [
        Coding(
          system: FhirUri('http://loinc.org'),
          code: Code('LA17956-6'),
          display: 'Unemployed',
        ),
      ],
      text: 'Unemployed',
    ),
    SDOH_FACTOR.food_insecurity: CodeableConcept(
      coding: [
        Coding(
          system: FhirUri('http://loinc.org'),
          code: Code('LA19952-3'),
          display: 'At risk',
        ),
      ],
      text: 'Food insecurity risk [HVS]',
    ),
  };

  final Map<SDOH_FACTOR, CodeableConcept> _sdohStatusForFactorMap = {
    SDOH_FACTOR.homeless: CodeableConcept(
      coding: [
        Coding(
          system: FhirUri('http://loinc.org'),
          code: Code('71802-3'),
          display: 'Housing status',
        ),
      ],
      text: 'Housing status',
    ),
    SDOH_FACTOR.unemployed: CodeableConcept(
      coding: [
        Coding(
          system: FhirUri('http://loinc.org'),
          code: Code('67875-5'),
          display: 'Employment status - current',
        ),
      ],
      text: 'Employment status current',
    ),
    SDOH_FACTOR.food_insecurity: CodeableConcept(
      coding: [
        Coding(
          system: FhirUri('http://loinc.org'),
          code: Code('LA19952-3'),
          display: 'At risk',
        ),
      ],
      text: 'Food insecurity risk [HVS]',
    ),
  };
}
