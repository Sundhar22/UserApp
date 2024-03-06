part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {}

class GetCurrentLocationEvent extends LocationEvent {
  @override
  List<Object?> get props => [];
}

class DargLocationEvent extends LocationEvent {
  final LatLng location;

  DargLocationEvent({required this.location});
  @override
  List<Object?> get props => [location];
}

class SearchLocationEvent extends LocationEvent {
  final String address;

  SearchLocationEvent(this.address);

  @override
  List<Object?> get props => [address];
}

class SaveAddressEvent extends LocationEvent {
  final String? flatName;
  final String? apartmentAddress;
  final String? address;

  SaveAddressEvent({this.flatName, this.apartmentAddress, this.address});

  @override
  List<Object?> get props => [flatName, apartmentAddress, address];
}