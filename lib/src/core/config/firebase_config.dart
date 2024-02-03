import 'package:cloud_firestore/cloud_firestore.dart';

collectionReference({
  FirebaseFirestore? firebaseFirestore,
}) {
  return firebaseFirestore!.collection('users');
}
