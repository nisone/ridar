import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:ridar/app/controllers/app_controller.dart';
import 'package:ridar/app/routes/app_pages.dart';
import 'package:ridar/app/services/api_service.dart';

class SettingsController extends GetxController {
  final ApiService apiService = Get.find();
  final AppController app = Get.find();
  final isLoading = false.obs;

  final count = 0.obs;
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

  void logout() async {
    isLoading.value = true;
    try {
      if (app.rider == null) {
        throw FormatException('Invalid operation');
      }

      final id = app.rider!.value.id;

      await apiService.logout(id);
      app.rider = null;
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar('Success', 'Logged out successfully.');
    } on FormatException catch (e) {
      Get.snackbar('Error', e.message);
    } on DioException catch (e) {
      Get.snackbar('Error', e.response?.data['detail'] ?? 'Server error!');
      print(e);
      e.printError();
    } catch (e) {
      Get.snackbar('Error', 'Fail to login');
      print(e);
      e.printError();
    } finally {
      isLoading.value = false;
    }
  }
}
