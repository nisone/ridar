import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:ridar/app/controllers/geolocator_controller.dart';
import 'package:ridar/app/routes/app_bindings.dart';
import 'package:workmanager/workmanager.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GeolocatorController geolocatorController = Get.put(GeolocatorController());
  initializeWorkmanager();
  startBackgroundLocationUpdates(geolocatorController);

  runApp(
    GetMaterialApp(
      title: "Ridar",
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      initialRoute: Routes.SIGNUP, // AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xAA6A1B9A),
        ),
      ),
    ),
  );
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    final Position position = await Geolocator.getCurrentPosition();
    print('Background Location: ${position.latitude}, ${position.longitude}');
    return Future.value(true);
  });
}

void initializeWorkmanager() {
  Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true,
  );

  Workmanager().registerPeriodicTask(
    "locationTask",
    "fetchLocation",
    frequency: Duration(minutes: 15),
  );
}

void startBackgroundLocationUpdates(GeolocatorController controller) {
  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.bestForNavigation,
    distanceFilter: 10,
  );

  Geolocator.getPositionStream(locationSettings: locationSettings).listen(
    (Position position) {
      controller.position.value = position;
      print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
    },
    onError: (error) {
      print('Error: $error');
    },
  );
}
