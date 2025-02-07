import 'package:get/get.dart';

import '../controllers/biometric_verification_complete_controller.dart';

class BiometricVerificationCompleteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BiometricVerificationCompleteController>(
      () => BiometricVerificationCompleteController(),
    );
  }
}
