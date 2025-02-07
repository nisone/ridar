import 'package:get/get.dart';

import '../controllers/biometric_verification_getstart_controller.dart';

class BiometricVerificationGetstartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BiometricVerificationGetstartController>(
      () => BiometricVerificationGetstartController(),
    );
  }
}
