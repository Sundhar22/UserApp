import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../../data/models/models.dart';

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

// Future<void> updateFirestore(List<BookingModel> newBookingList) async {
//   // Step 1: Retrieve existing data
//   final QuerySnapshot querySnapshot =
//       await FirebaseFirestore.instance.collection('Booking').get();

//   // Step 2: Merge existing and new data
//   final List<Map<String, dynamic>> mergedData = [];

//   // Add existing data
//   for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
//     mergedData.add(documentSnapshot.data() as Map<String, dynamic>);
//   }

//   // Add new data
//   for (BookingModel booking in newBookingList) {
//     final existingIndex =
//         mergedData.indexWhere((element) => element['id'] == booking.id);

//     if (existingIndex != -1) {
//       // If the booking exists, update it
//       mergedData[existingIndex] = booking.toJson();
//     } else {
//       // If the booking doesn't exist, add it
//       mergedData.add(booking.toJson());
//     }
//   }

//   // Step 3: Update Firestore with merged data
//   for (Map<String, dynamic> data in mergedData) {
//     final String id = data['id'];
//     await FirebaseFirestore.instance
//         .collection('Booking')
//         .doc(id)
//         .set(data);
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





