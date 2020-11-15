import 'package:prapare/localization.dart';

enum answerType {
  boolean,
  checkbox,
  decimal,
  decimal_int,
  radio,
  string,
  string_long,
}

class PrapareCodesUtil {
  /// hard-coded for now
  /// todo: use FHIR resource to determine answer type
  answerType getAnswerTypeFromQuestionCode(String linkId) {
    try {
      switch (linkId) {
        // labels.prapare.personalCharacteristics.race
        case '/93043-8/32624-9':
          return answerType.checkbox;
        // labels.prapare.familyAndHome.household
        case '/93042-0/63512-8':
          return answerType.decimal_int;
        // labels.prapare.familyAndHome.address
        case '/93042-0/56799-0':
          return answerType.string_long;

        // labels.prapare.moneyAndResources.income
        case '/93041-2/63586-2':
          // todo: this accepts decimal + choose not to respond
          return answerType.decimal;
        // labels.prapare.moneyAndResources.without;
        case '/93041-2/93031-3':
          // todo: this is a check multiple...which swaps yes/no
          // radio for now, need to swap
          return answerType.radio;

        default:
          return answerType.radio;
      }
    } catch (error) {
      return error.message;
    }
  }

  String getTitleFromLinkIdAndLocale(
      String linkId, AppLocalizations_Labels labels) {
    try {
      switch (linkId) {
        case '/93025-5':
          return labels.prapare.title;
        case '/93043-8':
          return labels.prapare.personalCharacteristics.title;
        case '/93042-0':
          return labels.prapare.familyAndHome.title;
        case '/93041-2':
          return labels.prapare.moneyAndResources.title;
        case '/93040-4':
          return labels.prapare.socialAndEmotionalHealth.title;
        case '/93039-6':
          return labels.prapare.optionalMeasures.title;
        default:
          return 'error: incorrect FHIR Title';
      }
    } catch (error) {
      return error.message;
    }
  }

  String getQuestionFromLinkIdAndLocale(
      String linkId, AppLocalizations_Labels labels) {
    try {
      switch (linkId) {

        // *** PERSONAL CHARACTERISTICS ***
        case '/93043-8/56051-6':
          return labels.prapare.personalCharacteristics.latino;
        case '/93043-8/32624-9':
          return labels.prapare.personalCharacteristics.race;
        case '/93043-8/93035-4':
          return labels.prapare.personalCharacteristics.seasonalWork;
        case '/93043-8/93034-7':
          return labels.prapare.personalCharacteristics.military;
        case '/93043-8/54899-0':
          return labels.prapare.personalCharacteristics.language;

        // *** FAMILY AND HOME ***
        case '/93042-0/63512-8':
          // todo: this accepts a decimal response
          //? FYI: worded differently in FHIR resource
          return labels.prapare.familyAndHome.household;
        case '/93042-0/71802-3':
          //? FYI: worded differently in FHIR resource
          return labels.prapare.familyAndHome.housing;
        case '/93042-0/93033-9':
          return labels.prapare.familyAndHome.losingHousing;
        case '/93042-0/56799-0':
          //? FYI: worded differently in FHIR resource
          return labels.prapare.familyAndHome.address;

        // *** MONEY AND RESOURCES ***
        case '/93041-2/82589-3':
          //? FYI: worded differently in FHIR resource
          return labels.prapare.moneyAndResources.school;
        case '/93041-2/67875-5':
          //? FYI: worded differently in FHIR resource
          return labels.prapare.moneyAndResources.work;
        case '/93041-2/76437-3':
          //? FYI: worded differently in FHIR resource
          return labels.prapare.moneyAndResources.insurance;
        case '/93041-2/63586-2':
          //? FYI: worded differently in FHIR resource
          // todo: this accepts decimal + choose not to respond
          return labels.prapare.moneyAndResources.income;
        case '/93041-2/93031-3':
          //? FYI: worded differently in FHIR resource
          // todo: this is a check multiple...which swaps yes/no
          return labels.prapare.moneyAndResources.without;
        case '/93041-2/93030-5':
          //? FYI: worded differently in FHIR resource
          return labels.prapare.moneyAndResources.transportation;

        // *** SOCIAL AND EMOTIONAL HEALTH ***
        case '/93040-4/93029-7':
          return labels.prapare.socialAndEmotionalHealth.talk;
        case '/93040-4/93038-8':
          return labels.prapare.socialAndEmotionalHealth.stress;

        // *** OPTIONAL MEASURES ***
        case '/93039-6/93028-9':
          return labels.prapare.optionalMeasures.prison;
        case '/93039-6/93027-1':
          return labels.prapare.optionalMeasures.refugee;
        case '/93039-6/93026-3':
          return labels.prapare.optionalMeasures.safe;
        case '/93039-6/76501-6':
          return labels.prapare.optionalMeasures.afraid;

        default:
          return 'error: incorrect FHIR Question';
      }
    } catch (error) {
      return error.message;
    }
  }

