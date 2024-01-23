import 'package:equatable/equatable.dart';
import 'package:user_app/src/features/booking/data/models/models.dart';

abstract class BookingState extends Equatable {
  @override
  List<Object?> get props => [];
}
  class BookingInitial extends BookingState {}
class BookingLoading extends BookingState {
  @override
  List<Object> get props => [];
}

class BookingLoaded extends BookingState {
  final List<BookingModel> bookingsDetails;

   BookingLoaded(this.bookingsDetails);

  @override
  List<Object> get props => [bookingsDetails];
}

class BookingError extends BookingState {
  final String message;

   BookingError(this.message);

  @override
  List<Object> get props => [message];
}


