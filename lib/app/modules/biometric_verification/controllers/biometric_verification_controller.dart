import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ridar/app/routes/app_pages.dart';

class BiometricVerificationController extends GetxController {
  Uint8List? capturedImage;
  final RxDouble progress = 0.0.obs;

  startVerification() async {
    while (progress.value < 1.0) {
      await Future.delayed(Duration(milliseconds: 100));
      progress.value += 0.01;
    }

    Get.offNamed(Routes.BIOMETRIC_VERIFICATION_COMPLETE,
        arguments: capturedImage!);
  }

  @override
  void onInit() {
    super.onInit();
    capturedImage = Get.arguments;
  }

  @override
  void onReady() {
    super.onReady();
    startVerification();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
