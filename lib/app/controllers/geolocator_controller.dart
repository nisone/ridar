import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeolocatorController extends GetxController {
  late Rx<Position> position = Position(
    longitude: 0.0,
    latitude: 0.0,
    timestamp: DateTime.now(),
    accuracy: 0.0,
    altitude: 0.0,
    altitudeAccuracy: 0.0,
    heading: 0.0,
    headingAccuracy: 0.0,
    speed: 0.0,
    speedAccuracy: 0.0,
  ).obs;

  List<LatLng> points = [];
  double totalDistance = 0;

  void startTracking() async {
    Geolocator.getPositionStream().listen((Position position) {
      LatLng newPoint = LatLng(position.latitude, position.longitude);

      if (points.isNotEmpty) {
        LatLng lastPoint = points.last;
        double distance = Geolocator.distanceBetween(
          lastPoint.latitude,
          lastPoint.longitude,
          newPoint.latitude,
          newPoint.longitude,
        );
        totalDistance += distance;
      }

      points.add(newPoint);
      print('New point added. Total distance: $totalDistance meters');
    });
  }

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
}
