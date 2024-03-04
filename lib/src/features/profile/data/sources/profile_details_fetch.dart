import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_app/src/features/profile/data/models/profile_edit_model.dart';

abstract class ProfileDataFetch {
  Future<ProfileEditModel> fetchUserDetails();
}

class UserDetailsFetchSource extends ProfileDataFetch {
  // final auth = FirebaseAuth.instance;
  final docReference = FirebaseFirestore.instance
      .collection('profiles')
      .doc('user');
  @override
  Future<ProfileEditModel> fetchUserDetails() async {
    try {
      // Fetch old profile data from Firestore

      final docSnapshot = await docReference.get();

      final data = docSnapshot.data() as Map<String, dynamic>;
      return ProfileEditModel(
        firstName: data['firstName'],
        lastName: data['lastName'],
        userEmail: data['userEmail'],
        selectedIndex: data['selectedIndex'],
      );
    } catch (e) {
      throw Exception("Failed to fetch profile data: $e");
    }
  }
}
