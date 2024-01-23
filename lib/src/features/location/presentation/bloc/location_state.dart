part of 'location_bloc.dart';

class LocationState extends Equatable {
  final LatLng? location;
  final String? address;

  const LocationState({this.location, this.address});
  LocationState copyWith({LatLng? location, String? address}) {
    return LocationState(
      location: location ?? this.location,
      address: address ?? this.address,
    );
  }

  @override
  List<Object?> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}
class SearchLoading extends LocationState {}

class CurrentLocationLoadedState extends LocationState {
  final CurrentLocation currentLocation;

  CurrentLocationLoadedState({required this.currentLocation})
      : super(
            location: LatLng(currentLocation.geoPoint.latitude,
                currentLocation.geoPoint.longitude));

  @override
  List<Object?> get props => [currentLocation];
}

class CurrentLocationErrorState extends LocationState {
  final String message;

  const CurrentLocationErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class Update extends LocationState {
  final LatLng updateLocation;

  const Update({required this.updateLocation})
      : super(location: updateLocation);

  @override
  List<Object?> get props => [updateLocation];
}

class LocationSearchState extends LocationState {
  final LatLng locations;

  const LocationSearchState({required this.locations})
      : super(location: locations);

  @override
  List<Object?> get props => [locations];
}
