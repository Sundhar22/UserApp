import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/constants.dart';
import '../../../home/presentation/widgets/home_page_search_bar.dart';
import '../bloc/location_bloc.dart';

Container innerContainerWidget(BuildContext context) {
  return Container(
    height: 200.h,
    padding: EdgeInsets.symmetric(vertical: 15.h),
    decoration: BoxDecoration(
      border: Border(
          bottom: BorderSide(
        color: Colors.grey.shade200,
        width: 1,
      )),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomePageSearchBar(
          hintText: "Search for area, street name...",
          onChanged: (String val) {},
          onTap: () {},
          padding:
              EdgeInsets.only(top: 10.h, bottom: 5.h, left: 0.w, right: 0.w),
        ),
        currentLocation(context),
        // continueButton
        Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 335.w,
                height: 35.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: AppColor.primaryColor,
                ),
                child: Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Row headline(String headline, void Function() onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        headline,
        style: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          splashFactory: NoSplash.splashFactory,
        ),
        child: const Text(
          "See All",
          style: TextStyle(
            fontSize: 14.5,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ],
  );
}

GestureDetector currentLocation(BuildContext context) {
  return GestureDetector(
    onTap: () async {
      context.read<LocationBloc>().add(GetCurrentLocationEvent());
    },
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          context.watch<LocationBloc>().state is LocationLoading
              ? SizedBox(
                  height: 20.h,
                  width: 20.w,
                  child: CircularProgressIndicator(
                    color: AppColor.primaryColor,
                    strokeWidth: 2,
                  ),
                )
              : Image.asset(
                  'assets/icons/my-location-50.png',
                  color: AppColor.primaryColor,
                  height: 20.h,
                  width: 20.w,
                ),
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

Positioned belowWidget(BuildContext context) {
  return Positioned(
    bottom: 0,
    child: Container(
      width: 375.w,
      height: 270.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          containerAppBar(),
          innerContainerWidget(context),
        ],
      ),
    ),
  );
}
