import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/features/profile/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:user_app/src/features/profile/presentation/bloc/profile_bloc/profile_event.dart';
import 'package:user_app/src/features/profile/presentation/bloc/profile_bloc/profile_state.dart';
import 'package:user_app/src/features/profile/presentation/widgets/avatar_list.dart';
import 'package:user_app/src/features/profile/presentation/widgets/editingbody.dart';

// ignore: must_be_immutable
class ProfileEditPage extends StatelessWidget {
   ProfileEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileLoadedState) {
            return _buildLoadedStateUI(context, state);
          } else {
            return const Center(child: Text('Error loading profile data.'));
          }
        },
      ),
    );
  }

  Widget _buildLoadedStateUI(BuildContext context, ProfileLoadedState state) {
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
                  state.selectedAvatarIndex,
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
            activeIndex: state.selectedAvatarIndex,
            onSelect: (index) => _onSelect(context, index),
          ),
          SizedBox(height: 10.h),
          Divider(color: Colors.grey.withOpacity(0.2)),
          const EditingBody(),
        ],
      ),
    );
  }

  Row profileAndName(String firstName, String lastName, String email, int selectedAvatarIndex) {
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
    "assets/img/user3.png",
    "assets/img/user.png",
    "assets/img/user.png",
    "assets/img/user.png",
  ];

  // Function to handle avatar selection
void _onSelect(BuildContext context, int index) {
  // Fetch current state to get existing details
  final currentState = context.read<ProfileBloc>().state;
  if (currentState is ProfileLoadedState) {
    // Dispatch ProfileUpdateEvent with the existing details and new avatar index
    BlocProvider.of<ProfileBloc>(context).add(
      ProfileUpdateEvent(
        newFirstName: currentState.firstName,
        newLastName: currentState.lastName,
        newEmail: currentState.email,
        selectedIndex: index,
      ),
    );
  }
}


}
