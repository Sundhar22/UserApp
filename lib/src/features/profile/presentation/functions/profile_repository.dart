import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileRepository {
  final auth = FirebaseAuth.instance;
  final docReference = FirebaseFirestore.instance
      .collection('users')
      .doc('5mMOYqNsWegTkq43liV4d7g0tyf2');

  Future<ProfileData> fetchProfileData() async {
    try {
      // Fetch old profile data from Firestore
      final docSnapshot = await docReference.get();

      final data = docSnapshot.data() as Map<String, dynamic>;
      return ProfileData(
        firstName: data['firstName'],
        lastName: data['lastName'],
        email: data['userEmail'],
        selectedIndex: data['selectedIndex'],
      );
    } catch (e) {
      throw Exception("Failed to fetch profile data: $e");
    }
  }
}

class ProfileData {
  final String firstName;
  final String lastName;
  final String email;
  final int selectedIndex;

  ProfileData({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.selectedIndex,
  });
}
