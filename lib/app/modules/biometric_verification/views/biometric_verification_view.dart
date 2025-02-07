import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:ridar/app/routes/app_pages.dart';

import '../controllers/biometric_verification_controller.dart';

class BiometricVerificationView
    extends GetView<BiometricVerificationController> {
  BiometricVerificationView({super.key});

  final RxDouble progress = 0.0.obs;

  startVerification() async {
    while (progress.value < 1.0) {
      await Future.delayed(Duration(milliseconds: 100));
      progress.value += 0.01;
    }

    Get.offNamed(Routes.BIOMETRIC_VERIFICATION_COMPLETE);
  }

  @override
  Widget build(BuildContext context) {
    startVerification();
    return Scaffold(
      backgroundColor: Color.fromRGBO(206, 147, 216, 0.25),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Container(
              width: Get.width,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                left: 35,
                top: 59,
                bottom: 16,
              ),
              child: IconButton(
                highlightColor: Get.theme.colorScheme.onPrimary,
                splashColor: Get.theme.colorScheme.onPrimary,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                      Colors.white), // Background color
                  foregroundColor: WidgetStateProperty.all<Color>(
                      Colors.black), // Icon color
                  overlayColor: WidgetStateProperty.all<Color>(
                      Get.theme.colorScheme.onPrimary), // Splash color
                  padding: WidgetStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(2.0)), // Optional: Adjust padding
                  shape: WidgetStateProperty.all<CircleBorder>(
                    CircleBorder(),
                  ),
                ),
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 31,
                  weight: 600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Text(
                'Face Recognition',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Text(
                'Please look into the camera and hold still',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
              ),
            ),
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/person1.png',
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/facial_feature_detection.png',
                      fit: BoxFit.contain,
                    )
                        .animate(
                            onPlay: (controller) =>
                                controller.repeat(reverse: true))
                        .fadeIn(curve: Curves.easeIn, duration: 940.ms),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 89, horizontal: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 17,
                        children: [
                          Obx(
                            () => Text(
                              '${(progress.value * 100).toInt()}% recognized',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: Colors.white),
                            ),
                          ),
                          Obx(
                            () => LinearProgressIndicator(
                              value: progress.value,
                              minHeight: 8,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
