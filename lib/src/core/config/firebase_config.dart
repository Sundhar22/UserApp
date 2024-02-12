import 'package:cloud_firestore/cloud_firestore.dart';

collectionReference({
  required FirebaseFirestore firebaseFirestore,
  required String collectionName,
}) {
  return firebaseFirestore.collection(collectionName);
}
