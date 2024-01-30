import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/core/animation/animation.dart';
import 'package:user_app/src/core/global/navigation_arg.dart';
import 'package:user_app/src/core/routes/routes.dart';
import 'package:user_app/src/core/widgets/flutterToast/flutter_toast.dart';

import '../bloc/register_bloc.dart';
import '../widgets/elevated_button.dart';

class UserRegistrationScreen extends StatelessWidget {
  const UserRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<RegisterBloc, RegisterState>(
            listener: (BuildContext context, RegisterState state) {
              print(state);
              if (state is RegisterError) {
                toastMessage(state.error!, context, Colors.red);
              }
              if (state is Loading) {
                toastMessage("Loading...", context, Colors.green);
              }
              if (state is OtpSendState) {
                toastMessage("Otp Send", context, Colors.green);
                Navigator.pushNamed(context, RoutesName.otp,
                    arguments: const RouteArguments(
                        navAnimationType: AnimationType.customSlide));
              }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 250.h,
                    child: Image.asset(
                      fit: BoxFit.cover,
                      "assets/img/banner.jpg",
                    ),
                  ),
                  const UserRegistrationRichText(),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
                    padding: EdgeInsets.symmetric(
                      vertical: 6.h,
                      horizontal: 8.h,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Row(
                      children: [
                        Image.asset(height: 25.h, "assets/icons/india.png"),
                        SizedBox(width: 5.w),
                        const Text(
                          "+91",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Container(
                            height: 20.h,
                            width: 2.w,
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            maxLength: 10,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Mobile Number",
                              counterStyle: TextStyle(
                                height: double.minPositive,
                              ),
                              counterText: "",
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(RegisterUser(userPhoneNumber: value));
                            },
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    child: CustomElevatedButton(onPressed: () {
                      context.read<RegisterBloc>().add(
                          VerifyPh(userPhoneNumber: state.userPhoneNumber));
                    }),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class UserRegistrationRichText extends StatelessWidget {
  const UserRegistrationRichText({super.key});

  @override
  Widget build(BuildContext context) {
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
}
