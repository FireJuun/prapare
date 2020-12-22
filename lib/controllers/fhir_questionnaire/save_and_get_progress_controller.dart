import 'package:get/get.dart';
import 'package:prapare/services/db_interface.dart';

// todo: this will transition

class SaveAndGetProgressController extends GetxController {
  static SaveAndGetProgressController get to => Get.find();

  final dbInterface = DbInterface();

  /// pass the current userResponsesMap as an argument and it will save in the
  /// local db
  Future saveUserResponsesMap(Map<String, dynamic> map) async =>
      await dbInterface.saveGenericKey('userResponsesMap', map);

  /// pass the current questionValidatorsMap as an argument and it will save
  /// in the local db
  Future saveQuestionValidatorsMap(Map<String, dynamic> map) async =>
      await dbInterface.saveGenericKey('questionValidatorsMap', map);

  /// pass the current groupValidatorsMap as an argument and it will save
  /// in the local db
  Future saveGroupValidatorsMap(Map<String, dynamic> map) async =>
      await dbInterface.saveGenericKey('groupValidatorsMap', map);

  /// requests the userResponsesMap from the db, if nothing has been saved or
  /// it is unavailable, it will return an empty map
  Future<Map<String, dynamic>> getUserResponsesMap() async {
    final result = await dbInterface.searchGeneric('userResponsesMap');
    return result.fold((l) => {}, (r) => r);
  }

  /// requests the uquestionValidatorsMap from the db, if nothing has been
  /// saved or it is unavailable, it will return an empty map
  Future<Map<String, dynamic>> getQuestionValidatorsMap() async {
    final result = await dbInterface.searchGeneric('questionValidatorsMap');
    return result.fold((l) => {}, (r) => r);
  }

  /// requests the groupValidatorsMap from the db, if nothing has been saved or
  /// it is unavailable, it will return an empty map
  Future<Map<String, dynamic>> getGroupValidatorsMap() async {
    final result = await dbInterface.searchGeneric('groupValidatorsMap');
    return result.fold((l) => {}, (r) => r);
  }
}
