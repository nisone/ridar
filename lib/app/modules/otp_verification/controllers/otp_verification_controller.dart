import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridar/app/routes/app_pages.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpVerificationController extends GetxController {
  //TODO: Implement OtpVerificationController

  var otp = List.filled(4, '');
  late List<FocusNode> focusNodes;
  onOtpChanged(String value, int index) {
    otp[index] = value;
    if (value.isNotEmpty && index < 3) {
      FocusScope.of(Get.context!).requestFocus(focusNodes[index + 1]);
    }
  }

  @override
  void onInit() {
    super.onInit();
    focusNodes = List.generate(4, (index) => FocusNode());
    _listenForOtp();
  }

  void _listenForOtp() async {}

  void verifyOtp() {
    final enteredOtp = otp.join();
    if (enteredOtp.length == 4) {
      Get.snackbar('Success', 'OTP verified');

      Get.toNamed(Routes.BIOMETRIC_VERIFICATION_GETSTART);
    } else {
      Get.snackbar('Error', 'Please enter a valid OTP');
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    for (var node in focusNodes) {
      node.dispose();
    }
    SmsAutoFill().unregisterListener();
    super.onClose();
  }
}
