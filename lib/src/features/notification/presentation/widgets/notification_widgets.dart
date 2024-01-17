import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/constants.dart';


Container notificationCardWidget(String title, String content) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10.h),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          decoration: BoxDecoration(
            color: AppColor.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 2.5.h),
              Text(
                content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.5),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

AppBar notificationAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    foregroundColor: Colors.black,
    scrolledUnderElevation: 0,
    title: Text(
      "Notification",
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18.sp,
      ),
    ),
  );
}
