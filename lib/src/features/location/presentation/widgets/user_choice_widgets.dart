import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/core/routes/routes.dart';

import '../../../../core/constants/constants.dart';
import '../bloc/location_bloc.dart';

Container innerContainerWidget(BuildContext context) {
  return Container(
    height: 145.h,
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
        searchBar(context),
        currentLocation(context),
      ],
    ),
  );
}

Container searchBar(BuildContext context) {
  return Container(
    height: 40.h,
    width: 360.w,
    padding: EdgeInsets.symmetric(
      horizontal: 15.w,
      // vertical: 2.h,
    ),
    decoration: BoxDecoration(
        color: Colors.grey.shade100, borderRadius: BorderRadius.circular(25.r)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        context.watch<LocationBloc>().state is SearchLoading
            ? SizedBox(
                height: 20.h,
                width: 20.w,
                child: CircularProgressIndicator(
                  color: AppColor.primaryColor,
                  strokeWidth: 2,
                ),
              )
            : Image.asset(
                'assets/icons/search-50.png',
                height: 20.h,
                width: 20.w,
                color: Colors.grey.shade700,
              ),
        SizedBox(
          // height: 39.h,
          width: 275.w,
          child: TextField(
            onSubmitted: (String val) {
              context.read<LocationBloc>().add(SearchLocationEvent(val));
              context.read<LocationBloc>().stream.listen((event) {
                if (event is LocationSearchState) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RoutesName.saveLocation, (route) => false);
                }
              });
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(left: 10.w, right: 10.w, bottom: 2.h),
              hintText: "Search for area, street name...",
              hintStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
              border: InputBorder.none,
            ),
          ),
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

      context.read<LocationBloc>().stream.listen((event) {
        if (event is CurrentLocationLoadedState) {
          Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.saveLocation, (route) => false);
        }
      });
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
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColor.primaryColor,
            size: 16.sp,
          ),
        ],
      ),
    ),
  );
}

Row containerAppBar() {
  return Row(
    children: [
      SizedBox(
        width: 10.w,
      ),
      Text(
        "Your Address/Location",
        style: TextStyle(
          fontSize: 18.sp,
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
      height: 250.h,
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
