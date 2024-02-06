import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/features/profile_edit/presentation/bloc/profileedit_bloc.dart';
import 'package:user_app/src/features/profile_edit/presentation/widgets/avatar_list.dart';
import 'package:user_app/src/features/profile_edit/presentation/widgets/editingbody.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  int selectedAvatarIndex = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileeditBloc, ProfileEditState>(
        builder: (context, state) {
          if (state is ProfileEditInitialState) {
            BlocProvider.of<ProfileeditBloc>(context).add(ProfileDataFetchEvent(
              oldFirstName: "",
              oldLastName: "",
              oldEmail: "",
            ));
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileEditLoadedState) {
            print("i am working ");

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h),
                  Padding(
                    padding: EdgeInsets.all(10.0.h),
                    child: Row(
                      children: [
                        profileAndName(
                          state.firstName,
                          state.lastName,
                          state.email,
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey.withOpacity(0.1)),
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
                  AvatarList(
                    avatarPaths: avatarPaths,
                    activeIndex: selectedAvatarIndex,
                    onSelect: onSelect,
                  ),
                  SizedBox(height: 10.h),
                  Divider(color: Colors.grey.withOpacity(0.2)),
                  const EditingBody(),
                ],
              ),
            );
          } else {
            return const Center(child: Text('Error loading profile data.'));
          }
        },
      ),
    );
  }

  Row profileAndName(String firstName, String lastName, String email) {
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
          child: Image.asset(
            selectedAvatarIndex >= 0 && selectedAvatarIndex < avatarPaths.length
                ? avatarPaths[selectedAvatarIndex]
                : "assets/img/user.png",
          ),
        ),
        SizedBox(width: 20.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$firstName $lastName",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
              ),
            ),
            SizedBox(
              child: Text(
                email,
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

  // Define the list of avatar image paths
  List<String> avatarPaths = [
    "assets/img/user.png",
    "assets/img/user.png",
    "assets/img/user.png",
    "assets/img/user.png",
    "assets/img/user.png",
  ];

  // Function to handle avatar selection
  void onSelect(int index) {
    setState(() {
      selectedAvatarIndex = index; // Update selectedAvatarIndex
    });
  }
}