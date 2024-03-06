import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_app/src/core/resources/data_state.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_app/src/features/profile/data/models/profile_edit_model.dart';

abstract class ProfileDataFetchSource {
  Future<ProfileEditModel> fetchUserDetails();
}

class UserDetailsFetchSourceImpl implements ProfileDataFetchSource {
  // final auth = FirebaseAuth.instance;
  final docReference =
      FirebaseFirestore.instance.collection('profile').doc('user1');
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
      throw DataFetchFailure("Failed to fetch profile data: $e");
    }
  }
}
