import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/constant/colors/app_color.dart';
import 'package:user_app/features/onboarding/counter.dart';
import 'package:user_app/features/onboarding/widgets/elevated_button.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const OptRichText(),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 15.h,
              ),
              child: OtpTextField(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                numberOfFields: 6,
                focusedBorderColor: AppColor.primaryColor,
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      });
                }, // end onSubmit
              ),
            ),
            const SecondsCounter(),
            const Spacer(),
            const CustomElevatedButton(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class OptRichText extends StatelessWidget {
  const OptRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 15.w,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.arrow_back),
              SizedBox(width: 10),
              Text(
                "Verification",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "We've sent you a verification code to \n+91-6380622770",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
