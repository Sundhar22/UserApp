part of 'location_bloc.dart';


abstract class LocationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LocationInitial extends LocationState {}
class LocationLoading extends LocationState {}

class CurrentLocationLoadedState extends LocationState {
  final CurrentLocation currentLocation;

  CurrentLocationLoadedState({required this.currentLocation});

  @override
  List<Object?> get props => [currentLocation];
}

class CurrentLocationErrorState extends LocationState {
  final String message;

  CurrentLocationErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}