import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ridar/app/routes/app_pages.dart';

class BiometricVerificationGetstartController extends GetxController {
  XFile? capturedImage;
  final ImagePicker _picker = ImagePicker();
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void captureImage() async {
    try {
      isLoading(true);
      capturedImage = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );
      if (capturedImage != null) {
        final data = await capturedImage!.readAsBytes();
        Get.toNamed(Routes.BIOMETRIC_VERIFICATION, arguments: data);
      } else {
        Get.snackbar('Error', 'Image not valid! Try again.');
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Invalid operation');
    } finally {
      isLoading(false);
    }
  }
}
