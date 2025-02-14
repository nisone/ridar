import 'package:get/get.dart';
import 'package:ridar/app/controllers/app_controller.dart';
import 'package:ridar/app/services/api_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiService()); // Register ApiService
    Get.put(AppController());
    // Get.put(DataRepository(Get.find())); // Register HomeController
  }
}
