import 'package:get/get.dart';

import '../controllers/campaigns_controller.dart';

class CampaignsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CampaignsController>(
      () => CampaignsController(),
    );
  }
}
