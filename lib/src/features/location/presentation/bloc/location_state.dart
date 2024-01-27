part of 'location_bloc.dart';

class LocationState extends Equatable {
  final LatLng? location;
  // final String? address;
  final Placemark? placemark;

  const LocationState({
    this.location,
    this.placemark,
    // this.address
  });
  LocationState copyWith(
      {LatLng? location,
      // String? address,
      Placemark? placemark}) {
    return LocationState(
      location: location ?? this.location,
      placemark: placemark ?? this.placemark,
      // address: address ?? this.address,
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
  @override
  final Placemark placemark;
  CurrentLocationLoadedState(
      {required this.placemark, required this.currentLocation})
      : super(
            location: LatLng(currentLocation.geoPoint.latitude,
                currentLocation.geoPoint.longitude),
            placemark: placemark);
    
  @override
  List<Object?> get props => [currentLocation, placemark];
}

class CurrentLocationErrorState extends LocationState {
  final String message;

  const CurrentLocationErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class Update extends LocationState {
  @override
  final Placemark placemark;
  final LatLng updateLocation;

  const Update({required this.placemark, required this.updateLocation})
      : super(location: updateLocation, placemark: placemark);

  @override
  List<Object?> get props => [updateLocation, placemark];
}

class LocationSearchState extends LocationState {
  final LatLng locations;
  @override
  final Placemark placemark;
  const LocationSearchState({required this.placemark, required this.locations})
      : super(location: locations, placemark: placemark);

  @override
  List<Object?> get props => [locations, placemark];
}

class AddressSavedState extends LocationState {
  final String? flatName;
  final String? apartmentAddress;
  final String? address;
  final LatLng? reLocation;
  final Placemark? rePlacemark;

  const AddressSavedState({this.flatName, this.apartmentAddress, this.address, this.reLocation, this.rePlacemark})
      : super(location: reLocation, placemark: rePlacemark,);

  @override
  List<Object?> get props => [flatName, apartmentAddress, address];
}
