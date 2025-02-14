import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';

import '../controllers/biometric_verification_getstart_controller.dart';

class BiometricVerificationGetstartView
    extends GetView<BiometricVerificationGetstartController> {
  const BiometricVerificationGetstartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox.square(
              dimension: 195,
              child: Stack(
                fit: StackFit.loose,
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/images/biometric_bg.png')
                      .animate(
                          onPlay: (controller) =>
                              controller.repeat(reverse: true))
                      .fadeIn(curve: Curves.easeIn, duration: 940.ms),
                  SizedBox.square(
                      dimension: 52,
                      child: Image.asset('assets/images/biometric_icon.png')),
                ],
              ),
            ),
            SizedBox(
              height: 27,
            ),
            Text(
              'Face Recognition',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Scan your face to verify your identity',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
            ),
            SizedBox(
              height: 85,
            ),
            Obx(
              () => InkWell(
                onTap:
                    controller.isLoading.value ? null : controller.captureImage,
                child: Container(
                  constraints: BoxConstraints(minWidth: 216, maxWidth: 250),
                  padding:
                      EdgeInsets.symmetric(horizontal: 52, vertical: 10.93),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Get.theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: controller.isLoading.value
                      ? SizedBox.square(
                          dimension: 24,
                          child: CircularProgressIndicator.adaptive(
                            backgroundColor: Get.theme.colorScheme.secondary,
                            valueColor: AlwaysStoppedAnimation<Color?>(
                                Get.theme.colorScheme.onSecondary),
                          ),
                        )
                      : Text(
                          'Get Started',
                          style: TextStyle(
                            color: Get.theme.colorScheme.onPrimary,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
