import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/constants.dart';
import 'rating.dart';

Future rateUs(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.white,
      child: SizedBox(
        height: 400.h,
        child: Column(
          children: [
            ratingPage(context),
          ],
        ),
      ),
    ),
  );
}

Widget ratingPage(BuildContext context) {
  return Column(
    children: [
      Image.asset(
        "assets/img/bloom-man-shopping-online-by-phone.png",
      ),
      Center(
        child: Text(
          "Share your experience on our app",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
            color: AppColor.textPrimaryColor,
          ),
        ),
      ),
      const RatingStars(),
      SizedBox(
        height: 20.h,
      ),
      GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          height: 40.h,
          width: 200.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.primaryColor),
          child: Center(
            child: Text(
              "Submit",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      )
    ],
  );
}
