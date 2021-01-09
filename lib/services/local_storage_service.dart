import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorageService {
  Future<Either<Error, Unit>> call(String bundle) async {
    try {
      final path = (await getApplicationDocumentsDirectory()).path;
      final file = File('$path/questionnaireBundle.txt');
      file.writeAsString(bundle);
    } catch (e) {
      return left(e);
    }
    return right(unit);
  }
}
