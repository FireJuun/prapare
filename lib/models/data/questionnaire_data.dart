import 'package:get/get.dart';

// todo: update data and connect to model / service for use by controller
// need to use https://confluence.hl7.org/download/attachments/86974627/SDOHCC_Bundle_PRAPARE_Example_1.json?version=1&modificationDate=1599846027361&api=v2
// and @Dokotela's FHIR spec to convert this into something more usable by FHIR

class RxQuestionnaireData {
  final hispanicOrLatino = ''.obs;
  final whichRacesAreYou = ''.obs;
}

class QuestionnaireData {
  QuestionnaireData({hispanicOrLatino, whichRacesAreYou});

  final rx = RxQuestionnaireData();
  get hispanicOrLatino => rx.hispanicOrLatino.value;
  set hispanicOrLatino(value) => rx.hispanicOrLatino.value = value;

  get whichRacesAreYou => rx.whichRacesAreYou.value;
  set whichRacesAreYou(value) => rx.whichRacesAreYou.value = value;

  QuestionnaireData.fromJson(Map<String, dynamic> json) {
    this.hispanicOrLatino = json['/93043-8/56051-6'];
    this.whichRacesAreYou = json['/93043-8/32624-9'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['/93043-8/56051-6'] = this.hispanicOrLatino;
    data['/93043-8/32624-9'] = this.whichRacesAreYou;
    return data;
  }
}
