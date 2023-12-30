// ignore_for_file: unnecessary_null_comparison

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/flutterToast/flutter_toast.dart';
import '../bloc/register_bloc.dart';

class VerifyOtpFunc {
  VerifyOtpFunc({required this.context});
  final BuildContext context;
  late String userNumber; // Added a field to store the user's phone number
  Timer? _otpTimer; // Added a timer for OTP timeout
  final FirebaseAuth auth = FirebaseAuth.instance;
// this method is used to pass the number to firebase and firebase will send otp to that number and
// get verification id from firebase and store it in bloc
  void verifyUserPhoneNumber(String userNumber) {
    this.userNumber = userNumber; // Store the user's phone number

    auth.verifyPhoneNumber(
      phoneNumber: "+91$userNumber",
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: otpCodeSend,
      codeAutoRetrievalTimeout: (String verificationId) {
        toastMessage("Auto Retrieval Timeout", context);
        // You may handle this event if needed
      },
      timeout: const Duration(seconds: 60 * 2),
    );
  }

// giving verification id and otp  to verify otp which from
// firebase after entering number and requesting otp
  void verifyOtp(String otp, String verificationId) {
    var db = FirebaseFirestore.instance;

    auth
        .signInWithCredential(
          PhoneAuthProvider.credential(
            verificationId: verificationId,
            smsCode: otp,
          ),
        )

        // After the OTP verification is successful, we need to login the user
        //  then we take user credential and database instance and pass it to verifyLoginStatus method

        .then((value) => verifyLoginStatus(value, db))
        .catchError((e) {
      toastMessage(e.toString(), context);
    });
  }

  void startOtpTimer() {
    _otpTimer = Timer(const Duration(minutes: 2), () {
      toastMessage("OTP Timeout", context);
    });
  }

  void cancelOtpTimer() {
    _otpTimer?.cancel();
  }

  void resendOtp() {
    cancelOtpTimer();

    verifyUserPhoneNumber(userNumber);
  }

  void otpCodeSend(String verificationId, int? resendToken) {
    toastMessage("OTP Sent", context);
    startOtpTimer(); // Start the timer when the OTP is sent
    BlocProvider.of<RegisterBloc>(context).add(
      RegisterUser(
        userPhoneNumber: userNumber,
        verificationId: verificationId,
      ),
    );
    Navigator.pushNamed(context, 'otp');
  }

  void verificationFailed(FirebaseAuthException e) {
    toastMessage(e.message!, context);
    print(e.message);
  }

  void verificationCompleted(PhoneAuthCredential credential) {
    auth.signInWithCredential(credential);

    toastMessage("WelcomeBack", context);
    cancelOtpTimer(); // Cancel the timer upon successful verification
    Navigator.pushNamed(context, 'home');
  }

// verifyLoginStatus method is used take user collection and user's document snapshot from firebase
// and pass it to checkAndNavigate method

  verifyLoginStatus(UserCredential value, FirebaseFirestore db) {
    CollectionReference users = db.collection('users');

    users.doc(value.user!.uid).get().then((DocumentSnapshot documentSnapshot) =>
        checkAndNavigate(documentSnapshot, db, value));

    cancelOtpTimer();
  }

//  checkAndNavigate method is used to check whether the user is new or old
  checkAndNavigate(DocumentSnapshot<Object?> documentSnapshot,
      FirebaseFirestore db, UserCredential value) {
    if (documentSnapshot.exists) {
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;

      debugPrint('\x1B[33m ${auth.currentUser!.emailVerified}\x1B[0m');

      if (data['emailVerified'] == true && data['isLocationSelected'] == true) {
        toastMessage("OTP Verified and Welcome back", context);

        // user not to go back to any of the previous screens
        Navigator.pushNamedAndRemoveUntil(
            context, 'nav', (Route<dynamic> route) => false);
      } else if (data['emailVerified'] == true &&
          data['isLocationSelected'] == false) {
        toastMessage("OTP Verified and Select your location", context);
// user not to go back to any of the previous screens
        Navigator.pushNamedAndRemoveUntil(
            context, 'user-location-choice', (Route<dynamic> route) => false);
      } else {
        toastMessage("OTP Verified and Enter your details", context);
        // user not to go back to any of the previous screens
        Navigator.pushNamedAndRemoveUntil(
            context, 'user-details-reg', (Route<dynamic> route) => false);
      }
    } else {
      toastMessage("OTP Verified", context);

      db.collection('users').doc(value.user!.uid).set({
        'uid': value.user!.uid,
        'phoneNumber': context.read<RegisterBloc>().state.userPhoneNumber,
        'emailVerified': false,
      });

      // user not to go back to any of the previous screens 
      Navigator.pushNamedAndRemoveUntil(
          context, 'user-details-reg', (Route<dynamic> route) => false);
    }
  }
}
