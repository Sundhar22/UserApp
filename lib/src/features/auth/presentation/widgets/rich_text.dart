  import 'package:flutter/material.dart';

Widget userRegistrationRichText() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome Back !\nLogin to Continue.",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          Text(
            "Enter your mobile number. We will send you a One Time Password (OTP)",
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
