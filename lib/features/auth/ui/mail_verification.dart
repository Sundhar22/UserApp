import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/features/auth/bloc/register_bloc.dart';
import 'package:user_app/features/auth/widgets/custom_text_field.dart';
import 'package:user_app/features/auth/widgets/elevated_button.dart';

import '../../../constant/colors/app_color.dart';
import '../../widgets/flutterToast/flutter_toast.dart';

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
                    GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back)),
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
                Text(
                  'Mobile Number',
                  style: TextStyle(
                    fontSize: 15.5.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                numberPreview(context),
                CustomTextField(
                    fieldName: "First Name",
                    onSubmitted: (value) => firstNameSubmitted(value, context)),
                CustomTextField(
                    fieldName: "Last Name (Optional)",
                    onSubmitted: (value) => context
                        .read<RegisterBloc>()
                        .add(RegisterUserWithEmail(lastName: value))),
                CustomTextField(
                    fieldName: "Email Address",
                    onSubmitted: (value) => emailSubmitted(value, context)),
                SizedBox(height: 180.h),

                CustomElevatedButton(
                  onPressed: () {
                    print(
                        '\x1B[33m${context.read<RegisterBloc>().state.firstName}\x1B[0m');
                    print(
                        '\x1B[33m${context.read<RegisterBloc>().state.lastName}\x1B[0m');
                    print(
                        '\x1B[33m${context.read<RegisterBloc>().state.email}\x1B[0m');
                    

                    // Navigator.pushNamed(context, "user-location-choice");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container numberPreview(BuildContext context) {
    return Container(
      width: 1.sw,
      margin: EdgeInsets.symmetric(vertical: 5.h),
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade500,
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.read<RegisterBloc>().state.userPhoneNumber!,
            style: TextStyle(
              color: AppColor.textPrimaryColor,
              fontSize: 16.5.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Icon(Icons.done, color: Colors.green)
        ],
      ),
    );
  }

  void firstNameSubmitted(value, BuildContext context) {
    if (value.isNotEmpty) {
      context.read<RegisterBloc>().add(RegisterUserWithEmail(firstName: value));
    } else {
      toastMessage('Please enter a first name', context);
    }
  }

  emailSubmitted(String value, BuildContext context) {
    if (value.isEmpty) {
      toastMessage('Please enter an email', context);
    }
    if (RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      context.read<RegisterBloc>().add(RegisterUserWithEmail(email: value));
    } else {
      toastMessage('Please enter a valid email', context);
    }
  }
}
