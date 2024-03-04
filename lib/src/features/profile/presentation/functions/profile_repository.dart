// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class ProfileRepository {
//   final auth = FirebaseAuth.instance;
//   final docReference = FirebaseFirestore.instance
//       .collection('users')
//       .doc('TvqNnmcfW7uYuMJSRYMN');

//   Future<ProfileData> fetchProfileData() async {
    
//     try {
//       // Fetch old profile data from Firestore
      
//       final docSnapshot = await docReference.get();
      

//       final data = docSnapshot.data() as Map<String, dynamic>;
//       return ProfileData(
//         firstName: data['firstName'],
//         lastName: data['lastName'],
//         email: data['userEmail'],
//         selectedIndex: data['selectedIndex'],
//       );
//     } catch (e) {
//       throw Exception("Failed to fetch profile data: $e");
//     }
//   }

//   Future<void> updateProfile({
//     required String newFirstName,
//     required String newLastName,
//     required String newEmail,
//     required int newselectedIndex,
//   }) async {
//     try {
//       // Check if the document exists
//       final docSnapshot = await docReference.get();
//       if (docSnapshot.exists) {
//         // Update profile data in Firestore
//         await docReference.update({
//           'firstName': newFirstName,
//           'lastName': newLastName,
//           'userEmail': newEmail,
//           'selectedIndex': newselectedIndex,
//         });
//       } else {
//         throw Exception("Document does not exist");
//       }
//     } catch (e) {
//       throw Exception("Failed to update profile: $e");
//     }
//   }
// }

// class ProfileData {
//   final String firstName;
//   final String lastName;
//   final String email;
//   final int selectedIndex;

//   ProfileData({
//     required this.firstName,
//     required this.lastName,
//     required this.email,
//     required this.selectedIndex,
//   });
// }
