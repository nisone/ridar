import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridar/app/routes/app_pages.dart';

class LoginController extends GetxController {
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

  login() {
    if (plateNumber.text.isNotEmpty) {
      Get.toNamed(Routes.BIOMETRIC_VERIFICATION_GETSTART);
    } else {
      Get.snackbar('Error', 'Please enter a valid plate number');
    }
  }
}
