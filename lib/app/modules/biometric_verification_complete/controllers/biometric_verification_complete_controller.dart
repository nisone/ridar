import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class BiometricVerificationCompleteController extends GetxController {
  Uint8List? capturedImage;
  @override
  void onInit() {
    super.onInit();
    capturedImage = Get.arguments;
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
