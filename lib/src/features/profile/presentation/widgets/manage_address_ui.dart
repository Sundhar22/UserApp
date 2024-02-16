import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../location/presentation/pages/user_location.dart';

import '../../../../core/constants/constants.dart';
import 'custom_appbar.dart';

class ManageAddresses extends StatefulWidget {
  const ManageAddresses({super.key});

  @override
  State<ManageAddresses> createState() => _ManageAddressesState();
}

class _ManageAddressesState extends State<ManageAddresses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Manage Addresses"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            _addressContainer(),
            _addAddressButton(),
          ],
        ),
      ),
    );
  }

  Widget _addressContainer() {
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
                    "Home",
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
                "6A, Anna Nagar, Veeravanallur, Tirunelveli District, TamilNadu - 6274216.",
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
            weight: 10,
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
