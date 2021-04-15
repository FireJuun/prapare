import 'package:get/get.dart';
import 'package:prapare/controllers/commands/commands.dart';
import 'package:prapare/routes/routes.dart';

class NewSurveyCommand {
  Future<void> execute() async {
    final clearDb = Get.put(ClearLocalDbController());
    clearDb.deleteAll();
    Get.toNamed(Routes.GROUP);
  }
}
