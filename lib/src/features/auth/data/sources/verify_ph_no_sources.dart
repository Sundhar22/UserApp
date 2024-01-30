import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/exception.dart';

abstract class VerifyPhNumRemoteDataSource {
  Future<String> verifyPhNum(String phNum);
}

class VerifyPhNumRemoteDataSourceImpl implements VerifyPhNumRemoteDataSource {
  final FirebaseAuth auth;

  VerifyPhNumRemoteDataSourceImpl({required this.auth});
  @override
  Future<String> verifyPhNum(String phNum) {
    final Completer<String> completer = Completer();

    auth.verifyPhoneNumber(
      phoneNumber: '+91$phNum',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          completer.completeError(InvalidException());
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        completer.complete(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );

    return completer.future;
  }
}
