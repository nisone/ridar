import 'package:get/get.dart';

import '../controllers/biometric_verification_controller.dart';

class BiometricVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BiometricVerificationController>(
      () => BiometricVerificationController(),
    );
  }
}
