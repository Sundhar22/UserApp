import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/src/features/location/domain/usecases/current_location_usecase.dart';

import '../../domain/entities/current_location_entites.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final CurrentLocationUseCase getLocationUseCase;

  LocationBloc(this.getLocationUseCase) : super(LocationInitial()) {
    on<LocationEvent>((event, emit) async {
      if (event is GetCurrentLocationEvent) {
        var result = await getLocationUseCase.getCurrentLocation();

        result.fold(
            (fail) {
              print(fail.message);
              emit(CurrentLocationErrorState(message: fail.message));
            },
            (r) {
          print(r.geoPoint.latitude);
          emit(CurrentLocationLoadedState(currentLocation: r));
        });
      }
    });
  }
}
