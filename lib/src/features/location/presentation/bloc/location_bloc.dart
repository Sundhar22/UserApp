import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_app/src/features/location/domain/usecases/current_location_usecase.dart';

import '../../domain/entities/current_location_entites.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final CurrentLocationUseCase getLocationUseCase;

  LocationBloc(this.getLocationUseCase) : super(LocationInitial()) {
    on<LocationEvent>((event, emit) async {
      if (event is GetCurrentLocationEvent) {
        await liveLocation(emit);
      } else if (event is DargLocationEvent) {
        await updateMarker(emit, event);
      } else if (event is SearchLocationEvent) {
        await locationSearch(emit, event);
      } else if (event is SaveAddressEvent) {
        saveAddress(emit, event);
      }
    });
  }

  Future<void> locationSearch(
      Emitter<LocationState> emit, SearchLocationEvent event) async {
    emit(SearchLoading());
    double longitude = 0, latitude = 0;
    var result = await locationFromAddress(event.address);
    if (result.isNotEmpty) {
      longitude = result[0].longitude;
      latitude = result[0].latitude;
      final placemark = await placemarkFromCoordinates(latitude, longitude);
      emit(LocationSearchState(
          locations: LatLng(latitude, longitude), placemark: placemark[0]));
    }
  }

  Future<void> updateMarker(
      Emitter<LocationState> emit, DargLocationEvent event) async {
    final placemark = await placemarkFromCoordinates(
        event.location.latitude, event.location.longitude);
    emit(Update(updateLocation: event.location, placemark: placemark[0]));
  }

  Future<void> liveLocation(Emitter<LocationState> emit) async {
    emit(LocationLoading());
    var result = await getLocationUseCase.getCurrentLocation();

    try {
      final locationResult =
          result.getOrElse(() => throw Exception("Failed to get location"));
      var placemark = await placemarkFromCoordinates(
          locationResult.geoPoint.latitude, locationResult.geoPoint.longitude);

      if (placemark.isNotEmpty) {
        emit(CurrentLocationLoadedState(
            currentLocation: locationResult, placemark: placemark[0]));
      } else {
        emit(const CurrentLocationErrorState(
            message: "Failed to get placemark"));
      }
    } catch (e) {
      emit(CurrentLocationErrorState(message: e.toString()));
    }
  }

  void saveAddress(Emitter<LocationState> emit, SaveAddressEvent event) {
    emit(AddressSavedState(
        flatName: event.flatName,
        apartmentAddress: event.apartmentAddress,
        address: event.address,
        reLocation: state.location,
        rePlacemark: state.placemark));
  }
}
