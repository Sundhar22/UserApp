import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_app/src/core/resources/data_state.dart';
import 'package:user_app/src/features/profile/data/models/profile_edit_model.dart';

abstract class ProfileDataUpdateSource {
  Future<ProfileEditModel> updateUserDetails(ProfileEditModel profile);
}

class UserDetailsUpdateSourceImpl implements ProfileDataUpdateSource {
  final docReference =
      FirebaseFirestore.instance.collection('profile').doc('user1');

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
        throw const Failure("Document does not exist");
      }
    } catch (e) {
      throw DataUpdateFailure("Failed to update profile: $e");
    }
  }
}
