import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/notification/ui/notification_page.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11.0.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 208.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset("assets/img/user.png"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Chandhrasekar",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(
                      width: 160.w,
                      child: Text(
                        "Chennai, Tamil Nadu, India,",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          NotificationIconCustom(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  NotificationPage()),
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationIconCustom extends StatelessWidget {
  const NotificationIconCustom(
      {super.key, required this.onTap, this.height, this.width});
  final void Function() onTap;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Image.asset(
            'assets/icons/notification-50.png',
            height: height ?? 25.h,
            width: width ?? 25.w,
          ),
          Positioned(
            top: 2,
            right: 3,
            child: Container(
              height: 8.h,
              width: 8.w,
              decoration: const BoxDecoration(
                color: Colors.redAccent,
                shape: BoxShape.circle,
              ),
            ),
          )
        ],
      ),
    );
  }
}

Container offerCard(
  String img,
) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 15.w),
    height: 150.h,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(10.r),
      ),
      image: DecorationImage(
        image: AssetImage("assets/img/$img"),
        fit: BoxFit.cover,
      ),
    ),
  );
}
