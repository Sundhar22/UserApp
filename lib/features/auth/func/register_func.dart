import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

var auth = FirebaseAuth.instance;
// Get the reference to the Firestore document
var docReference =
    FirebaseFirestore.instance.collection('users').doc(auth.currentUser!.uid);
registerUserDetails(
    {required String firstName,
    required String lastName,
    required String email}) {
// Update the 'emailVerified' field to true
  docReference.update({
    'emailVerified': true,
    'firstName': firstName,
    'lastName': lastName,
    'userEmail': email,
    'isLocationSelected': false,
  }).then((_) {
    print("Email verification status updated successfully!");
  }).catchError((error) {
    print("Failed to update email verification status: $error");
  });
}
