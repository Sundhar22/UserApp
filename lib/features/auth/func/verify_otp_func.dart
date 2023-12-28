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

  void verifyOtp(String otp, String verificationId) {
    var db = FirebaseFirestore.instance;

    auth
        .signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      ),
    )
        .then((value) {
      print(value.user!.uid);
      CollectionReference users = db.collection('users');

      users
          .doc(value.user!.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;
          print('\x1B[33mDocument data: $data\x1B[0m');

          print('\x1B[33m ${auth.currentUser!.emailVerified}\x1B[0m');
          if (data['emailVerified'] == true) {
            toastMessage("OTP Verified and Welcome back", context);

            Navigator.pushNamed(context, 'home');
          } else {
            toastMessage("OTP Verified and please verify email", context);
            Navigator.pushNamed(context, 'verify-mail');
          }
        } else {
          print('\x1B[33mDocument does not exist on the database\x1B[0m');

          toastMessage("OTP Verified", context);

          db.collection('users').doc(value.user!.uid).set({
            'uid': value.user!.uid,
            'phoneNumber': context.read<RegisterBloc>().state.userPhoneNumber,
            'emailVerified': false,
          });

          Navigator.pushNamed(context, 'verify-mail');
        }
      });

      cancelOtpTimer(); // Cancel the timer upon successful OTP verification
    }).catchError((e) {
      toastMessage(e.toString(), context);
    });
  }

  void startOtpTimer() {
    // Set a timer for OTP timeout (e.g., 2 minutes)
    _otpTimer = Timer(const Duration(minutes: 2), () {
      toastMessage("OTP Timeout", context);
      // Handle timeout: You might want to reset the UI or take appropriate action.
    });
  }

  void cancelOtpTimer() {
    // Cancel the OTP timer if needed (e.g., when OTP is successfully verified)
    _otpTimer?.cancel();
  }

  void resendOtp() {
    // Cancel the existing timer if any
    cancelOtpTimer();

    // Resend OTP logic
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
}
