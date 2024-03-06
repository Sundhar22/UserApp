import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/features/profile/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:user_app/src/features/profile/presentation/bloc/profile_bloc/profile_event.dart';
import 'package:user_app/src/features/profile/presentation/bloc/profile_bloc/profile_state.dart';
import 'package:user_app/src/features/profile/presentation/widgets/profile_edit_page.dart';
import 'package:user_app/src/features/profile/presentation/widgets/notification_ui.dart';
import 'package:user_app/src/features/profile/presentation/widgets/payment_ui.dart';
import '../../../../core/constants/constants.dart';
import '../../../home/presentation/widgets/home_widgets.dart';
import '../../../notification/presentation/pages/notification_page.dart';
import '../widgets/help_center_ui.dart';
import '../widgets/manage_address_ui.dart';
import '../widgets/rateus_ui.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: profileAppBar(context),
        body: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
          if (state is ProfileLoadingState) {
            BlocProvider.of<ProfileBloc>(context).add(ProfileDataFetchEvent(
              oldFirstName: "",
              oldLastName: "",
              oldEmail: "",
              selectedIndex: 0,
            ));

            // return Container(
            //   color: Colors.red,
            // );
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProfileLoadedState) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    profileEditWidget(context, state.firstName, state.lastName,
                        state.email, state.selectedAvatarIndex),
                    SizedBox(
                      height: 2.h,
                    ),
                    Divider(
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    // Profile Content
                    profileContent(context),
                    Divider(
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    // Logout
                    logoutWidget(),
                    SizedBox(
                      height: 50.h,
                    ),
                    // App Version
                    appVersion()
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: Text('Error loading profile data.'));
          }
        }));
  }

  Column appVersion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.h,
        ),
        Text(
          'App Version',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 10.sp,
            color: Colors.grey,
          ),
        ),
        Text(
          'Version 1.0.0',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 10.sp,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  GestureDetector logoutWidget() {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(5.r),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Image.asset('assets/icons/logout-100.png',
                height: 25.h, width: 25.w, color: Colors.red),
          ),
          SizedBox(
            width: 15.w,
          ),
          Text(
            'Logout',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox profileContent(BuildContext context) {
    return SizedBox(
      height: 350.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          profileContentWidget(
            iconPath: 'assets/icons/omnichannel-100.png',
            title: 'Referral',
            onTap: () {},
          ),
          profileContentWidget(
            iconPath: 'assets/icons/notification-100.png',
            title: 'Notification',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const NotificationSettings(),
                ),
              );
            },
          ),
          profileContentWidget(
            iconPath: 'assets/icons/location-100.png',
            title: 'Manage Addresses',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const ManageAddresses(),
                ),
              );
            },
          ),
          profileContentWidget(
            iconPath: 'assets/icons/wallet-100.png',
            title: 'Payment',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => PaymentHistory(),
                ),
              );
            },
          ),
          profileContentWidget(
            iconPath: 'assets/icons/help-100.png',
            title: 'Help Center',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const HelpCenter(),
                ),
              );
            },
          ),
          profileContentWidget(
            iconPath: 'assets/icons/star-100-2.png',
            title: 'Rate Us',
            onTap: () {
              rateUs(context);
            },
          ),
          profileContentWidget(
            iconPath: 'assets/icons/about-100.png',
            title: 'About Us',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Row profileContentWidget({
    required String iconPath,
    required String title,
    required void Function() onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(5.r),
              decoration: BoxDecoration(
                color: AppColor.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Image.asset(iconPath, height: 25.h, width: 25.w),
            ),
            SizedBox(
              width: 15.w,
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
        IconButton(
            style: const ButtonStyle(splashFactory: NoSplash.splashFactory),
            onPressed: onTap,
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15.sp,
              color: Colors.black,
            ))
      ],
    );
  }

  Row profileEditWidget(BuildContext context, String firstName, String lastName,
      String email, int selectedIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Profile Image, Name and Email widget
        profileAndName(
          firstName,
          lastName,
          email,
          selectedIndex,
        ),
        // Edit Icon
        SizedBox(
          height: 26.h,
          width: 29.w,
          child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ProfileEditPage(),
                  ),
                );
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                backgroundColor: MaterialStateProperty.all(
                  AppColor.primaryColor.withOpacity(0.05),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ),
              ),
              icon: Image.asset(
                'assets/icons/edit-100.png',
                height: 20.h,
                width: 20.w,
              )),
        ),
      ],
    );
  }

  Row profileAndName(String firstName, String lastName, String email,
      int selectedAvatarIndex) {
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

  AppBar profileAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        'My Profile',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
        ),
      ),
      centerTitle: false,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
          child: NotificationIconCustom(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationPage()),
            ),
            height: 20.h,
            width: 20.w,
          ),
        ),
      ],
    );
  }

  List<String> avatarPaths = [
    "assets/img/user.png",
    "assets/img/user3.png",
    "assets/img/user.png",
    "assets/img/user.png",
    "assets/img/user.png",
  ];
}
