import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/core/routes/routes.dart';
import 'package:user_app/src/features/auth/presentation/func/register_func.dart';
import 'package:user_app/src/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:user_app/src/features/auth/presentation/widgets/elevated_button.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/flutterToast/flutter_toast.dart';
import '../bloc/register_bloc.dart';

class UserDetailsReg extends StatelessWidget {
  const UserDetailsReg({super.key});

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
                    if (context.read<RegisterBloc>().state.email != null &&
                        context.read<RegisterBloc>().state.firstName != null) {
                      registerUserDetails(
                        firstName:
                            context.read<RegisterBloc>().state.firstName!,
                        lastName: context.read<RegisterBloc>().state.lastName!,
                        email: context.read<RegisterBloc>().state.email!,
                      );
                      Navigator.pushNamedAndRemoveUntil(context,
                          RoutesName.location, (Route<dynamic> route) => false);
                    } else {
                      toastMessage(
                          'Please enter your first name and email address',
                          context,
                          Colors.red);
                    }
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
    if (value.isNotEmpty && value.length > 2 && value != '') {
      context.read<RegisterBloc>().add(RegisterUserWithEmail(firstName: value));
    } else {
      toastMessage('Please enter a first name', context,Colors.red);
    }
  }

  emailSubmitted(String value, BuildContext context) {
    if (RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      context.read<RegisterBloc>().add(RegisterUserWithEmail(email: value));
    } else {
      toastMessage('Please enter a valid email', context,Colors.red);
    }
  }
}
