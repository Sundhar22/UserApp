import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/core/constants/colors.dart';
import 'package:user_app/src/features/profile/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:user_app/src/features/profile/presentation/bloc/profile_bloc/profile_event.dart';
import 'package:user_app/src/features/profile/presentation/functions/profile_repository.dart';
import 'package:user_app/src/features/profile/presentation/widgets/custom_elevated_button.dart';


class EditingBody extends StatefulWidget {
  const EditingBody({Key? key}) : super(key: key);

  @override
  State<EditingBody> createState() => _EditingBodyState();
}

class _EditingBodyState extends State<EditingBody> {
  final ProfileRepository repository = ProfileRepository();
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    // Initialize text editing controllers
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    // Clean up controllers
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void texfieldClear() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0.h),
      child: Column(
        children: [
          CustomTextField(
            fieldName: "First Name",
            controller: firstNameController,
            onSubmitted: (value) {},
          ),
          SizedBox(height: 10.h),
          CustomTextField(
            onSubmitted: (value) {},
            fieldName: "Last Name (Optional)",
            controller: lastNameController,
          ),
          SizedBox(height: 10.h),
          CustomTextField(
            onSubmitted: (value) {},
            fieldName: "Email Address",
            controller: emailController,
          ),
          SizedBox(height: 100.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                fieldName: "Cancel",
              ),
              CustomElevatedButton(
                fieldName: "Confirm",
                onPressed: () {
                  // Dispatch event to update profile
                  final firstName = firstNameController.text;
                  final lastName = lastNameController.text;
                  final email = emailController.text;
                  BlocProvider.of<ProfileBloc>(context).add(
                    NewProfileUpdate(
                      newFirstName: firstName,
                      newLastName: lastName,
                      newEmail: email,
                    ),
                  );
                  texfieldClear();
                  // repository.updateProfile(
                  //   newFirstName: firstNameController.text,
                  //   newLastName: lastNameController.text,
                  //   newEmail: emailController.text,
                  // );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.fieldName,
    required this.onSubmitted,
    required this.controller,
  });

  final String fieldName;
  final void Function(String) onSubmitted;
  final TextEditingController controller;

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
            controller: controller,
            minLines: 1,
            decoration: InputDecoration(
              hintText: "Enter $fieldName",
              contentPadding: EdgeInsets.all(10.r),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
            ),
            keyboardType: fieldName == "Email Address"
                ? TextInputType.emailAddress
                : TextInputType.text,
            onSubmitted: onSubmitted,
            style: TextStyle(
              color: AppColor.textPrimaryColor,
              fontSize: 16.5.sp,
              fontWeight: FontWeight.w500,
            ),
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}
