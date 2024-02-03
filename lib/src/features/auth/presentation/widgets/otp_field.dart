import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:user_app/src/core/constants/constants.dart';

import '../../../../core/global/global.dart';
import '../bloc/register_bloc.dart';

const fillColor = Color.fromRGBO(50, 123, 196, 0);
PinTheme defaultPinTheme = PinTheme(
    width: 50.w,
    height: 50.h,
    textStyle: TextStyle(
      fontSize: 22.sp,
      color: AppColor.textPrimaryColor,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19.r),
      border: Border.all(
        color: Colors.black.withOpacity(.4),
      ),
    ));

otpPinField(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.h),
    child: Form(
      key: formKey,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Pinput(
          length: 6,
          autofocus: true,
          controller: pinController,
          androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
          listenForMultipleSmsOnAndroid: true,
          defaultPinTheme: defaultPinTheme,
          // validator: (value) {
          //   return value == '2222' ? null : 'Pin is incorrect';
          // },
          hapticFeedbackType: HapticFeedbackType.lightImpact,
          onCompleted: (value) {
            BlocProvider.of<RegisterBloc>(context).add(
              EnterOtp(
                otp: value,
              ),
            );
          },
          cursor: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 9.h),
                width: 22.w,
                height: 1.h,
                color: AppColor.primaryColor,
              ),
            ],
          ),
          focusedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColor.primaryColor),
            ),
          ),
          submittedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              color: fillColor,
              borderRadius: BorderRadius.circular(12.w),
              border: Border.all(color: AppColor.primaryColor),
            ),
          ),
          errorPinTheme: defaultPinTheme.copyBorderWith(
            border: Border.all(color: Colors.redAccent),
          ),
        ),
      ),
    ),
  );
}
