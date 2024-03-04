import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_app/src/features/profile/data/models/profile_edit_model.dart';

abstract class ProfileDataUpdate {
  Future<ProfileEditModel> updateUserDetails(ProfileEditModel profile);
}

class UserDetailsUpdateSource extends ProfileDataUpdate {
  final docReference =
      FirebaseFirestore.instance.collection('profiles').doc('user');

  @override
  Future<ProfileEditModel> updateUserDetails(ProfileEditModel profile) async {
    try {
      // Check if the document exists
      final docSnapshot = await docReference.get();
      if (docSnapshot.exists) {
        // Update profile data in Firestore
        await docReference.update({
          'firstName': profile.firstName,
          'lastName': profile.lastName,
          'userEmail': profile.userEmail,
          'selectedIndex': profile.selectedIndex,
        });

        // Return the updated profile
        return profile;
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Failed to update profile: $e");
    }
  }
}
