import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridar/app/routes/app_pages.dart';
import 'package:ridar/app/services/api_service.dart';

class SignupController extends GetxController {
  final ApiService apiService = Get.find();
  TextEditingController phoneNumber = TextEditingController();
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

  signup() async {
    isLoading.value = true;
    try {
      if (phoneNumber.text.isEmpty || plateNumber.text.isEmpty) {
        throw FormatException(
            'Please enter a valid phone number and plate number');
      }

      final data = {
        'username': phoneNumber.text,
        "phonenumber": phoneNumber.text,
        "platenumber": plateNumber.text
      };

      final response = await apiService.register(data);
      // data.value = response;
      print(response);
      response.printInfo(); // For debugging purpose

      Get.toNamed(Routes.BIOMETRIC_VERIFICATION_GETSTART);
    } on FormatException catch (e) {
      Get.snackbar('Error', e.message);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        Get.snackbar(
            'Error',
            e.response?.data['username']?[0] ??
                ',' + e.response?.data['phonenumber']?[0] ??
                ',' + e.response?.data['platenumber']?[0] ??
                ',' + 'Server error!');
      } else {
        Get.snackbar('Error', e.response?.data['detail'] ?? 'Server error!');
      }
      print(e);
      e.printError();
    } catch (e) {
      Get.snackbar('Error', 'Fail to signup');
      print(e);
      e.printError();
    } finally {
      isLoading.value = false;
    }
  }
}
