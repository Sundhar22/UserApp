
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:meta/meta.dart';
  
  part 'location_event.dart';
  part 'location_state.dart';
  
  class LocationBloc extends Bloc<LocationEvent, LocationState> {
    LocationBloc() : super(LocationInitial()) {
      on<LocationEvent>((event, emit) {
        
      });
    }
  }
