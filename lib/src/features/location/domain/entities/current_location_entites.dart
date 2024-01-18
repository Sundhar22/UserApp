import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CurrentLocation extends Equatable {
  final GeoPoint geoPoint;

  const CurrentLocation({required this.geoPoint});

  @override
  List<Object?> get props => [geoPoint];
}
