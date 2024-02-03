// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/core/global/global.dart';
import 'package:user_app/src/core/widgets/flutterToast/flutter_toast.dart';
import 'package:user_app/src/features/auth/presentation/widgets/elevated_button.dart';

import '../../../../core/config/config.dart';
import '../../../../core/constants/app_const.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/routes/routes.dart';
import '../bloc/register_bloc.dart';
import '../widgets/otp_field.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterError) {
              toastMessage(state.error!, context, Colors.red);
            }
            if (state is OtpVerified) {
              if (state.routesName == RoutesName.appPage) {
                  DependencyInjection.storageService
                      .setBool(AppConstants.FIRST_TIME_OPEN, true);
                  Navigator.pushNamedAndRemoveUntil(
                      context, state.routesName as String, (route) => false);
              } else {
                Navigator.pushReplacementNamed(
                    context, state.routesName as String);
              }
              pinController.clear();
            }
            if (state is Verifying) {
              toastMessage('Verifying...', context, AppColor.primaryColor);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: SizedBox(
                height: 690.h,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const OptRichText(),
                    otpPinField(context),
                    const Spacer(),
                    CustomElevatedButton(
                      onPressed: () {
                        BlocProvider.of<RegisterBloc>(context).add(
                          VerifyOtp(),
                        );
                      },
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
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
