import 'package:geolocator/geolocator.dart';
import 'package:user_app/src/core/error/exception.dart';
import 'package:user_app/src/features/location/data/models/current_location_model.dart';

abstract class CurrentLocationSource {
  Future<CurrentLocationModel> getCurrentLocation();
}

class CurrentLocationSourceImpl implements CurrentLocationSource {
  @override
  Future<CurrentLocationModel> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return throw LocationDisableException();
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return throw LocationDeniedException();
        // Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return throw LocationPermanentDeniedException();

      // throw Exception(
      //     'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    var result = await Geolocator.getCurrentPosition().then((value) {
      return CurrentLocationModel(
        position: value,
      );
    });
    return result;
  }
}
