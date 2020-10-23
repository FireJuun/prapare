import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/strings.dart';
import 'package:prapare/themes.dart';

//todos: 1) make the selections persistent (currently changes revert back to defaults when you switch between tabs - whyyyy??) and 2) make it write to a spreadsheet (for now), and ultimately write to a FHIR database

class PersonalCharacteristicsSurveyQuestions extends StatefulWidget {
  PersonalCharacteristicsSurveyQuestions({Key key}) : super(key: key);

  @override
  _PersonalCharacteristicsSurveyQuestionsState createState() =>
      _PersonalCharacteristicsSurveyQuestionsState();
}

enum Hispanic { yes, no, choosenottoanswer }
enum Race {
  americanindian,
  asian,
  black,
  nativehawaiian,
  pacificislander,
  white,
  other,
  choosenottoanswer
}
enum FarmWork { yes, no, choosenottoanswer }
enum ArmedForces { yes, no, choosenottoanswer }
enum Language { english, other, choosenottoanswer }

class _PersonalCharacteristicsSurveyQuestionsState
    extends State<PersonalCharacteristicsSurveyQuestions> {
  Hispanic _hispanic = Hispanic.yes;
  Race _race = Race.americanindian;
  FarmWork _farmwork = FarmWork.yes;
  ArmedForces _armedforces = ArmedForces.yes;
  Language _language = Language.english;

  Widget build(BuildContext context) {
    TextTheme textTheme = context.textTheme;
    return Column(
      children: <Widget>[
        new Text('1. Are you Hispanic or Latino?\n'),
        RadioListTile<Hispanic>(
          title: const Text('Yes'),
          value: Hispanic.yes,
          groupValue: _hispanic,
          onChanged: (Hispanic value) {
            setState(() {
              _hispanic = value;
            });
          },
        ),
        RadioListTile<Hispanic>(
          title: const Text('No'),
          value: Hispanic.no,
          groupValue: _hispanic,
          onChanged: (Hispanic value) {
            setState(() {
              _hispanic = value;
            });
          },
        ),
        RadioListTile<Hispanic>(
          title: const Text('I choose not to answer this question'),
          value: Hispanic.choosenottoanswer,
          groupValue: _hispanic,
          onChanged: (Hispanic value) {
            setState(() {
              _hispanic = value;
            });
          },
        ),
        new Text('\n\n\n2. Which race(s) are you? Check all that apply.\n'),
        RadioListTile<Race>(
            title: const Text('American Indian/Alaskan Native'),
            value: Race.americanindian,
            groupValue: _race,
            onChanged: (Race value) {
              setState(() {
                _race = value;
              });
            }),
        RadioListTile<Race>(
            title: const Text('Asian'),
            value: Race.asian,
            groupValue: _race,
            onChanged: (Race value) {
              setState(() {
                _race = value;
              });
            }),
        RadioListTile<Race>(
            title: const Text('Black/African American'),
            value: Race.black,
            groupValue: _race,
            onChanged: (Race value) {
              setState(() {
                _race = value;
              });
            }),
        RadioListTile<Race>(
            title: const Text('Native Hawaiian'),
            value: Race.nativehawaiian,
            groupValue: _race,
            onChanged: (Race value) {
              setState(() {
                _race = value;
              });
            }),
        RadioListTile<Race>(
            title: const Text('Pacific Islander'),
            value: Race.pacificislander,
            groupValue: _race,
            onChanged: (Race value) {
              setState(() {
                _race = value;
              });
            }),
        RadioListTile<Race>(
            title: const Text('White'),
            value: Race.white,
            groupValue: _race,
            onChanged: (Race value) {
              setState(() {
                _race = value;
              });
            }),
        RadioListTile<Race>(
            title: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Other (please write)'),
                onChanged: (pony) {
                  print("First text fields: $pony");
                }
                //todo figure out how to force the cursor to appear in the text box if the user selects the radio button: https://flutter.dev/docs/cookbook/forms/focus
                //todo figure out how to force the keyboard to close when the user taps outside of this formfield
                //todo figure out how to save the input to the database: https://flutter.dev/docs/cookbook/forms/retrieve-input
                ),
            value: Race.other,
            groupValue: _race,
            onChanged: (Race value) {
              setState(() {
                _race = value;
              });
            }),

        RadioListTile<Race>(
            title: const Text('I choose not to answer this questoin'),
            value: Race.choosenottoanswer,
            groupValue: _race,
            onChanged: (Race value) {
              setState(() {
                _race = value;
              });
            }),
        new Text(
            '\n\n\n3. At any point in the past 2 years, has season or migrant farm work been your or your family\'s main source of income?'),
// todo figure out how to adjust padding for question text
        RadioListTile<FarmWork>(
          title: const Text('Yes'),
          value: FarmWork.yes,
          groupValue: _farmwork,
          onChanged: (FarmWork value) {
            setState(() {
              _farmwork = value;
            });
          },
        ),
        RadioListTile<FarmWork>(
          title: const Text('No'),
          value: FarmWork.no,
          groupValue: _farmwork,
          onChanged: (FarmWork value) {
            setState(() {
              _farmwork = value;
            });
          },
        ),
        RadioListTile<FarmWork>(
          title: const Text('I choose not to answer this question'),
          value: FarmWork.choosenottoanswer,
          groupValue: _farmwork,
          onChanged: (FarmWork value) {
            setState(() {
              _farmwork = value;
            });
          },
        ),
        new Text(
            '\n\n\n4. Have you been discharged from the armed forces of the United States?'),
        RadioListTile<ArmedForces>(
          title: const Text('Yes'),
          value: ArmedForces.yes,
          groupValue: _armedforces,
          onChanged: (ArmedForces value) {
            setState(() {
              _armedforces = value;
            });
          },
        ),
        RadioListTile<ArmedForces>(
          title: const Text('No'),
          value: ArmedForces.no,
          groupValue: _armedforces,
          onChanged: (ArmedForces value) {
            setState(() {
              _armedforces = value;
            });
          },
        ),
        RadioListTile<ArmedForces>(
          title: const Text('I choose not to answer this question'),
          value: ArmedForces.choosenottoanswer,
          groupValue: _armedforces,
          onChanged: (ArmedForces value) {
            setState(() {
              _armedforces = value;
            });
          },
        ),
        new Text('\n\n\n5. What language are you most comfortable speaking?'),
        RadioListTile<Language>(
          title: const Text('English'),
          value: Language.english,
          groupValue: _language,
          onChanged: (Language value) {
            setState(() {
              _language = value;
            });
          },
        ),
        RadioListTile<Language>(
          title: TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Language other than English (please write)'),
            //todo figure out how to force the keyboard to close when the user taps outside of this formfield
          ),
          value: Language.other,
          groupValue: _language,
          onChanged: (Language value) {
            setState(() {
              _language = value;
            });
          },
        ),
        RadioListTile<Language>(
          title: const Text('I choose not to answer this question'),
          value: Language.choosenottoanswer,
          groupValue: _language,
          onChanged: (Language value) {
            setState(() {
              _language = value;
            });
          },
        ),
      ],
    );
  }
}
