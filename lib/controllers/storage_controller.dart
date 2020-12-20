import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageController extends GetxController {
  final GetStorage store = GetStorage();

  final RxBool isFirstLoad = false.obs;
}
