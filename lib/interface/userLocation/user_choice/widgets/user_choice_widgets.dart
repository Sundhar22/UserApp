import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constant/colors/app_color.dart';

Container innerContainerWidget() {
  return Container(
    height: 145.h,
    padding: EdgeInsets.symmetric(vertical: 20.h),
    decoration: BoxDecoration(
      border: Border(
          bottom: BorderSide(
        color: Colors.grey.shade200,
        width: 1,
      )),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [searchBar(), currentLocation()],
    ),
  );
}

GestureDetector currentLocation() {
  return GestureDetector(
    onTap: () {},
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            5.r,
          ),
          color: AppColor.primaryColor.withOpacity(
            0.1,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icons/my-location-50.png',
                color: AppColor.primaryColor,
                height: 20.h,
                width: 20.w,
              ),
              SizedBox(width: 10.w),
              Text(
                "Use my current location",
                strutStyle: const StrutStyle(
                  height: 1.5,
                ),
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColor.primaryColor,
            size: 20,
          ),
        ],
      ),
    ),
  );
}

Widget searchBar() {
  return SizedBox(
    height: 39.h,
    child: SearchBar(
      textStyle: MaterialStatePropertyAll(
        TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          color: Colors.black.withOpacity(0.8),
        ),
      ),
      elevation: const MaterialStatePropertyAll(0),
      backgroundColor: MaterialStatePropertyAll(Colors.grey.shade100),
      hintText: "Search for area, street name...",
      hintStyle: MaterialStatePropertyAll(
        TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
      leading: Image.asset(
        'assets/icons/search-50.png',
        height: 20.h,
        width: 20.w,
        color: Colors.grey.shade700,
      ),
      padding: MaterialStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 15.w, vertical: 2.h),
      ),
    ),
  );
}

Row containerAppBar() {
  return Row(
    children: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.arrow_back_rounded),
      ),
      const Text(
        "Your Address/Location",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}
