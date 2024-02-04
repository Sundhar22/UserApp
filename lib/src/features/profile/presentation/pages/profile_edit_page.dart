import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/features/auth/presentation/bloc/register_bloc.dart';
// import 'package:user_app/src/features/auth/presentation/func/register_func.dart';
import 'package:user_app/src/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:user_app/src/features/profile/presentation/widgets/custom_elevated_button.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          SingleChildScrollView(child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: EdgeInsets.all(10.0.h),
                child: Row(
                  children: [
                    profileAndName(),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey.withOpacity(0.1),
              ),
              Padding(
                padding: EdgeInsets.all(10.0.h),
                child: Text(
                  "Select your Avatar",
                  style: TextStyle(
                    fontSize: 15.5.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              avatarList(),
              SizedBox(height: 10.h),
              Divider(
                color: Colors.grey.withOpacity(0.1),
              ),
              editingBody(),
            ],
          );
        },
      )),
    );
  }

  Widget editingBody() {
    return Padding(
      padding: EdgeInsets.all(10.0.h),
      child: Column(
        children: [
          CustomTextField(
              fieldName: "First Name",
              onSubmitted: (value) => firstNameSubmitted(value, context)),
          SizedBox(height: 10.h),
          CustomTextField(
              fieldName: "Last Name (Optional)",
              onSubmitted: (value) => context
                  .read<RegisterBloc>()
                  .add(RegisterUserWithEmail(lastName: value))),
          SizedBox(height: 10.h),
          CustomTextField(
              fieldName: "Email Address",
              onSubmitted: (value) => emailSubmitted(value, context)),
          SizedBox(height: 100.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  fieldName: "Cancel"),
              CustomElevatedButton(
                fieldName: "Confirm",
                onPressed: () {
                  if (context.read<RegisterBloc>().state.email != null &&
                      context.read<RegisterBloc>().state.firstName != null) {
                    // registerUserDetails(
                    //   firstName: context.read<RegisterBloc>().state.firstName!,
                    //   lastName: context.read<RegisterBloc>().state.lastName!,
                    //   email: context.read<RegisterBloc>().state.email!,
                    // );
                  } else {
                    // toastMessage(
                    //     'Please enter your first name and email address',
                    //     context);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row profileAndName() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 40.h,
          width: 40.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset("assets/img/user.png"),
        ),
        SizedBox(width: 20.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Chandhrasekar",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
              ),
            ),
            SizedBox(
              // width: 130.w,
              child: Text(
                'Chandhra231sekar@gmail.com',
                // overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget avatarList() {
    return SizedBox(
      height: 70.h,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, index) {
            return customAvatarCircle();
          }),
    );
  }

  Widget customAvatarCircle() {
    return Stack(
      children: [
        Container(
          height: 100.h,
          width: 100.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
          ),
        ),
        Positioned(
          bottom: 3.5,
          top: 3.5,
          left: 15,
          right: 15,
          // right: 1,
          child: Container(
            height: 80.h,
            width: 80.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          bottom: 6,
          top: 6,
          left: 15,
          right: 15,
          // right: 1,
          child: Container(
            height: 40.h,
            width: 40.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: Image.asset("assets/img/user.png"),
          ),
        ),
      ],
    );
  }

  void firstNameSubmitted(value, BuildContext context) {
    if (value.isNotEmpty && value.length > 2 && value != '') {
      context.read<RegisterBloc>().add(RegisterUserWithEmail(firstName: value));
    } else {
      // toastMessage('Please enter a first name', context);
    }
  }

  emailSubmitted(String value, BuildContext context) {
    if (RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      context.read<RegisterBloc>().add(RegisterUserWithEmail(email: value));
    } else {
      // toastMessage('Please enter a valid email', context);
    }
  }
}
