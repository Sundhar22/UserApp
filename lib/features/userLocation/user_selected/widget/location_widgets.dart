import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constant/colors/app_color.dart';

Container locationHead() {
  return Container(
    padding: EdgeInsets.only(bottom: 5.h),
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 145.w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/icons/location-48.png',
                  height: 25.h, width: 25.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Chennai",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Tamil Nadu,India",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            backgroundColor: AppColor.primaryColor.withOpacity(.12),
            // border
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r)),

            elevation: 0,
          ),
          child: Text(
            "Change",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.primaryColor,
            ),
          ),
        )
      ],
    ),
  );
}

Container dragIndicator() {
  return Container(
    height: 5.h,
    width: 50.w,
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(10.r),
    ),
  );
}

AppBar userLocationAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    scrolledUnderElevation: 0,
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_rounded,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: Text(
      "Your Address/Location",
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

SizedBox locationInputTextFelid({
  required String tittle,
}) {
  return SizedBox(
    // height: 75.h,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          tittle,
          style: TextStyle(
            color: AppColor.textSecondaryColor.withOpacity(.7),
            fontSize: 15.5.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 5.h),
        TextField(
          maxLines: tittle == "Address Line" ? 3 : 1,
          minLines: 1,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.r),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
          ),
          style: TextStyle(
            color: AppColor.textPrimaryColor,
            fontSize: 16.5.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