  String getAnswerFromLinkIdAndLocale(
      String linkId, AppLocalizations_Labels labels) {
    try {
      switch (linkId) {

        // *** ANSWER CODES ***
        case 'LA33-6':
          return labels.prapare.answers.basic.yes;
        case 'LA32-8':
          return labels.prapare.answers.basic.no;
        case 'LA14072-5':
          return labels.prapare.answers.basic.unsure;
        case 'LA30122-8':
          return labels.prapare.answers.basic.chooseNotToAnswer;

        case 'LA46-8':
          // todo: allow for user entry responses
          //todo: does this value needs to accept write-in + boolean?
          return labels.prapare.answers.other;

        case 'LA6156-9':
          return labels.prapare.answers.race.asian;
        case 'LA14045-1':
          return labels.prapare.answers.race.nativeHawaiian;
        case 'LA30187-1':
          return labels.prapare.answers.race.pacificIslander;
        case 'LA14042-8':
          return labels.prapare.answers.race.blackAfricanAmerican;
        case 'LA4457-3':
          return labels.prapare.answers.race.white;
        case 'LA4-4':
          return labels.prapare.answers.race.americanIndianAlaskanNative;

        case 'LA43-5':
          return labels.prapare.answers.language.english;
        case 'LA30188-9':
          return labels.prapare.answers.language.languageOtherThanEnglish;

        case 'LA30189-7':
          return labels.prapare.answers.housing.iHaveHousing;
        case 'LA30190-5':
          return labels.prapare.answers.housing.iDoNotHaveHousing;

        case 'LA30191-3':
          return labels.prapare.answers.school.lessThanHighSchoolDegree;
        case 'LA30192-1':
          return labels.prapare.answers.school.highSchoolDiplomaOrGed;
        case 'LA30193-9':
          return labels.prapare.answers.school.moreThanHighSchool;

        case 'LA17956-6':
          return labels.prapare.answers.work.unemployed;
        case 'LA30138-4':
          return labels.prapare.answers.work.partTimeOrTemporaryWork;
        case 'LA30136-8':
          return labels.prapare.answers.work.fullTimeWork;
        case 'LA30137-6':
          // todo: allow for user entry responses
          // todo: add 'please write'
          return labels
              .prapare.answers.work.otherwiseUnemployedButNotSeekingWork;

        case 'LA30194-7':
          return labels.prapare.answers.insurance.noneOrUninsured;
        case 'LA17849-3':
          return labels.prapare.answers.insurance.medicaid;
        case 'LA30195-4':
          return labels.prapare.answers.insurance.chipMedicaid;
        case 'LA15652-3':
          return labels.prapare.answers.insurance.medicare;
        case 'LA30196-2':
          return labels.prapare.answers.insurance.otherPublicInsuranceNotChip;
        case 'LA30197-0':
          return labels.prapare.answers.insurance.otherPublicInsuranceChip;
        case 'LA6350-8':
          return labels.prapare.answers.insurance.privateInsurance;

        //todo: these values need to accept boolean
        case 'LA30125-1':
          return labels.prapare.answers.without.food;
        case 'LA30126-9':
          return labels.prapare.answers.without.clothing;
        case 'LA30124-4':
          return labels.prapare.answers.without.utilities;
        case 'LA30127-7':
          return labels.prapare.answers.without.childCare;
        case 'LA30128-5':
          return labels.prapare.answers.without.medicineOrAnyHealthCare;
        case 'LA30129-3':
          return labels.prapare.answers.without.phone;

        // case 'LA46-8':
        //todo: this value needs to accept write-in + boolean
        // return labels.prapare.answers.without.other;

        //todo: these also have valueStrings + one extra answer:
        case 'LA30133-5':
          return labels.prapare.answers.transportation.yesKeptFromMedical;
        case 'LA30134-3':
          return labels.prapare.answers.transportation.yesKeptFromNonMedical;
        case 'LA30257-2':
          return labels.prapare.answers.transportation.unableToRespond;

        case 'LA27722-0':
          return labels.prapare.answers.howOften.lessThanOnceAWeek;
        case 'LA30130-1':
          return labels.prapare.answers.howOften.oneOrTwoTimesAWeek;
        case 'LA30131-9':
          return labels.prapare.answers.howOften.threeToFiveTimesAWeek;
        case 'LA30132-7':
          return labels.prapare.answers.howOften.fiftyOrMoreTimesAWeek;

        case 'LA6568-5':
          return labels.prapare.answers.howMuch.notAtAll;
        case 'LA13863-8':
          return labels.prapare.answers.howMuch.aLittleBit;
        case 'LA13909-9':
          return labels.prapare.answers.howMuch.somewhat;
        case 'LA13902-4':
          return labels.prapare.answers.howMuch.quiteABit;
        case 'LA13914-9':
          return labels.prapare.answers.howMuch.veryMuch;

        // todo: this answer choice needs a valueCoding code
        case 'XXXX':
          return labels.prapare.answers.partner.noPartnerInLastYear;

        default:
          return 'error: incorrect FHIR Answer';
      }
    } catch (error) {
      return error.message;
    }
  }
}
