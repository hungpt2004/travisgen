import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';

/// A service class for handling location-related operations
/// Following Flutter best practices with proper error handling and logging
class LocationService {
  static final LocationService _instance = LocationService._internal();
  factory LocationService() => _instance;

  LocationService._internal();

  final BehaviorSubject<bool> locationSubject = BehaviorSubject<bool>.seeded(false);

  /// Checks if location services are enabled on the device
  Future<bool> isLocationServiceEnabled() {
    return Geolocator.isLocationServiceEnabled();
  }

  /// Checks the current permission status
  Future<LocationPermission> checkPermission() async {
    final permission = await Geolocator.checkPermission();
    locationSubject.add(permission.isGranted);

    return permission;
  }

  Future<LocationPermission> requestPermission() async {
    final isEnabled = await isLocationServiceEnabled();
    if (!isEnabled) {
      return LocationPermission.denied;
    }

    var permission = await checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return LocationPermission.denied;
      }
    }

    locationSubject.add(permission.isGranted);

    return permission;
  }

  Future<Position?> getCurrentPosition() async {
    final isEnabled = await isLocationServiceEnabled();
    if (!isEnabled) {
      return null;
    }

    final permission = await checkPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      return null;
    }

    // Get current position
    final position = await Geolocator.getCurrentPosition();

    return position;
  }

  Future<Position?> requestPermissionAndGetPosition() async {
    final permission = await requestPermission();

    if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
      return null;
    }

    // Get current position
    return getCurrentPosition();
  }

  double calculateDistance(
    double startLatitude,
    double startLongitude,
    double endLatitude,
    double endLongitude,
  ) {
    return Geolocator.distanceBetween(
      startLatitude,
      startLongitude,
      endLatitude,
      endLongitude,
    );
  }

  Future<void> openLocationSettings() async {
    final isOpen = await Geolocator.openLocationSettings();

    if (!isOpen) {
      await openAppSettings();
    }
  }

  Future<bool> openAppSettings() {
    return Geolocator.openAppSettings();
  }
}

extension LocationServiceExtension on LocationPermission {
  bool get isGranted => this == LocationPermission.always || this == LocationPermission.whileInUse;
}
