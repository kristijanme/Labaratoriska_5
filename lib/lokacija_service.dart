import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<void> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      if (kDebugMode) {
        print("Пристапот за локацијата е одбиен");
      }
    } else if (permission == LocationPermission.deniedForever) {
      if (kDebugMode) {
        print("Пристапот за локацијата е засекогаш одбиен");
      }
    } else {
      if (kDebugMode) {
        print("Пристапот за локацијата е одобрен");
      }
    }
  }

  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition();
  }
}
