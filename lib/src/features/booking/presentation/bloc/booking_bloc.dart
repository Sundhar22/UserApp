import 'package:flutter_bloc/flutter_bloc.dart';
import 'booking_event.dart';
import 'booking_state.dart';
import '../functions/booking_firebase.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingFirestoreService bookingFirestoreService;

  BookingBloc({required this.bookingFirestoreService})
      : super(BookingLoading()) {
    on<FetchBookingDetails>((event, emit) async {
      
      emit(BookingLoading());
      await Future.delayed(const Duration(seconds: 1));
      try {
        final bookingData = await bookingFirestoreService.get();
        emit(BookingLoaded(bookingData));
      } catch (e) {
        emit(BookingError(e.toString()));
      }
    });
  }
}
