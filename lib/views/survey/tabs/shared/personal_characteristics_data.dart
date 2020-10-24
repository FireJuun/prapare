import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalCharacteristicsData {
  Rx<Hispanic> hispanic = Hispanic.yes.obs;
  Rx<Race> race = Race.americanindian.obs;
  Rx<FarmWork> farmwork = FarmWork.yes.obs;
  Rx<ArmedForces> armedForces = ArmedForces.yes.obs;
  Rx<Language> language = Language.english.obs;

  PersonalCharacteristicsData({
    hispanic,
    race,
    farmwork,
    armedForces,
    language,
  });
}

enum Hispanic { yes, no, choosenottoanswer }
enum Race {
  americanindian,
  asian,
  black,
  nativehawaiian,
  pacificIslander,
  white,
  other,
  chooseNotToAnswer
}
enum FarmWork { yes, no, chooseNotToAnswer }
enum ArmedForces { yes, no, chooseNotToAnswer }
enum Language { english, other, chooseNotToAnswer }
