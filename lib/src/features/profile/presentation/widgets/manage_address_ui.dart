import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/features/location/presentation/pages/user_location.dart';
import 'package:user_app/src/features/profile/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:user_app/src/features/profile/presentation/bloc/profile_bloc/profile_event.dart';
import 'package:user_app/src/features/profile/presentation/bloc/profile_bloc/profile_state.dart';

import '../../../../core/constants/constants.dart';
import 'custom_appbar.dart';

class ManageAddresses extends StatefulWidget {
  const ManageAddresses({Key? key}) : super(key: key);

  @override
  
  State<ManageAddresses> createState() => _ManageAddressesState();
}

class _ManageAddressesState extends State<ManageAddresses> {
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Manage Addresses"),
      body: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
        if (state is ProfileLoadedState) {
          BlocProvider.of<ProfileBloc>(context).add(ManageAddressFetchEvent(
            desiny: "",
            address: "",
          ));
          print("hello");
          return Center(child: Container());
        } else if (state is ManageAddressLoadedState) {
          print("hello2");
          // Handle ManageAddressLoadedState
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: _addressContainer(state.destiny, state.address),
          );
        } else if (state is ProfileErrorState) {
          return const Center(child: Text('Error loading profile.'));
        } else {
          return const Center(child: Text('Unknown State.'));
        }
      }),
    );
  }

  Widget _addressContainer(String destiny, String address) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Container(
        height: 100.h,
        width: 375.w,
        decoration: BoxDecoration(
          color: AppColor.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    destiny,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                      color: AppColor.textSecondaryColor,
                    ),
                  ),
                  const Icon(
                    Icons.more_vert_rounded,
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                address,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.textPrimaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _addAddressButton() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => const UserLocation(),
          ),
        );
      },
      child: Row(
        children: [
          Icon(
            Icons.add_circle_outline_rounded,
            color: AppColor.primaryColor,
            size: 25,
            // weight: 10, // Remove this line
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            "Add another address",
            style: TextStyle(
              color: AppColor.primaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
