
  part of 'location_bloc.dart';
 
  abstract class LocationEvent extends Equatable {}
  
  class GetCurrentLocationEvent extends LocationEvent {
  @override
  List<Object?> get props => [];
  }