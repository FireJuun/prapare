// ignore_for_file: prefer_single_quotes
const prapareSurvey = {
  "subjectType": ["Patient"],
  "status": "draft",
  "id": "PRAPARE-1.0",
  "name": "SDOHCC_Questionnaire_PRAPARE",
  "resourceType": "Questionnaire",
  // "meta": {
  //   "profile": [
  //     "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire|2.7"
  //   ],
  //   "tag": [
  //     {"code": "lformsVersion: 25.1.3"}
  //   ]
  // },
  "item": [
    {
      "type": "group",
      "code": [
        {
          "code": "93025-5",
          "display":
              "Protocol for Responding to and Assessing Patients' Assets, Risks, and Experiences [PRAPARE]",
          "system": "http://loinc.org"
        }
      ],
      "required": false,
      "linkId": "/93025-5",
      "text":
          "Protocol for Responding to and Assessing Patients' Assets, Risks, and Experiences [PRAPARE]",
      "item": [
        {
          "type": "group",
          "code": [
            {
              "code": "93043-8",
              "display": "Personal characteristics [PRAPARE]",
              "system": "http://loinc.org"
            }
          ],
          "required": false,
          "linkId": "/93043-8",
          "text": "Personal characteristics",
          "item": [
            {
              "type": "choice",
              "code": [
                {
                  "code": "56051-6",
                  "display": "Hispanic or Latino",
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
                        "code": "radio-button",
                        "display": "Radio button"
                      }
                    ],
                    "text": "Radio button"
                  }
                }
              ],
              "required": false,
              "linkId": "/93043-8/56051-6",
              "text": "Are you Hispanic or Latino?",
              "answerOption": [
                {
                  "valueCoding": {
                    "code": "LA33-6",
                    "display": "Yes",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA32-8",
                    "display": "No",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "I choose not to answer this question",
                    "system": "http://loinc.org"
                  }
                }
              ]
            },
            {
              "type": "choice",
              "code": [
                {
                  "code": "32624-9",
                  "display": "Race",
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
                        "code": "check-box",
                        "display": "Check-box"
                      }
                    ],
                    "text": "Check box"
                  }
                }
              ],
              "required": false,
              "repeats": true,
              "linkId": "/93043-8/32624-9",
              "text": "Which race(s) are you? Check all that apply.",
              "answerOption": [
                {
                  "valueCoding": {
                    "code": "LA6156-9",
                    "display": "Asian",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA14045-1",
                    "display": "Native Hawaiian",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30187-1",
                    "display": "Pacific Islander",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA14042-8",
                    "display": "Black/African American",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA4457-3",
                    "display": "White",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA4-4",
                    "display": "American Indian/Alaskan Native",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA46-8",
                    "display": "Other",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "I choose not to answer this question",
                    "system": "http://loinc.org"
                  }
                }
              ],
              "item": [
                {
                  "type": "string",
                  "required": false,
                  "linkId": "/93043-8/32624-9/LA46-8",
                  "text": "Please write",
                  "enableWhen": [
                    {
                      "answerCoding": {
                        "code": "LA46-8",
                        "display": "Other",
                        "system": "http://loinc.org"
                      },
                      "question": "/93043-8/32624-9",
                      "operator": "="
                    }
                  ],
                  "enableBehavior": "all"
                }
              ]
            },
            {
              "type": "choice",
              "code": [
                {
                  "code": "93035-4",
                  "display":
                      "Has season or migrant farm work been your or your family's main source of income at any point in past 2 years [PRAPARE]",
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
                        "code": "radio-button",
                        "display": "Radio button"
                      }
                    ],
                    "text": "Radio button"
                  }
                }
              ],
              "required": false,
              "linkId": "/93043-8/93035-4",
              "text":
                  "At any point in the past 2 years, has season or migrant farm work been your or your family's main source of income?",
              "answerOption": [
                {
                  "valueCoding": {
                    "code": "LA33-6",
                    "display": "Yes",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA32-8",
                    "display": "No",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "I choose not to answer this question",
                    "system": "http://loinc.org"
                  }
                }
              ]
            },
            {
              "type": "choice",
              "code": [
                {
                  "code": "93034-7",
                  "display": "Discharged from the U.S. Armed Forces",
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
                        "code": "radio-button",
                        "display": "Radio button"
                      }
                    ],
                    "text": "Radio button"
                  }
                }
              ],
              "required": false,
              "linkId": "/93043-8/93034-7",
              "text":
                  "Have you been discharged from the armed forces of the United States?",
              "answerOption": [
                {
                  "valueCoding": {
                    "code": "LA33-6",
                    "display": "Yes",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA32-8",
                    "display": "No",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "I choose not to answer this question",
                    "system": "http://loinc.org"
                  }
                }
              ]
            },
            {
              "type": "string",
              "code": [
                {
                  "code": "54899-0",
                  "display": "Preferred language",
                  "system": "http://loinc.org"
                }
              ],
              "required": false,
              "linkId": "/93043-8/54899-0",
              "text": "What language are you most comfortable speaking?",
              "item": [
                {
                  "type": "boolean",
                  "linkId": "/93043-8/54899-0/LA30122-8",
                  "code": [
                    {
                      "code": "LA30122-8",
                      "display": "I choose not to answer this question",
                      "system": "http://loinc.org"
                    }
                  ],
                  "text": "I choose not to answer this question"
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
              "display": "Family and home [PRAPARE]",
              "system": "http://loinc.org"
            }
          ],
          "required": false,
          "linkId": "/93042-0",
          "text": "Family and home",
          "item": [
            {
              "type": "integer",
              "code": [
                {
                  "code": "63512-8",
                  "display":
                      "How many people are living or staying at this address [#]",
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
                  "How many family members, including yourself, do you currently live with?",
              "item": [
                {
                  "type": "boolean",
                  "linkId": "/93042-0/63512-8/LA30122-8",
                  "code": [
                    {
                      "code": "LA30122-8",
                      "display": "I choose not to answer this question",
                      "system": "http://loinc.org"
                    }
                  ],
                  "text": "I choose not to answer this question"
                }
              ]
            },
            {
              "type": "choice",
              "code": [
                {
                  "code": "71802-3",
                  "display": "Housing status",
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
                        "code": "radio-button",
                        "display": "Radio button"
                      }
                    ],
                    "text": "Radio button"
                  }
                }
              ],
              "required": false,
              "linkId": "/93042-0/71802-3",
              "text": "What is your housing situation today?",
              "answerOption": [
                {
                  "valueCoding": {
                    "code": "LA30189-7",
                    "display": "I have housing",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30190-5",
                    "display":
                        "I do not have housing (staying with others, in a hotel, in a shelter, living outside on the street, on a beach, in a car, or in a park)",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "I choose not to answer this question",
                    "system": "http://loinc.org"
                  }
                }
              ]
            },
            {
              "type": "choice",
              "code": [
                {
                  "code": "93033-9",
                  "display":
                      "Are you worried about losing your housing [PRAPARE]",
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
                        "code": "radio-button",
                        "display": "Radio button"
                      }
                    ],
                    "text": "Radio button"
                  }
                }
              ],
              "required": false,
              "linkId": "/93042-0/93033-9",
              "text": "Are you worried about losing your housing?",
              "answerOption": [
                {
                  "valueCoding": {
                    "code": "LA33-6",
                    "display": "Yes",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA32-8",
                    "display": "No",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "I choose not to answer this question",
                    "system": "http://loinc.org"
                  }
                }
              ]
            },
            {
              "type": "text",
              "code": [
                {
                  "code": "56799-0",
                  "display": "Address",
                  "system": "http://loinc.org"
                }
              ],
              "required": false,
              "linkId": "/93042-0/56799-0",
              "text": "What address do you live at?",
              "item": [
                {
                  "type": "boolean",
                  "linkId": "/93042-0/56799-0/LA30122-8",
                  "code": [
                    {
                      "code": "LA30122-8",
                      "display": "I choose not to answer this question",
                      "system": "http://loinc.org"
                    }
                  ],
                  "text": "I choose not to answer this question"
                }
              ]
            }
          ]
        },
        {
          "type": "group",
          "code": [
            {
              "code": "93041-2",
              "display": "Money and resources [PRAPARE]",
              "system": "http://loinc.org"
            }
          ],
          "required": false,
          "linkId": "/93041-2",
          "text": "Money and resources",
          "item": [
            {
              "type": "choice",
              "code": [
                {
                  "code": "82589-3",
                  "display": "Highest level of education",
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
                        "code": "radio-button",
                        "display": "Radio button"
                      }
                    ],
                    "text": "Radio button"
                  }
                }
              ],
              "required": false,
              "linkId": "/93041-2/82589-3",
              "text":
                  "What is the highest level of school that you have finished?",
              "answerOption": [
                {
                  "valueCoding": {
                    "code": "LA30191-3",
                    "display": "Less than high school degree",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30192-1",
                    "display": "High school diploma or GED",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30193-9",
                    "display": "More than high school",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "I choose not to answer this question",
                    "system": "http://loinc.org"
                  }
                }
              ]
            },
            {
              "type": "choice",
              "code": [
                {
                  "code": "67875-5",
                  "display": "Employment status - current",
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
                        "code": "radio-button",
                        "display": "Radio button"
                      }
                    ],
                    "text": "Radio button"
                  }
                }
              ],
              "required": false,
              "linkId": "/93041-2/67875-5",
              "text": "What is your current work situation?",
              "answerOption": [
                {
                  "valueCoding": {
                    "code": "LA17956-6",
                    "display": "Unemployed",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30138-4",
                    "display": "Part-time or temporary work",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30136-8",
                    "display": "Full-time work",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30137-6",
                    "display":
                        "Otherwise unemployed but not seeking work (ex: student, retired, disabled, unpaid primary care giver)",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "I choose not to answer this question",
                    "system": "http://loinc.org"
                  }
                }
              ],
              "item": [
                {
                  "type": "string",
                  "required": false,
                  "linkId": "/93041-2/67875-5/LA30137-6",
                  "text": "Please write:",
                  "enableWhen": [
                    {
                      "answerCoding": {
                        "code": "LA30137-6",
                        "display":
                            "Otherwise unemployed but not seeking work (ex: student, retired, disabled, unpaid primary care giver)",
                        "system": "http://loinc.org"
                      },
                      "question": "/93041-2/67875-5",
                      "operator": "="
                    }
                  ],
                  "enableBehavior": "all"
                }
              ]
            },
            {
              "type": "choice",
              "code": [
                {
                  "code": "76437-3",
                  "display": "Primary insurance",
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
                        "code": "radio-button",
                        "display": "Radio button"
                      }
                    ],
                    "text": "Radio button"
                  }
                }
              ],
              "required": false,
              "linkId": "/93041-2/76437-3",
              "text": "What is your main insurance?",
              "answerOption": [
                {
                  "valueCoding": {
                    "code": "LA30194-7",
                    "display": "None/uninsured",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA17849-3",
                    "display": "Medicaid",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30195-4",
                    "display": "CHIP Medicaid",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA15652-3",
                    "display": "Medicare",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30196-2",
                    "display": "Other public insurance (not CHIP)",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30197-0",
                    "display": "Other public insurance (CHIP)",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA6350-8",
                    "display": "Private insurance",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "I choose not to answer this question",
                    "system": "http://loinc.org"
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
                      "What was your best estimate of the total income of all family members from all sources, before taxes, in last year [PhenX]",
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
                  "During the past year, what was the total combined income for you and the family members you live with? This information will help us determine if you are eligible for any benefits.",
              "item": [
                {
                  "type": "boolean",
                  "linkId": "/93041-2/63586-2/LA30122-8",
                  "text": "I choose not to answer this question",
                  "code": [
                    {
                      "code": "LA30122-8",
                      "display": "I choose not to answer this question",
                      "system": "http://loinc.org"
                    }
                  ]
                }
              ]
            },
            {
              "type": "group",
              "code": [
                {
                  "code": "93031-3",
                  "display":
                      "Have you or any family members you live with been unable to get any of the following when it was really needed in past 1 year [PRAPARE]",
                  "system": "http://loinc.org"
                }
              ],
              "required": false,
              "linkId": "/93041-2/93031-3",
              "text":
                  "In the past year, have you or any family members you live with been unable to get any of the following when it was really needed?",
              "item": [
                {
                  "type": "choice",
                  "code": [
                    {
                      "code": "LA30125-1",
                      "display": "Food",
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
                            "code": "radio-button",
                            "display": "Radio button"
                          }
                        ],
                        "text": "Radio button"
                      }
                    }
                  ],
                  "required": false,
                  "linkId": "/93041-2/93031-3/LA30125-1",
                  "text": "Food",
                  "answerOption": [
                    {
                      "valueCoding": {
                        "code": "LA33-6",
                        "display": "Yes",
                        "system": "http://loinc.org"
                      }
                    },
                    {
                      "valueCoding": {
                        "code": "LA32-8",
                        "display": "No",
                        "system": "http://loinc.org"
                      }
                    }
                  ]
                },
                {
                  "type": "choice",
                  "code": [
                    {
                      "code": "LA30126-9",
                      "display": "Clothing",
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
                            "code": "radio-button",
                            "display": "Radio button"
                          }
                        ],
                        "text": "Radio button"
                      }
                    }
                  ],
                  "required": false,
                  "linkId": "/93041-2/93031-3/LA30126-9",
                  "text": "Clothing",
                  "answerOption": [
                    {
                      "valueCoding": {
                        "code": "LA33-6",
                        "display": "Yes",
                        "system": "http://loinc.org"
                      }
                    },
                    {
                      "valueCoding": {
                        "code": "LA32-8",
                        "display": "No",
                        "system": "http://loinc.org"
                      }
                    }
                  ]
                },
                {
                  "type": "choice",
                  "code": [
                    {
                      "code": "LA30124-4",
                      "display": "Utilities",
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
                            "code": "radio-button",
                            "display": "Radio button"
                          }
                        ],
                        "text": "Radio button"
                      }
                    }
                  ],
                  "required": false,
                  "linkId": "/93041-2/93031-3/LA30124-4",
                  "text": "Utilities",
                  "answerOption": [
                    {
                      "valueCoding": {
                        "code": "LA33-6",
                        "display": "Yes",
                        "system": "http://loinc.org"
                      }
                    },
                    {
                      "valueCoding": {
                        "code": "LA32-8",
                        "display": "No",
                        "system": "http://loinc.org"
                      }
                    }
                  ]
                },
                {
                  "type": "choice",
                  "code": [
                    {
                      "code": "LA30127-7",
                      "display": "Child care",
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
                            "code": "radio-button",
                            "display": "Radio button"
                          }
                        ],
                        "text": "Radio button"
                      }
                    }
                  ],
                  "required": false,
                  "linkId": "/93041-2/93031-3/LA30127-7",
                  "text": "Child care",
                  "answerOption": [
                    {
                      "valueCoding": {
                        "code": "LA33-6",
                        "display": "Yes",
                        "system": "http://loinc.org"
                      }
                    },
                    {
                      "valueCoding": {
                        "code": "LA32-8",
                        "display": "No",
                        "system": "http://loinc.org"
                      }
                    }
                  ]
                },
                {
                  "type": "choice",
                  "code": [
                    {
                      "code": "LA30128-5",
                      "display":
                          "Medicine or Any Health Care (Medical, Dental, Mental Health, Vision)",
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
                            "code": "radio-button",
                            "display": "Radio button"
                          }
                        ],
                        "text": "Radio button"
                      }
                    }
                  ],
                  "required": false,
                  "linkId": "/93041-2/93031-3/LA30128-5",
                  "text":
                      "Medicine or Any Health Care (Medical, Dental, Mental Health, Vision)",
                  "answerOption": [
                    {
                      "valueCoding": {
                        "code": "LA33-6",
                        "display": "Yes",
                        "system": "http://loinc.org"
                      }
                    },
                    {
                      "valueCoding": {
                        "code": "LA32-8",
                        "display": "No",
                        "system": "http://loinc.org"
                      }
                    }
                  ]
                },
                {
                  "type": "choice",
                  "code": [
                    {
                      "code": "LA30129-3",
                      "display": "Phone",
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
                            "code": "radio-button",
                            "display": "Radio button"
                          }
                        ],
                        "text": "Radio button"
                      }
                    }
                  ],
                  "required": false,
                  "linkId": "/93041-2/93031-3/LA30129-3",
                  "text": "Phone",
                  "answerOption": [
                    {
                      "valueCoding": {
                        "code": "LA33-6",
                        "display": "Yes",
                        "system": "http://loinc.org"
                      }
                    },
                    {
                      "valueCoding": {
                        "code": "LA32-8",
                        "display": "No",
                        "system": "http://loinc.org"
                      }
                    }
                  ]
                },
                {
                  "type": "choice",
                  "code": [
                    {
                      "code": "LA46-8",
                      "display": "Other",
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
                            "code": "radio-button",
                            "display": "Radio button"
                          }
                        ],
                        "text": "Radio button"
                      }
                    }
                  ],
                  "required": false,
                  "linkId": "/93041-2/93031-3/LA46-8",
                  "text": "Other",
                  "answerOption": [
                    {
                      "valueCoding": {
                        "code": "LA33-6",
                        "display": "Yes",
                        "system": "http://loinc.org"
                      }
                    },
                    {
                      "valueCoding": {
                        "code": "LA32-8",
                        "display": "No",
                        "system": "http://loinc.org"
                      }
                    }
                  ],
                  "item": [
                    {
                      "type": "string",
                      "required": false,
                      "linkId": "/93041-2/93031-3/LA46-8/LA33-6",
                      "text": "Please write",
                      "enableWhen": [
                        {
                          "answerCoding": {
                            "code": "LA33-6",
                            "display": "Yes",
                            "system": "http://loinc.org"
                          },
                          "question": "/93041-2/93031-3/LA46-8",
                          "operator": "="
                        }
                      ],
                      "enableBehavior": "all"
                    }
                  ]
                },
                {
                  "type": "boolean",
                  "code": [
                    {
                      "code": "LA30122-8",
                      "display": "I choose not to answer this question",
                      "system": "http://loinc.org"
                    }
                  ],
                  "required": false,
                  "linkId": "/93041-2/93031-3/LA30122-8",
                  "text": "I choose not to answer this question"
                }
              ]
            },
            {
              "type": "choice",
              "code": [
                {
                  "code": "93030-5",
                  "display":
                      "Has lack of transportation kept you from medical appointments, meetings, work, or from getting things needed for daily living [PRAPARE]",
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
                        "code": "radio-button",
                        "display": "Radio button"
                      }
                    ],
                    "text": "Radio button"
                  }
                }
              ],
              "required": false,
              "linkId": "/93041-2/93030-5",
              "text":
                  "Has lack of transportation kept you from medical appointments, meetings, work, or from getting things needed for daily living? Check all that apply.",
              "answerOption": [
                {
                  "valueCoding": {
                    "code": "LA30133-5",
                    "display":
                        "Yes, it has kept me from medical appointments or from getting my medications",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30134-3",
                    "display":
                        "Yes, it has kept me from non-medical meetings, appointments, work, or from getting things that I need",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA32-8",
                    "display": "No",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "I choose not to answer this question",
                    "system": "http://loinc.org"
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
              "display": "Social and emotional health [PRAPARE]",
              "system": "http://loinc.org"
            }
          ],
          "required": false,
          "linkId": "/93040-4",
          "text": "Social and emotional health",
          "item": [
            {
              "type": "choice",
              "code": [
                {
                  "code": "93029-7",
                  "display":
                      "How often do you see or talk to people that you care about and feel close to [PRAPARE]",
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
                        "code": "radio-button",
                        "display": "Radio button"
                      }
                    ],
                    "text": "Radio button"
                  }
                }
              ],
              "required": false,
              "linkId": "/93040-4/93029-7",
              "text":
                  "How often do you see or talk to people that you care about and feel close to (For example: talking to friends on the phone, visiting friends or family, going to church or club meetings)?",
              "answerOption": [
                {
                  "valueCoding": {
                    "code": "LA27722-0",
                    "display": "Less than once a week",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30130-1",
                    "display": "1 or 2 times a week",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30131-9",
                    "display": "3 to 5 times a week",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30132-7",
                    "display": "5 or more times a week",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "I choose not to answer this question",
                    "system": "http://loinc.org"
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
                      "Stress is when someone feels tense, nervous, anxious or can't sleep at night because their mind is troubled - how stressed are you [PRAPARE]",
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
                        "code": "radio-button",
                        "display": "Radio button"
                      }
                    ],
                    "text": "Radio button"
                  }
                }
              ],
              "required": false,
              "linkId": "/93040-4/93038-8",
              "text":
                  "Stress is when someone feels tense, nervous, anxious or can't sleep at night because their mind is troubled. How stressed are you?",
              "answerOption": [
                {
                  "valueCoding": {
                    "code": "LA6568-5",
                    "display": "Not at all",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA13863-8",
                    "display": "A little bit",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA13909-9",
                    "display": "Somewhat",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA13902-4",
                    "display": "Quite a bit",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA13914-9",
                    "display": "Very much",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "I choose not to answer this question",
                    "system": "http://loinc.org"
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
              "display": "Optional additional questions [PRAPARE]",
              "system": "http://loinc.org"
            }
          ],
          "required": false,
          "linkId": "/93039-6",
          "text": "Optional additional questions",
          "item": [
            {
              "type": "choice",
              "code": [
                {
                  "code": "93028-9",
                  "display":
                      "Have you spent more than 2 nights in a row in a jail, prison, detention center, or juvenile correctional facility in past 1 year [PRAPARE]",
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
                        "code": "radio-button",
                        "display": "Radio button"
                      }
                    ],
                    "text": "Radio button"
                  }
                }
              ],
              "required": false,
              "linkId": "/93039-6/93028-9",
              "text":
                  "In the past year, have you spent more than 2 nights in a row in a jail, prison, detention center, or juvenile correctional facility?",
              "answerOption": [
                {
                  "valueCoding": {
                    "code": "LA33-6",
                    "display": "Yes",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA32-8",
                    "display": "No",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "I choose not to answer this question",
                    "system": "http://loinc.org"
                  }
                }
              ]
            },
            {
              "type": "choice",
              "code": [
                {
                  "code": "93027-1",
                  "display": "Are you a refugee",
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
                        "code": "radio-button",
                        "display": "Radio button"
                      }
                    ],
                    "text": "Radio button"
                  }
                }
              ],
              "required": false,
              "linkId": "/93039-6/93027-1",
              "text": "Are you a refugee?",
              "answerOption": [
                {
                  "valueCoding": {
                    "code": "LA33-6",
                    "display": "Yes",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA32-8",
                    "display": "No",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "I choose not to answer this question",
                    "system": "http://loinc.org"
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
                      "Do you feel physically and emotionally safe where you currently live [PRAPARE]",
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
                        "code": "radio-button",
                        "display": "Radio button"
                      }
                    ],
                    "text": "Radio button"
                  }
                }
              ],
              "required": false,
              "linkId": "/93039-6/93026-3",
              "text":
                  "Do you feel physically and emotionally safe where you currently live?",
              "answerOption": [
                {
                  "valueCoding": {
                    "code": "LA33-6",
                    "display": "Yes",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA32-8",
                    "display": "No",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA14072-5",
                    "display": "Unsure",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "I choose not to answer this question",
                    "system": "http://loinc.org"
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
                      "Within the last year, have you been afraid of your partner or ex-partner [HARK]",
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
                        "code": "radio-button",
                        "display": "Radio button"
                      }
                    ],
                    "text": "Radio button"
                  }
                }
              ],
              "required": false,
              "linkId": "/93039-6/76501-6",
              "text":
                  "Within the last year, have you been afraid of your partner or ex-partner?",
              "answerOption": [
                {
                  "valueCoding": {
                    "code": "LA33-6",
                    "display": "Yes",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA32-8",
                    "display": "No",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {"code": "LA14072-5", "display": "Unsure"}
                },
                {
                  "valueCoding": {
                    "code": "LA4720-4",
                    "display": "I have not had a partner in the past year",
                    "system": "http://loinc.org"
                  }
                },
                {
                  "valueCoding": {
                    "code": "LA30122-8",
                    "display": "I choose not to answer this question",
                    "system": "http://loinc.org"
                  }
                }
              ]
            }
          ]
        }
      ]
    }
  ]
};
