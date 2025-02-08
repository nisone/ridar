import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridar/app/routes/app_pages.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpVerificationController extends GetxController with CodeAutoFill {
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
    listenForCode(smsCodeRegexPattern: '\\d{4,6}');
  }

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

  @override
  void codeUpdated() {
    if (code != null) {
      for (int i = 0; i < code!.length && i < 4; i++) {
        otp[i] = code![i];
      }
      verifyOtp();
    }
  }
}
