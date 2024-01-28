import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

collectionReference(
    {FirebaseFirestore? firebaseFirestore, }) {
  return firebaseFirestore!.collection('users');
}

documentReference({CollectionReference? collectionReference,FirebaseAuth? firebaseAuth}) {
  return collectionReference!.doc(firebaseAuth!.currentUser!.uid);
}
