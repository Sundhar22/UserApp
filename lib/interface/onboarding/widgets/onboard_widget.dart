import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/colors/app_color.dart';

Widget onboardWidget(
    {required String title,
    required String description,
    required String img,
    required bool isType1}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      !isType1
          ? SizedBox(
              height: 360.h,
              width: 360.w,
              child: Image.asset(
                "assets/img/$img",
                fit: BoxFit.cover,
              ),
            )
          : const SizedBox(),
      Text(
        title,
        style: TextStyle(
          fontSize: 22.5.sp,
          color: AppColor.textPrimaryColor,
          fontWeight: FontWeight.w700,
        ),
      ),
      Container(
        padding: EdgeInsets.only(right: 100.w, top: 10.h),
        child: Text(
          description,
          style: TextStyle(
            color: AppColor.textPrimaryColor.withOpacity(.75),
            fontSize: 16.2.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      isType1
          ? Container(
              margin: EdgeInsets.only(top: 15.h),
              height: 360.h,
              width: 360.w,
              child: Image.asset(
                "assets/img/$img",
              ),
            )
          : const SizedBox()
    ],
  );
}
