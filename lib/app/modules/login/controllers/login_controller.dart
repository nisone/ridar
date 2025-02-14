import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridar/app/controllers/app_controller.dart';
import 'package:ridar/app/models/rider_model.dart';
import 'package:ridar/app/routes/app_pages.dart';
import 'package:ridar/app/services/api_service.dart';

class LoginController extends GetxController {
  final ApiService apiService = Get.find();
  final AppController appController = Get.find();
  TextEditingController plateNumber = TextEditingController();
  final rememberMe = false.obs;
  var isLoading = false.obs;

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

  login() async {
    isLoading.value = true;
    try {
      if (plateNumber.text.isEmpty) {
        throw FormatException('Please enter a valid plate number');
      }

      final data = {
        'username': plateNumber.text,
        "password": plateNumber.text,
      };

      final response = await apiService.login(data);
      print(response);

      appController.refreshToken.value = response['refresh'];
      appController.accessToken.value = response['access'];

      RiderModel rider = RiderModel.fromJson(response['details']['rider']);

      if (appController.rider != null) {
        appController.rider!.value = rider;
      } else {
        appController.rider = rider.obs;
      }

      response.printInfo(); // For debugging purpose

      Get.toNamed(Routes.OTP_VERIFICATION);
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
