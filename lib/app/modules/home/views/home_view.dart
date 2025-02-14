import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridar/app/controllers/geolocator_controller.dart';
import 'package:ridar/app/data/assets.dart';
import 'package:ridar/app/data/constants.dart';
import 'package:ridar/app/modules/campaigns/views/campaigns_view.dart';
import 'package:ridar/app/modules/payments/views/payments_view.dart';
import 'package:ridar/app/modules/settings/views/settings_view.dart';
import 'package:ridar/app/views/views/map_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        fit: StackFit.loose,
        children: [
          MapView(),
          CurrentCampaignOverviewCard(),
          MyBottomNavigationBar(),
        ],
      ),
    );
  }
}

class CurrentCampaignOverviewCard extends StatelessWidget {
  CurrentCampaignOverviewCard({
    super.key,
  });

  final GeolocatorController controller = Get.find<GeolocatorController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          width: Get.width,
          height: Get.height * .16,
          decoration: BoxDecoration(
            color: Get.theme.colorScheme.tertiaryContainer.withAlpha(250),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 20,
            children: [
              Icon(
                Icons.route_rounded,
                size: 24,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text(
                        'Current test campaign',
                        style: TextStyle(
                            fontFamily: poppins,
                            fontWeight: FontWeight.w600,
                            fontSize: 17),
                      ),
                    ),
                    Text(
                      '45 (Km), N500.00',
                      style: TextStyle(fontFamily: roboto),
                    ),
                    Text(
                        '${controller.position.value.latitude}, ${controller.position.value.longitude}')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyBottomNavigationBar extends StatelessWidget {
  MyBottomNavigationBar({
    super.key,
  });

  final pages = [
    SizedBox.shrink(),
    CampaignsView(),
    PaymentsView(),
    SettingsView()
  ];

  final pageIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          Expanded(
            child: Obx(() => SafeArea(
                  child: Container(
                    margin: EdgeInsets.only(top: 8, left: 8, right: 8),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: pages[pageIndex.value],
                  ),
                )),
          ),
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(6),
            width: Get.width,
            height: 50,
            decoration: BoxDecoration(
              color: Get.theme.colorScheme.tertiaryContainer.withAlpha(150),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                spacing: 20,
                children: List.generate(
                  defaultNavigationBarItems.length,
                  (i) => NavButton(
                    index: i,
                    active: i == pageIndex.value,
                    onTap: () {
                      pageIndex.value = i;
                      // Get.toNamed(defaultNavigationBarItems[i]['route']);
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  const NavButton(
      {super.key, required this.index, this.active = false, this.onTap});

  final Function()? onTap;
  final int index;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
            active ? Colors.white : Colors.white30), // Background color
        foregroundColor: WidgetStateProperty.all<Color>(active
            ? Get.theme.colorScheme.primary
            : Get.theme.colorScheme.tertiary), // Icon color
        overlayColor: WidgetStateProperty.all<Color>(
            Get.theme.colorScheme.onPrimary), // Splash color
        padding: WidgetStateProperty.all<EdgeInsets>(
            const EdgeInsets.all(2.0)), // Optional: Adjust padding
        shape: WidgetStateProperty.all<CircleBorder>(
          CircleBorder(),
        ),
      ),
      icon: Icon(
        active
            ? defaultNavigationBarItems[index]['selectedIcon']
            : defaultNavigationBarItems[index]['unselectedIcon'],
        size: active ? 26 : 24,
      ),
    );
  }
}
