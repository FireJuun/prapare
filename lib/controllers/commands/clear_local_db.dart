import 'package:get/get.dart';
import 'package:prapare/services/services.dart';
import 'package:remote_state/remote_state.dart';

class ClearLocalDbController extends GetxController {
  static ClearLocalDbController get to => Get.find();
  final state = RemoteState.initial().obs;

  final dbInterface = DbInterface();

  /// clears all resources from the local db
  Future deleteAll() async {
    state.value = RemoteState.loading();
    final result = await dbInterface.deleteAll();
    result.fold(
      (l) => state.value = RemoteState.error(l),
      (r) => state.value = RemoteState.success('DB cleared'),
    );
    state.value = RemoteState.initial();
  }
}
