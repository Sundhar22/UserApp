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
import '../widgets/rich_text.dart';

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
                loadingDialog(context);
              }
              if (state is OtpSendState) {
                if (Navigator.canPop(context)) Navigator.pop(context);
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
                  userRegistrationRichText(),
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

void loadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
        ),
        child: Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
          ),
          margin: EdgeInsets.symmetric(horizontal: 100.w),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
        ),
      );
    },
  );
}
