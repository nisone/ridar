import 'package:get/get.dart';

import '../modules/biometric_verification/bindings/biometric_verification_binding.dart';
import '../modules/biometric_verification/views/biometric_verification_view.dart';
import '../modules/biometric_verification_complete/bindings/biometric_verification_complete_binding.dart';
import '../modules/biometric_verification_complete/views/biometric_verification_complete_view.dart';
import '../modules/biometric_verification_getstart/bindings/biometric_verification_getstart_binding.dart';
import '../modules/biometric_verification_getstart/views/biometric_verification_getstart_view.dart';
import '../modules/help/bindings/help_binding.dart';
import '../modules/help/views/help_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/otp_verification/bindings/otp_verification_binding.dart';
import '../modules/otp_verification/views/otp_verification_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HELP,
      page: () => const HelpView(),
      binding: HelpBinding(),
    ),
    GetPage(
      name: _Paths.OTP_VERIFICATION,
      page: () => const OtpVerificationView(),
      binding: OtpVerificationBinding(),
    ),
    GetPage(
      name: _Paths.BIOMETRIC_VERIFICATION,
      page: () => BiometricVerificationView(),
      binding: BiometricVerificationBinding(),
    ),
    GetPage(
      name: _Paths.BIOMETRIC_VERIFICATION_GETSTART,
      page: () => const BiometricVerificationGetstartView(),
      binding: BiometricVerificationGetstartBinding(),
    ),
    GetPage(
      name: _Paths.BIOMETRIC_VERIFICATION_COMPLETE,
      page: () => BiometricVerificationCompleteView(),
      binding: BiometricVerificationCompleteBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
  ];
}
