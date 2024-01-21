import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/features/auth/presentation/widgets/counter.dart';
import 'package:user_app/src/features/auth/presentation/widgets/elevated_button.dart';
import 'package:user_app/src/core/widgets/flutterToast/flutter_toast.dart';

import '../../../../core/constants/constants.dart';
import '../bloc/register_bloc.dart';
import '../func/verify_otp_func.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return Column(
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
                    autoFocus: true,
                    showFieldAsBox: true,
                    onSubmit: (String verificationCode) {
                      BlocProvider.of<RegisterBloc>(context).add(
                        VerifyOtp(
                          otp: verificationCode,
                        ),
                      );
                      toastMessage('You entered $verificationCode', context);
                    }, // end onSubmit
                  ),
                ),
                const SecondsCounter(),
                const Spacer(),
                CustomElevatedButton(
                  onPressed: () {
                    VerifyOtpFunc(context: context).verifyOtp(
                      context.read<RegisterBloc>().state.otp!,
                      context.read<RegisterBloc>().state.verificationId!,
                    );
                  },
                ),
                const SizedBox(height: 50),
              ],
            );
          },
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
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back)),
                  const SizedBox(width: 10),
                  const Text(
                    "Verification",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "We've sent you a verification code to \n+91-${context.read<RegisterBloc>().state.userPhoneNumber}",
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
