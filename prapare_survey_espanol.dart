const prapareSurveyEspanol = {
  "subjectType": ["Patient"],
  "status": "draft",
  "name": "SDOHCC_Questionnaire_PRAPARE_1",
  "title": "SDOHCC Questionnaire PRAPARE 1",
  "resourceType": "Questionnaire",
  "extension": [
    {
      "url":
          "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-targetStructureMap",
      "valueCanonical":
          "http://hl7.org/fhir/us/sdoh-cc/StructureMap/SDOHCC-StructureMap-HungerVitalSignMapper-1"
    }
  ],
  "meta": {
    "profile": [
      "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire|2.7"
    ],
    "tag": [
      {"code": "lformsVersion: 25.1.3"}
    ]
  },
  "item": [
    {
      "type": "group",
      "code": [
        {
          "code": "Modified_93025-5",
          "display":
              "Protocol for Responding to and Assessing Patients' Assets, Risks, and Experiences [PRAPARE] - Protocolo para responder y evaluar los recursos, riesgos y experiencias de los pacientes",
          "system": "http://loinc.org/modified"
        }
      ],
      "required": false,
      "linkId": "/93025-5",
      "text":
          "Protocol for Responding to and Assessing Patients' Assets, Risks, and Experiences [PRAPARE] - Protocolo para responder y evaluar los recursos, riesgos y experiencias de los pacientes",
      "item": [
        {
          "type": "group",
          "code": [
            {
              "code": "Modified_93043-8",
              "display": "Características personales",
              "system": "http://loinc.org/modified"
            }
          ],
          "required": false,
          "linkId": "/93043-8",
          "text": "Características personales",
          "item": [
            {
              "type": "choice",
              "code": [
                {
                  "code": "56051-6",
                  "display": "¿Es usted hispano o latino?",
                  "system": "http://loinc.org"
                }
              ],
              "extension": [
                {
                  "url":
                      "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl",
                  "valueCodeableConcept": {
                    "coding": [
                      {
                        "system":
                            "http://hl7.org/fhir/questionnaire-item-control",
                        "code": "drop-down",
                        "display": "Drop down"
                      }
                    ],
                    "text": "Drop down"
                  }
                }
              ],
              "required": false,
              "linkId": "/93043-8/56051-6",
              "text": "¿Es usted hispano o latino?",
              "answerOption": [
                {
                  "extension": [
                    {
                      "url":
                          "http://hl7.org/fhir/StructureDefinition/questionnaire-optionPrefix",
                      "valueString": "1"
                    }
                  ],
                  "valueCoding": {
                    "code": "LA33-6",
                    "display": "Sí",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "extension": [
                    {
                      "url":
                          "http://hl7.org/fhir/StructureDefinition/questionnaire-optionPrefix",
                      "valueString": "2"
                    }
                  ],
                  "valueCoding": {"code": "LA32-8", "display": "No"}
                },
                {
                  "extension": [
                    {
                      "url":
                          "http://hl7.org/fhir/StructureDefinition/questionnaire-optionPrefix",
                      "valueString": "3"
                    }
                  ],
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "Prefiero no responder a esta pregunta"
                  }
                }
              ]
            },
            {
              "type": "choice",
              "code": [
                {
                  "code": "Modified_32624-9",
                  "display":
                      "¿Cuál es su raza? Marque todas las que correspondan.",
                  //todo: needs to be multiple choice
                  "system": "http://loinc.org/modified"
                }
              ],
              "extension": [
                {
                  "url":
                      "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl",
                  "valueCodeableConcept": {
                    "coding": [
                      {
                        "system":
                            "http://hl7.org/fhir/questionnaire-item-control",
                        "code": "drop-down",
                        "display": "Drop down"
                      }
                    ],
                    "text": "Drop down"
                  }
                }
              ],
              "required": false,
              "repeats": true,
              "linkId": "/93043-8/32624-9",
              "text": "¿Cuál es su raza? Marque todas las que correspondan.",
              //todo this needs to be a "choose all that apply" item
              //todo "other" needs to be a textformfield
              "answerOption": [
                {
                  "valueCoding": {"code": "LA6156-9", "display": "Asian"}
                },
                {
                  "valueCoding": {
                    "code": "LA14045-1",
                    "display": "Nativo de Hawái"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30187-1",
                    "display": "Residente de las Islas del Pacífico"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA14042-8",
                    "display": "Negro/afroamericano"
                  }
                },
                {
                  "valueCoding": {"code": "LA4457-3", "display": "Blanco"}
                },
                {
                  "valueCoding": {
                    "code": "LA4-4",
                    "display": "Indígena de los Estados Unidos/nativo de Alaska"
                  }
                },
                {
                  "valueCoding": {"code": "LA46-8", "display": "Otra"}
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "Prefiero no responder a esta pregunta"
                  }
                }
              ]
            },
            {
              "type": "choice",
              "code": [
                {
                  "code": "93035-4",
                  "display":
                      "En algún momento de los últimos 2 años, ¿ha sido el trabajo agrícola el ingreso principal de su familia?",
                  "system": "http://loinc.org"
                }
              ],
              "extension": [
                {
                  "url":
                      "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl",
                  "valueCodeableConcept": {
                    "coding": [
                      {
                        "system":
                            "http://hl7.org/fhir/questionnaire-item-control",
                        "code": "drop-down",
                        "display": "Drop down"
                      }
                    ],
                    "text": "Drop down"
                  }
                }
              ],
              "required": false,
              "linkId": "/93043-8/93035-4",
              "text":
                  "En algún momento de los últimos 2 años, ¿ha sido el trabajo agrícola el ingreso principal de su familia?",
              "answerOption": [
                {
                  "valueCoding": {"code": "LA33-6", "display": "Sí"}
                },
                {
                  "valueCoding": {"code": "LA32-8", "display": "No"}
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "Prefiero no responder a esta pregunta"
                  }
                }
              ]
            },
            {
              "type": "choice",
              "code": [
                {
                  "code": "93034-7",
                  "display":
                      "¿Ha servido en las fuerzas armadas de los Estados Unidos?",
                  //interestingly, this translates to "have you served in the armed forces of the US",
                  //rather than the original english version "have you been *discharged* from the armed forces"
                  "system": "http://loinc.org"
                }
              ],
              "extension": [
                {
                  "url":
                      "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl",
                  "valueCodeableConcept": {
                    "coding": [
                      {
                        "system":
                            "http://hl7.org/fhir/questionnaire-item-control",
                        "code": "drop-down",
                        "display": "Drop down"
                      }
                    ],
                    "text": "Drop down"
                  }
                }
              ],
              "required": false,
              "linkId": "/93043-8/93034-7",
              "text":
                  "¿Ha servido en las fuerzas armadas de los Estados Unidos?",
              "answerOption": [
                {
                  "valueCoding": {"code": "LA33-6", "display": "Sí"}
                },
                {
                  "valueCoding": {"code": "LA32-8", "display": "No"}
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "Prefiero no responder a esta pregunta"
                  }
                }
              ]
            },
            {
              "type": "choice",
              "code": [
                {
                  "code": "54899-0",
                  "display": "¿Qué idioma se siente más cómodo hablando?",
                  "system": "http://loinc.org"
                }
              ],
              "extension": [
                {
                  "url":
                      "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl",
                  "valueCodeableConcept": {
                    "coding": [
                      {
                        "system":
                            "http://hl7.org/fhir/questionnaire-item-control",
                        "code": "drop-down",
                        "display": "Drop down"
                      }
                    ],
                    "text": "Drop down"
                  }
                }
              ],
              "required": false,
              "linkId": "/93043-8/54899-0",
              "text": "¿Qué idioma se siente más cómodo hablando?",
              "answerOption": [
                {
                  "valueCoding": {"code": "LA43-5", "display": "Inglés"}
                },
                {
                  "valueCoding": {
                    "code": "LA30188-9",
                    "display":
                        "Otro idioma distinto al inglés (por favor, escríbalo)"
                    //todo this needs to be a fillable textformfield
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "Prefiero no responder a esta pregunta"
                  }
                }
              ]
            }
          ]
        },
        {
          "type": "group",
          "code": [
            {
              "code": "93042-0",
              "display": "Familia y hogar",
              "system": "http://loinc.org"
            }
          ],
          "required": false,
          "linkId": "/93042-0",
          "text": "Familia y hogar",
          "item": [
            {
              "type": "decimal",
              "code": [
                {
                  "code": "63512-8",
                  "display":
                      "¿Cuántos miembros de su familia viven con usted? (usted incluido)",
                  //todo this question is not displayed - why? because it's not a radio button question perhaps?
                  //todo will also need a "Prefiero no responder a esta pregunta" option
                  "system": "http://loinc.org"
                }
              ],
              "extension": [
                {
                  "url":
                      "http://hl7.org/fhir/StructureDefinition/questionnaire-unit",
                  "valueCoding": {"display": "{#}"}
                }
              ],
              "required": false,
              "linkId": "/93042-0/63512-8",
              "text":
                  "¿Cuántos miembros de su familia viven con usted? (usted incluido)"
            },
            {
              "type": "choice",
              "code": [
                {
                  "code": "71802-3",
                  "display": "¿Cuál es su situación actual de vivienda?",
                  "system": "http://loinc.org"
                }
              ],
              "extension": [
                {
                  "url":
                      "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl",
                  "valueCodeableConcept": {
                    "coding": [
                      {
                        "system":
                            "http://hl7.org/fhir/questionnaire-item-control",
                        "code": "drop-down",
                        "display": "Drop down"
                      }
                    ],
                    "text": "Drop down"
                  }
                }
              ],
              "required": false,
              "linkId": "/93042-0/71802-3",
              "text": "¿Cuál es su situación actual de vivienda?",
              "answerOption": [
                {
                  "valueCoding": {
                    "code": "LA30189-7",
                    "display": "Tengo vivienda"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30190-5",
                    "display":
                        "No tengo vivienda (vivo con otras personas, en un hotel, en un albergue, vivo en la calle, en una playa, en un automóvil o en un parque)"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "Prefiero no responder a esta pregunta"
                  }
                }
              ],
              "item": [
                {
                  "text": "Describes patients living arrangement",
                  "type": "display",
                  "linkId": "/93042-0/71802-3-help",
                  "extension": [
                    {
                      "url":
                          "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl",
                      "valueCodeableConcept": {
                        "text": "Help-Button",
                        "coding": [
                          {
                            "code": "help",
                            "display": "Help-Button",
                            "system":
                                "http://hl7.org/fhir/questionnaire-item-control"
                          }
                        ]
                      }
                    }
                  ]
                }
              ]
            },
            {
              "type": "choice",
              "code": [
                {
                  "code": "93033-9",
                  "display": "¿Le preocupa poder perder su vivienda?",
                  "system": "http://loinc.org"
                }
              ],
              "extension": [
                {
                  "url":
                      "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl",
                  "valueCodeableConcept": {
                    "coding": [
                      {
                        "system":
                            "http://hl7.org/fhir/questionnaire-item-control",
                        "code": "drop-down",
                        "display": "Drop down"
                      }
                    ],
                    "text": "Drop down"
                  }
                }
              ],
              "required": false,
              "linkId": "/93042-0/93033-9",
              "text": "¿Le preocupa poder perder su vivienda?",
              "answerOption": [
                {
                  "valueCoding": {"code": "LA33-6", "display": "Sí"}
                },
                {
                  "valueCoding": {"code": "LA32-8", "display": "No"}
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "Prefiero no responder a esta pregunta"
                  }
                }
              ]
            },
            {
              "type": "string",
              "code": [
                {
                  "code": "56799-0",
                  "display": "Address",
                  "system": "http://loinc.org"
                }
              ],
              "required": false,
              "linkId": "/93042-0/56799-0",
              "text":
                  "¿Cuál es su dirección? (Calle, ciudad, estado, código postal)"
              //todo this does not display either
            }
          ]
        },
        {
          "type": "group",
          "code": [
            {
              "code": "93041-2",
              "display": "Dinero y recursos",
              "system": "http://loinc.org"
            }
          ],
          "required": false,
          "linkId": "/93041-2",
          "text": "Dinero y recursos",
          "item": [
            {
              "type": "choice",
              "code": [
                {
                  "code": "82589-3",
                  "display":
                      "¿Cuál es el nivel de escuela más alto que ha completado?",
                  "system": "http://loinc.org"
                }
              ],
              "extension": [
                {
                  "url":
                      "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl",
                  "valueCodeableConcept": {
                    "coding": [
                      {
                        "system":
                            "http://hl7.org/fhir/questionnaire-item-control",
                        "code": "drop-down",
                        "display": "Drop down"
                      }
                    ],
                    "text": "Drop down"
                  }
                }
              ],
              "required": false,
              "linkId": "/93041-2/82589-3",
              "text":
                  "¿Cuál es el nivel de escuela más alto que ha completado?",
              "answerOption": [
                {
                  "valueCoding": {
                    "code": "LA30191-3",
                    "display": "Preparatoria"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30192-1",
                    "display": "Escuela secundaria o GED"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30193-9",
                    "display": "Superior a escuela secundaria"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "Prefiero no responder a esta pregunta"
                  }
                }
              ]
            },
            {
              "type": "choice",
              "code": [
                {
                  "code": "67875-5",
                  "display": "¿Cuál es su situación de trabajo?",
                  "system": "http://loinc.org"
                }
              ],
              "extension": [
                {
                  "url":
                      "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl",
                  "valueCodeableConcept": {
                    "coding": [
                      {
                        "system":
                            "http://hl7.org/fhir/questionnaire-item-control",
                        "code": "drop-down",
                        "display": "Drop down"
                      }
                    ],
                    "text": "Drop down"
                  }
                }
              ],
              "required": false,
              "linkId": "/93041-2/67875-5",
              "text": "¿Cuál es su situación de trabajo?",
              "answerOption": [
                {
                  "valueCoding": {"code": "LA17956-6", "display": "Desempleado"}
                },
                {
                  "valueCoding": {
                    "code": "LA30138-4",
                    "display": "Trabajo de tiempo parcial o temporal"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30136-8",
                    "display": "Trabajo de tiempo completo"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30137-6",
                    "display":
                        "Desempleado pero no busca trabajo (p. ej., estudiante, jubilado, incapacitado, cuidador principal no remunerado). Por favor, escríbalo:"
                    //todo this needs to be a fillable textformfield
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "Prefiero no responder a esta pregunta"
                  }
                }
              ]
            },
            {
              "type": "choice",
              "code": [
                {
                  "code": "76437-3",
                  "display": "¿Cuál es su seguro médico principal?",
                  "system": "http://loinc.org"
                }
              ],
              "extension": [
                {
                  "url":
                      "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl",
                  "valueCodeableConcept": {
                    "coding": [
                      {
                        "system":
                            "http://hl7.org/fhir/questionnaire-item-control",
                        "code": "drop-down",
                        "display": "Drop down"
                      }
                    ],
                    "text": "Drop down"
                  }
                }
              ],
              "required": false,
              "linkId": "/93041-2/76437-3",
              "text": "¿Cuál es su seguro médico principal?",
              "answerOption": [
                {
                  "valueCoding": {
                    "code": "LA30194-7",
                    "display": "Ninguno/no asegurado"
                  }
                },
                {
                  "valueCoding": {"code": "LA17849-3", "display": "Medicaid"}
                },
                {
                  "valueCoding": {
                    "code": "LA30195-4",
                    "display": "CHIP Medicaid"
                  }
                },
                {
                  "valueCoding": {"code": "LA15652-3", "display": "Medicare"}
                },
                {
                  "valueCoding": {
                    "code": "LA30196-2",
                    "display": "Otro seguro público (no CHIP)"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30197-0",
                    "display": "Otro seguro público (CHIP)"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA6350-8",
                    "display": "Seguro privado"
                  }
                }
              ]
            },
            {
              "type": "decimal",
              "code": [
                {
                  "code": "63586-2",
                  "display":
                      "Durante el año pasado, ¿cuál fue el ingreso total combinado de usted y los miembros de su familia? Esta información nos ayudará a determinar si usted califica para algún beneficio.",
                  //todo this isn't displayed, also will need a prefers not to answer option
                  "system": "http://loinc.org"
                }
              ],
              "extension": [
                {
                  "url":
                      "http://hl7.org/fhir/StructureDefinition/questionnaire-unit",
                  "valueCoding": {"display": "/a"}
                }
              ],
              "required": false,
              "linkId": "/93041-2/63586-2",
              "text":
                  "Durante el año pasado, ¿cuál fue el ingreso total combinado de usted y los miembros de su familia? Esta información nos ayudará a determinar si usted califica para algún beneficio."
            },
            {
              "type": "choice",
              "code": [
                {
                  "code": "93031-3",
                  "display":
                      "Durante el último año, ¿usted o algún miembro de su familia tuvieron que dejar de comprar algo que realmente se necesitaba entre las siguientes opciones? Marque todas las que correspondan.",
                  "system": "http://loinc.org"
                }
              ],
              "extension": [
                {
                  "url":
                      "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl",
                  "valueCodeableConcept": {
                    "coding": [
                      {
                        "system":
                            "http://hl7.org/fhir/questionnaire-item-control",
                        "code": "drop-down",
                        "display": "Drop down"
                      }
                    ],
                    "text": "Drop down"
                  }
                }
              ],
              "required": false,
              "repeats": true,
              "linkId": "/93041-2/93031-3",
              "text":
                  "Durante el último año, ¿usted o algún miembro de su familia tuvieron que dejar de comprar algo que realmente se necesitaba entre las siguientes opciones? Marque todas las que correspondan.",
              //todo The original survey has each of these categories with a "yes" and a "no" option. we should consider doing the same. for people who don't want to answer each item here, leaving an item blank may not mean the same thing as answering "no"
              "answerOption": [
                {
                  "valueCoding": {"code": "LA30125-1", "display": "Alimentos"}
                },
                {
                  "valueCoding": {"code": "LA30126-9", "display": "Ropa"}
                },
                {
                  "valueCoding": {
                    "code": "LA30124-4",
                    "display": "Servicios públicos"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30127-7",
                    "display": "Cuidado infantil"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30128-5",
                    "display":
                        "Medicamentos o cualquier tipo de cuidado de la salud (médico, dental, mental, oftalmológico)"
                  }
                },
                {
                  "valueCoding": {"code": "LA30129-3", "display": "Teléfono"}
                },
                {
                  "valueCoding": {"code": "LA46-8", "display": "Otra"}
                  //todo other should be a fillable form field
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "Prefiero no responder a esta pregunta"
                  }
                }
              ]
            },
            {
              "type": "choice",
              "code": [
                {
                  "code": "93030-5",
                  "display":
                      "¿La falta de transporte le ha impedido acudir a consultas médicas, reuniones, al trabajo o conseguir cosas necesarias para la vida cotidiana? Marque todas las que correspondan.",
                  "system": "http://loinc.org"
                }
              ],
              "extension": [
                {
                  "url":
                      "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl",
                  "valueCodeableConcept": {
                    "coding": [
                      {
                        "system":
                            "http://hl7.org/fhir/questionnaire-item-control",
                        "code": "drop-down",
                        "display": "Drop down"
                      }
                    ],
                    "text": "Drop down"
                  }
                }
              ],
              "required": false,
              "linkId": "/93041-2/93030-5",
              "text":
                  "¿La falta de transporte le ha impedido acudir a consultas médicas, reuniones, al trabajo o conseguir cosas necesarias para la vida cotidiana? Marque todas las que correspondan.",
              "answerOption": [
                {
                  "extension": [
                    {
                      "url":
                          "http://hl7.org/fhir/StructureDefinition/questionnaire-optionPrefix",
                      "valueString": "A"
                    }
                  ],
                  "valueCoding": {
                    "code": "LA30133-5",
                    "display":
                        "Sí, me ha impedido acudir a consultas médicas o a recoger mis medicamentos"
                  }
                },
                {
                  "extension": [
                    {
                      "url":
                          "http://hl7.org/fhir/StructureDefinition/questionnaire-optionPrefix",
                      "valueString": "B"
                    }
                  ],
                  "valueCoding": {
                    "code": "LA30134-3",
                    "display":
                        "Sí,  me ha impedido ir a reuniones o citas no médicas, al trabajo o conseguir cosas que necesito"
                  }
                },
                {
                  "extension": [
                    {
                      "url":
                          "http://hl7.org/fhir/StructureDefinition/questionnaire-optionPrefix",
                      "valueString": "C"
                    }
                  ],
                  "valueCoding": {"code": "LA32-8", "display": "No"}
                },
                {
                  "extension": [
                    {
                      "url":
                          "http://hl7.org/fhir/StructureDefinition/questionnaire-optionPrefix",
                      "valueString": "X"
                    }
                  ],
                  "valueCoding": {
                    "code": "LA30257-2",
                    "display": "Prefiero no responder a esta pregunta"
                  }
                }
              ]
            }
          ]
        },
        {
          "type": "group",
          "code": [
            {
              "code": "93040-4",
              "display": "Salud social y emocional",
              "system": "http://loinc.org"
            }
          ],
          "required": false,
          "linkId": "/93040-4",
          "text": "Salud social y emocional",
          "item": [
            {
              "type": "choice",
              "code": [
                {
                  "code": "93029-7",
                  "display":
                      "¿Con qué frecuencia ve o conversa con personas cercanas por las que se preocupa? (Por ejemplo: conversar con amigos por teléfono, visitar a amigos o familiares, asistir a la iglesia o a reuniones de club)",
                  "system": "http://loinc.org"
                }
              ],
              "extension": [
                {
                  "url":
                      "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl",
                  "valueCodeableConcept": {
                    "coding": [
                      {
                        "system":
                            "http://hl7.org/fhir/questionnaire-item-control",
                        "code": "drop-down",
                        "display": "Drop down"
                      }
                    ],
                    "text": "Drop down"
                  }
                }
              ],
              "required": false,
              "linkId": "/93040-4/93029-7",
              "text":
                  "¿Con qué frecuencia ve o conversa con personas cercanas por las que se preocupa? (Por ejemplo: conversar con amigos por teléfono, visitar a amigos o familiares, asistir a la iglesia o a reuniones de club)",
              "answerOption": [
                {
                  "valueCoding": {
                    "code": "LA27722-0",
                    "display": "Menos de una vez por semana"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30130-1",
                    "display": "1 o 2 veces por semana"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30131-9",
                    "display": "3 o 5 veces por semana"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30132-7",
                    "display": "5 o más veces por semana"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "Prefiero no responder a esta pregunta"
                  }
                }
              ]
            },
            {
              "type": "choice",
              "code": [
                {
                  "code": "93038-8",
                  "display":
                      "Estrés es cuando alguien se siente tenso, nervioso, ansioso o no puede dormir a la noche porque su mente está preocupada. ¿Que tan estresado se encuentra?",
                  "system": "http://loinc.org"
                }
              ],
              "extension": [
                {
                  "url":
                      "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl",
                  "valueCodeableConcept": {
                    "coding": [
                      {
                        "system":
                            "http://hl7.org/fhir/questionnaire-item-control",
                        "code": "drop-down",
                        "display": "Drop down"
                      }
                    ],
                    "text": "Drop down"
                  }
                }
              ],
              "required": false,
              "linkId": "/93040-4/93038-8",
              "text":
                  "Estrés es cuando alguien se siente tenso, nervioso, ansioso o no puede dormir a la noche porque su mente está preocupada. ¿Que tan estresado se encuentra?",
              "answerOption": [
                {
                  "valueCoding": {"code": "LA6568-5", "display": "Para nada"}
                },
                {
                  "valueCoding": {"code": "LA13863-8", "display": "Un poco"}
                },
                {
                  "valueCoding": {"code": "LA13909-9", "display": "Algo"}
                },
                {
                  "valueCoding": {"code": "LA13902-4", "display": "Bastante"}
                },
                {
                  "valueCoding": {"code": "LA13914-9", "display": "Mucho"}
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "Prefiero no responder a esta pregunta"
                  }
                }
              ]
            }
          ]
        },
        {
          "type": "group",
          "code": [
            {
              "code": "93039-6",
              "display": "Preguntas adicionales opcionales",
              "system": "http://loinc.org"
            }
          ],
          "required": false,
          "linkId": "/93039-6",
          "text": "Preguntas adicionales opcionales",
          "item": [
            {
              "type": "choice",
              "code": [
                {
                  "code": "93028-9",
                  "display":
                      "En el último año, ¿ha pasado más de 2 noches seguidas en una cárcel, prisión, centro de detención o centro correccional juvenil?",
                  "system": "http://loinc.org"
                }
              ],
              "extension": [
                {
                  "url":
                      "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl",
                  "valueCodeableConcept": {
                    "coding": [
                      {
                        "system":
                            "http://hl7.org/fhir/questionnaire-item-control",
                        "code": "drop-down",
                        "display": "Drop down"
                      }
                    ],
                    "text": "Drop down"
                  }
                }
              ],
              "required": false,
              "linkId": "/93039-6/93028-9",
              "text":
                  "En el último año, ¿ha pasado más de 2 noches seguidas en una cárcel, prisión, centro de detención o centro correccional juvenil?",
              "answerOption": [
                {
                  "valueCoding": {"code": "LA33-6", "display": "Sí"}
                },
                {
                  "valueCoding": {"code": "LA32-8", "display": "No"}
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "Prefiero no responder a esta pregunta"
                  }
                }
              ]
            },
            {
              "type": "choice",
              "code": [
                {
                  "code": "93027-1",
                  "display": "¿Es refugiado?",
                  "system": "http://loinc.org"
                }
              ],
              "extension": [
                {
                  "url":
                      "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl",
                  "valueCodeableConcept": {
                    "coding": [
                      {
                        "system":
                            "http://hl7.org/fhir/questionnaire-item-control",
                        "code": "drop-down",
                        "display": "Drop down"
                      }
                    ],
                    "text": "Drop down"
                  }
                }
              ],
              "required": false,
              "linkId": "/93039-6/93027-1",
              "text": "¿Es refugiado?",
              "answerOption": [
                {
                  "valueCoding": {"code": "LA33-6", "display": "Sí"}
                },
                {
                  "valueCoding": {"code": "LA32-8", "display": "No"}
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "Prefiero no responder a esta pregunta"
                  }
                }
              ]
            },
            {
              "type": "choice",
              "code": [
                {
                  "code": "93026-3",
                  "display":
                      "¿Se siente física o emocionalmente seguro en su actual lugar de residencia?",
                  "system": "http://loinc.org"
                }
              ],
              "extension": [
                {
                  "url":
                      "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl",
                  "valueCodeableConcept": {
                    "coding": [
                      {
                        "system":
                            "http://hl7.org/fhir/questionnaire-item-control",
                        "code": "drop-down",
                        "display": "Drop down"
                      }
                    ],
                    "text": "Drop down"
                  }
                }
              ],
              "required": false,
              "linkId": "/93039-6/93026-3",
              "text":
                  "¿Se siente física o emocionalmente seguro en su actual lugar de residencia?",
              "answerOption": [
                {
                  "valueCoding": {"code": "LA33-6", "display": "Sí"}
                },
                {
                  "valueCoding": {"code": "LA32-8", "display": "No"}
                },
                {
                  "valueCoding": {
                    "code": "LA14072-5",
                    "display": "No estoy seguro"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "Prefiero no responder a esta pregunta"
                  }
                }
              ]
            },
            {
              "type": "choice",
              "code": [
                {
                  "code": "76501-6",
                  "display":
                      "Durante el último año, ¿tuvo miedo de su pareja o expareja?",
                  "system": "http://loinc.org"
                }
              ],
              "extension": [
                {
                  "url":
                      "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl",
                  "valueCodeableConcept": {
                    "coding": [
                      {
                        "system":
                            "http://hl7.org/fhir/questionnaire-item-control",
                        "code": "drop-down",
                        "display": "Drop down"
                      }
                    ],
                    "text": "Drop down"
                  }
                }
              ],
              "required": false,
              "linkId": "/93039-6/76501-6",
              "text":
                  "Durante el último año, ¿tuvo miedo de su pareja o expareja?",
              "answerOption": [
                {
                  "extension": [
                    {
                      "url":
                          "http://hl7.org/fhir/StructureDefinition/questionnaire-optionPrefix",
                      "valueString": "1"
                    },
                    {
                      "url":
                          "http://hl7.org/fhir/StructureDefinition/ordinalValue",
                      "valueDecimal": 1
                    }
                  ],
                  "valueCoding": {"code": "LA33-6", "display": "Sí"}
                },
                {
                  "extension": [
                    {
                      "url":
                          "http://hl7.org/fhir/StructureDefinition/questionnaire-optionPrefix",
                      "valueString": "0"
                    },
                    {
                      "url":
                          "http://hl7.org/fhir/StructureDefinition/ordinalValue",
                      "valueDecimal": 0
                    }
                  ],
                  "valueCoding": {"code": "LA32-8", "display": "No"}

                  //todo add "Unsure" and "I have not had a partner in the past year"
                }
              ]
            }
          ]
        }
      ]
    }
  ]
};
