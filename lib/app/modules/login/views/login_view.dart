import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridar/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
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
                      'Login',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        spacing: 24,
                        children: [
                          TextFormField(
                            controller: controller.plateNumber,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: 'Plate number',
                            ),
                          ),
                          Row(
                            children: [
                              Obx(
                                () => Checkbox.adaptive(
                                    value: controller.rememberMe.value,
                                    onChanged: (value) =>
                                        controller.rememberMe(value!)),
                              ),
                              Text(
                                'Remember me',
                                style: TextStyle(
                                  color: Get.theme.colorScheme.primary,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 29,
                    ),
                    Obx(
                      () => InkWell(
                        onTap: controller.isLoading.value
                            ? null
                            : controller.login,
                        child: Container(
                          width: 216,
                          padding: EdgeInsets.symmetric(
                              horizontal: 74, vertical: 10.93),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Get.theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: controller.isLoading.value
                              ? SizedBox.square(
                                  dimension: 24,
                                  child: CircularProgressIndicator.adaptive(
                                    backgroundColor:
                                        Get.theme.colorScheme.secondary,
                                    valueColor: AlwaysStoppedAnimation<Color?>(
                                        Get.theme.colorScheme.onSecondary),
                                  ),
                                )
                              : Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Get.theme.colorScheme.onPrimary,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 29,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.SIGNUP);
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    )
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
