import 'package:get/get.dart';
import 'package:ridar/app/models/rider_model.dart';

class AppController extends GetxController {
  Rx<RiderModel>? rider;
  final refreshToken = ''.obs;
  final accessToken = ''.obs;
  final isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
