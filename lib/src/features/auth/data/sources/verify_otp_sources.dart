import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_app/src/core/routes/routes.dart';

import '../../../../core/error/exception.dart';

abstract class VerifyOtpRemoteDataSource {
  Future<String> verifyOtp(String otp, String verificationId);
}

class VerifyOtpRemoteDataSourceImp extends VerifyOtpRemoteDataSource {
  final FirebaseAuth auth;
  final CollectionReference collection;

  VerifyOtpRemoteDataSourceImp(this.auth, this.collection);

  @override
  Future<String> verifyOtp(String otp, String verificationId) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
    final Completer<String> completer = Completer();

    try {
      var result = await auth.signInWithCredential(credential);

      DocumentSnapshot documentSnapshot =
          await collection.doc(result.user!.uid).get();

      if (documentSnapshot.exists) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;

        if (data['emailVerified'] == true &&
            data['isLocationSelected'] == true) {
          completer.complete(RoutesName.appPage);
        } else if (data['emailVerified'] == true &&
            data['isLocationSelected'] == false) {
          return RoutesName.location;
        } else {
          return RoutesName.register;
        }
      } else {
        await collection.doc(result.user!.uid).set({
          'uid': result.user!.uid,
          'phoneNumber': result.user!.phoneNumber,
          'emailVerified': false,
          'isLocationSelected': false,
        });

        return RoutesName.register;
      }
    } catch (e) {
      print(e);
      completer.completeError(OtpInvalidException());
    }
    return completer.future;
  }
}
