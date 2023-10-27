import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/features/onboarding/ui/widgets/custom_text_field.dart';
import 'package:user_app/features/onboarding/ui/widgets/elevated_button.dart';

class MailVerification extends StatelessWidget {
  const MailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 8.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.arrow_back),
                    SizedBox(width: 10.w),
                    Text(
                      "Personal Details",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Text(
                  "Create an account with the new mobile\nnumber",
                  style: TextStyle(
                    fontSize: 17.sp,
                  ),
                ),
                SizedBox(height: 20.h),
                const CustomTextField(fieldName: "Mobile Number"),
                const CustomTextField(fieldName: "First Name"),
                const CustomTextField(fieldName: "Last Name"),
                const CustomTextField(fieldName: "Email Address"),
                SizedBox(height: 180.h),
                const CustomElevatedButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
