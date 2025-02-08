import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridar/app/routes/app_pages.dart';

class SignupController extends GetxController {
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController plateNumber = TextEditingController();
  final rememberMe = false.obs;

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

  signup() {
    if (plateNumber.text.isNotEmpty && plateNumber.text.isNotEmpty) {
      Get.toNamed(Routes.OTP_VERIFICATION);
    } else {
      Get.snackbar(
          'Error', 'Please enter a valid phone number and plate number');
    }
  }
}
