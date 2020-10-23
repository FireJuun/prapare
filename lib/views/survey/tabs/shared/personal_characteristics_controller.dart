import 'package:get/get.dart';
import 'package:prapare/views/survey/tabs/shared/personal_characteristics_data.dart';

class PersonalCharacteristicsController extends GetxController {
  final PersonalCharacteristicsData data = PersonalCharacteristicsData(
      hispanic: Hispanic.yes.obs,
      race: Race.americanindian.obs,
      farmWork: FarmWork.yes.obs,
      armedForces: ArmedForces.yes.obs,
      language: Language.english.obs);
}
