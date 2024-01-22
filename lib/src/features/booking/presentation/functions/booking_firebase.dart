import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:user_app/src/features/booking/data/models/models.dart';

class BookingFirestoreService {
  final CollectionReference bookingDetailsCollection =
      FirebaseFirestore.instance.collection('Booking');

  // void addBookingsToFirebase(List<BookingModel> bookings) async {
  //   try {
  //     for (BookingModel booking in bookings) {
  //       await bookingDetailsCollection.doc(booking.id).set({
  //         'id': booking.id,
  //         'serviceName': booking.serviceName,
  //         'bookingType': booking.bookingType,
  //         'date': booking.date,
  //         'time': booking.time,
  //         'price': booking.price,
  //         'imgUrl': booking.imgUrl,
  //       });
  //     }

  //     print('Bookings added to Firebase successfully!');
  //   } catch (e) {
  //     print('Error adding bookings to Firebase: $e');
  //   }
  // }

  Future<List<BookingModel>> get() async {
    List<BookingModel> bookingList = [];
    try {
      final bookings =
          await FirebaseFirestore.instance.collection("Booking").get();

      bookings.docs.forEach((element) {
        return bookingList.add(BookingModel.fromJson(element.data()));
      });

      return bookingList;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error '${e.code}':${e.message}");
      }
      return bookingList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
