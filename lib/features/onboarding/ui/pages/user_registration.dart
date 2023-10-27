import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserRegistrationScreen extends StatelessWidget {
  const UserRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
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
                    const SizedBox(width: 5),
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
                        height: 20,
                        width: 2,
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
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Continue",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
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
