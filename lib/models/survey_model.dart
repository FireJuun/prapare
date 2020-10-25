import 'package:prapare/_internal/constants/prapare_survey.dart';
import 'package:prapare/models/data/survey/answer.dart';
import 'package:prapare/models/data/survey/question.dart';
import 'package:prapare/models/data/survey/survey.dart';
import 'package:prapare/strings.dart';

class SurveyModel {
  /// A semi-temporary data model, which will be transitioned to harness [prapareSurvey]
  /// For now, the data points have been created manually, and the codes don't quite correlate yet

  //todo: implement error handling / orElse
  Survey getSurveyFromCode(String code) => this
      ._surveyList
      .firstWhere((e) => e.code == code, orElse: () => Survey());

  List<Survey> _surveyList = [
    // * PERSONAL SURVEY
    Survey(
      title: 'PRAPARE',
      code: S.CODE_PERSONAL,
      text: S.TITLE_PERSONAL,
      questions: [
        Question(
          code: 'q1',
          text: 'Are you Hispanic or Latino?',
          answers: _createBasicYesNoList(),
          format: QFormat.radio,
        ),
        // todo: implement check_boxes handling
        Question(
          code: 'q2',
          text: 'Which race(s) are you? Check all that apply.',
          answers: <Answer>{
            Answer(code: 'AmIndian', text: 'American Indian/Alaskan Native'),
            Answer(code: 'Asian', text: 'Asian'),
            Answer(code: 'Black-AA', text: 'Black/African American'),
            Answer(code: 'Hawaiian', text: 'Native Hawaiian'),
            Answer(code: 'PacIslander', text: 'Pacific Islander'),
            Answer(code: 'White', text: 'White'),
            //todo: include ability for custom data entry
            Answer(code: 'Other', text: 'Other'),
            //todo: include radio button that turns off all other answer choices
            Answer(code: 'NA', text: 'I choose not to answer this question'),
          },
          format: QFormat.check_boxes,
        ),
        Question(
          code: 'q3',
          text:
              "At any point in the past 2 years, has season or migrant farm work been your or your family's main source of income?",
          answers: _createBasicYesNoList(),
          format: QFormat.radio,
        ),
        Question(
          code: 'q4',
          text:
              "Have you been discharged from the armed forces of the United States?",
          answers: _createBasicYesNoList(),
          format: QFormat.radio,
        ),
        Question(
          code: 'q5',
          text: "What language are you most comfortable speaking?",
          answers: <Answer>{
            Answer(code: 'English', text: 'English'),
            //todo: include ability for custom data entry
            Answer(
                code: 'Other',
                text: 'Language other than English (please write)'),
            //todo: include radio button that turns off all other answer choices
            Answer(code: 'NA', text: 'I choose not to answer this question'),
          },
          format: QFormat.radio,
        ),
      ],
    ),

    // * HOME SURVEY
    Survey(
      title: 'PRAPARE',
      code: S.CODE_HOME,
      text: S.TITLE_HOME,
      questions: [
        Question(
          code: 'q6',
          text: 'Home Questions',
          answers: _createBasicYesNoList(),
          format: QFormat.radio,
        ),
      ],
    ),

    // * MONEY SURVEY
    Survey(
      title: 'PRAPARE',
      code: S.CODE_MONEY,
      text: S.TITLE_MONEY,
      questions: [
        Question(
          code: 'q10',
          text: 'Money Questions',
          answers: _createBasicYesNoList(),
          format: QFormat.radio,
        ),
      ],
    ),

    // * SOCIAL SURVEY
    Survey(
      title: 'PRAPARE',
      code: S.CODE_SOCIAL,
      text: S.TITLE_SOCIAL,
      questions: [
        Question(
          code: 'q16',
          text: 'Social Questions',
          answers: _createBasicYesNoList(),
          format: QFormat.radio,
        ),
      ],
    ),

    // * OTHER SURVEY
    Survey(
      title: 'PRAPARE',
      code: S.CODE_OTHER,
      text: S.TITLE_OTHER,
      questions: [
        Question(
          code: 'q18',
          text: 'Other Questions',
          answers: _createBasicYesNoList(),
          format: QFormat.radio,
        ),
      ],
    ),
  ];
}

Set<Answer> _createBasicYesNoList() => {
      Answer(code: 'Y', text: 'Yes'),
      Answer(code: 'N', text: 'No'),
      Answer(code: 'X', text: 'I choose not to answer this question'),
    };
