import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

GestureDetector serviceCard(
    {required String img,
    required String title,
    required Function() onTap,
    required Color color}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Container(
          height: 55.h,
          width: 60.w,
          decoration: BoxDecoration(
            color: color.withOpacity(.09),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Image.asset(
              "assets/icons/$img",
              height: 35.h,
              width: 35.w,
              fit: BoxFit.contain,
              color: color,
            ),
          ),
        ),
        SizedBox(height: 5.h),
        SizedBox(
          width: 70.w,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    ),
  );
}
