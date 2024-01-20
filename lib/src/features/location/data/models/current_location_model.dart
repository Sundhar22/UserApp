import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:user_app/src/features/location/domain/entities/current_location_entites.dart';

class CurrentLocationModel extends CurrentLocation {
  final Position position;
  CurrentLocationModel({required this.position}) : 
  super(geoPoint: GeoPoint(position.latitude, position.longitude));

  CurrentLocation toEntity() {
    return CurrentLocation(geoPoint: geoPoint);
  }
}