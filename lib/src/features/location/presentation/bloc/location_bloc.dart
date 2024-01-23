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
        emit(LocationLoading());
        var result = await getLocationUseCase.getCurrentLocation();

        result.fold((fail) {
          emit(CurrentLocationErrorState(message: fail.message));
        }, (r) {
          emit(CurrentLocationLoadedState(
              currentLocation: CurrentLocation(geoPoint: r.geoPoint)));
        });
      } else if (event is DargLocationEvent) {
        emit(Update(updateLocation: event.location));
      } else if (event is SearchLocationEvent) {
        emit(SearchLoading());
        double longitude = 0, latitude = 0;
        var result = await locationFromAddress(event.address);
        if (result.isNotEmpty) {
          longitude = result[0].longitude;
          latitude = result[0].latitude;
          emit(LocationSearchState(locations: LatLng(latitude, longitude)));
        }
      }
    });
  }
}
