import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageController extends GetxController {
  static StorageController get to => Get.find();
  final GetStorage store = GetStorage();

  bool isFirstLoad = true;

  @override
  Future<void> onReady() async {
    await getFirstLoadInfoFromStore();
    super.onReady();
  }

  Future<void> getFirstLoadInfoFromStore() async {
    isFirstLoad = await store.read('isFirstLoad') ?? true;
  }

  Future<void> saveFirstLoadInfoToStore(bool newValue) async {
    isFirstLoad = newValue;
    await store.write('isFirstLoad', newValue);
  }
}
