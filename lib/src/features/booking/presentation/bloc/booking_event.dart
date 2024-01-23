import 'package:equatable/equatable.dart';

abstract class BookingEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchBookingDetails extends BookingEvent {
  FetchBookingDetails();
}
