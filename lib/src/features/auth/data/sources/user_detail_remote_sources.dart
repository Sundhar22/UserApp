import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_app/src/core/error/exception.dart';
import 'package:user_app/src/core/routes/routes.dart';

abstract class UserDetailRemoteSource {
  Future<String> updateUserDetails(
      {required String firstName,
      required String lastName,
      required String email});
}

class UserDetailRemoteSourceImp implements UserDetailRemoteSource {
  final CollectionReference collectionReference;
  final FirebaseAuth firebaseAuth;

  UserDetailRemoteSourceImp(this.collectionReference, this.firebaseAuth);

  @override
  Future<String> updateUserDetails(
      {required String firstName,
      required String lastName,
      required String email}) async {
    final Completer<String> completer = Completer<String>();
    final uid = firebaseAuth.currentUser?.uid;
    var docReference = collectionReference.doc(uid);
    await docReference.update({
      'emailVerified': true,
      'firstName': firstName,
      'lastName': lastName,
      'userEmail': email,
      'isLocationSelected': false,
    }).then((_) {
      completer.complete(RoutesName.location);
    }).catchError((error) {
      completer.completeError(DetailUpdateException());
    });
    return completer.future;
  }
}
