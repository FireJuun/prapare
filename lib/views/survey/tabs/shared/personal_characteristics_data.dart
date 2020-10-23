import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalCharacteristicsData {
  Rx<Hispanic> hispanic;
  Rx<Race> race;
  Rx<FarmWork> farmWork;
  Rx<ArmedForces> armedForces;
  Rx<Language> language;

  PersonalCharacteristicsData({
    this.hispanic,
    this.race,
    this.farmWork,
    this.armedForces,
    this.language,
  });
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
