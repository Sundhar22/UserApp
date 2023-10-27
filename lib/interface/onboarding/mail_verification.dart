import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/constant/colors/app_color.dart';
import 'package:user_app/interface/onboarding/widgets/elevated_button.dart';

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

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.fieldName,
  });

  final String fieldName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            fieldName,
            style: TextStyle(
              fontSize: 15.5.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5.h),
          TextField(
            minLines: 1,
            decoration: InputDecoration(
              suffixIcon: fieldName == "Mobile Number"
                  ? const Icon(Icons.done, color: Colors.green)
                  : null,
              contentPadding: EdgeInsets.all(10.r),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
            ),
            style: TextStyle(
              color: AppColor.textPrimaryColor,
              fontSize: 16.5.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
