import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/src/features/booking/presentation/bloc/booking_event.dart';
import 'package:user_app/src/features/booking/presentation/bloc/booking_state.dart';
import 'package:user_app/src/features/booking/presentation/functions/booking_firebase.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingFirestoreService bookingFirestoreService;

  BookingBloc({required this.bookingFirestoreService})
      : super(BookingInitial()) {
    on<FetchBookingDetails>((event, emit) async {
      print('Fetching booking details...');
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
