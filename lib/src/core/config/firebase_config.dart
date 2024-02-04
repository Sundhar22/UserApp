import 'package:cloud_firestore/cloud_firestore.dart';

collectionReference({
  FirebaseFirestore? firebaseFirestore,
  String? collectionName,
}) {
  return firebaseFirestore!.collection(collectionName!);
}
