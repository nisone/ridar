import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridar/app/routes/app_pages.dart';

import '../controllers/otp_verification_controller.dart';

class OtpVerificationView extends GetView<OtpVerificationController> {
  const OtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/images/keke.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.sizeOf(context).height * .30,
              fit: BoxFit.contain,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.sizeOf(context).height * .40,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(105, 27, 154, 0.1),
                  Color.fromRGBO(105, 27, 154, 0.879)
                ],
                stops: [0.0, 0.8],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.sizeOf(context).height * .70,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 65,
                    ),
                    Text(
                      'Verification',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        spacing: 5,
                        children: [
                          Text(
                            'Please enter your verification code',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            'We have sent a verification code to your phone number',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 29,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(4, (index) {
                        return SizedBox(
                          width: 50,
                          child: TextField(
                            focusNode: controller.focusNodes[index],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            onChanged: (value) =>
                                controller.onOtpChanged(value, index),
                            decoration: InputDecoration(
                              counterText: '',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 29,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.OTP_VERIFICATION);
                      },
                      child: Container(
                        width: 216,
                        padding: EdgeInsets.symmetric(
                            horizontal: 74, vertical: 10.93),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Get.theme.colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Resend',
                          style: TextStyle(
                            color: Get.theme.colorScheme.primary,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      onTap: controller.verifyOtp,
                      child: Container(
                        width: 216,
                        padding: EdgeInsets.symmetric(
                            horizontal: 74, vertical: 10.93),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Get.theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: Get.theme.colorScheme.onPrimary,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
