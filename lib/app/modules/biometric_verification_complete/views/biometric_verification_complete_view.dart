import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';

import '../controllers/biometric_verification_complete_controller.dart';

class BiometricVerificationCompleteView
    extends GetView<BiometricVerificationCompleteController> {
  BiometricVerificationCompleteView({super.key});

  OverlayEntry? _overlayEntry;

  showOverlay(BuildContext context) {
    if (_overlayEntry != null) {
      hideOverlay();
    }

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        child: Material(
          color: Colors.black.withValues(alpha: .5),
          child: getOverlayContent(),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void hideOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showOverlay(context);
    });
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
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    color: Colors.white),
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
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    'assets/images/person1.png',
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/facial_feature_recognized.png',
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
                          Text(
                            '100% recognized',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Colors.white),
                          ),
                          LinearProgressIndicator(
                            value: 1.0,
                            minHeight: 8,
                            borderRadius: BorderRadius.circular(10),
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

  Widget getOverlayContent() {
    return SafeArea(
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
                foregroundColor:
                    WidgetStateProperty.all<Color>(Colors.black), // Icon color
                overlayColor: WidgetStateProperty.all<Color>(
                    Get.theme.colorScheme.onPrimary), // Splash color
                padding: WidgetStateProperty.all<EdgeInsets>(
                    const EdgeInsets.all(2.0)), // Optional: Adjust padding
                shape: WidgetStateProperty.all<CircleBorder>(
                  CircleBorder(),
                ),
              ),
              onPressed: () {
                hideOverlay();
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
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Text(
              '',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
          ),
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/facial_feature_recognized.png',
                    fit: BoxFit.contain,
                  )
                      .animate(
                          onPlay: (controller) =>
                              controller.repeat(reverse: true))
                      .shimmer(curve: Curves.easeIn, duration: 940.ms),
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
                        Text(
                          '100% recognized',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.white),
                        ),
                        LinearProgressIndicator(
                          value: 1.0,
                          minHeight: 8,
                          borderRadius: BorderRadius.circular(10),
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
    );
  }
}
