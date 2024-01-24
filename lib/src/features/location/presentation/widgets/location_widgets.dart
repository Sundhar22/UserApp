import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_app/src/core/routes/routes.dart';

import '../../../../core/animation/animation.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/global/navigation_arg.dart';
import '../bloc/location_bloc.dart';

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
        Navigator.pushReplacementNamed(context, RoutesName.location);
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

GoogleMap googleMap(
    BuildContext context,
    Completer<GoogleMapController> mapController,
    CameraPosition initialCameraPosition,
    LatLng latLog) {
  return GoogleMap(
    onTap: (value) {
      context.read<LocationBloc>().add(DargLocationEvent(location: value));
    },
    onMapCreated: (GoogleMapController controller) {
      mapController.complete(controller);
    },
    initialCameraPosition: initialCameraPosition,
    markers: {
      Marker(
        draggable: true,
        markerId: const MarkerId('1'),
        position: latLog,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        onDragEnd: (value) {
          context.read<LocationBloc>().add(DargLocationEvent(location: value));
        },
      ),
    },
  );
}

LatLng sateUpdate(
    LocationState state,
    LatLng latLog,
    CameraPosition initialCameraPosition,
    Completer<GoogleMapController> mapController) {
  if (state is Update) {
    latLog = LatLng((state).location!.latitude, (state).location!.longitude);
    initialCameraPosition = CameraPosition(target: latLog, zoom: 12);

    mapController.future.then((controller) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          initialCameraPosition,
        ),
      );
    });
  } else if (state is CurrentLocationLoadedState) {
    latLog = LatLng((state).currentLocation.geoPoint.latitude,
        (state).currentLocation.geoPoint.longitude);
    initialCameraPosition = CameraPosition(target: latLog, zoom: 10);

    mapController.future.then((controller) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          initialCameraPosition,
        ),
      );
    });
  } else if (state is LocationSearchState) {
    latLog = LatLng((state).locations.latitude, (state).locations.longitude);
    initialCameraPosition = CameraPosition(target: latLog, zoom: 10);

    mapController.future.then((controller) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          initialCameraPosition,
        ),
      );
    });
  }
  return latLog;
}

DraggableScrollableSheet saveSheet() {
  return DraggableScrollableSheet(
      initialChildSize: 0.45.h,
      maxChildSize: 0.5.h,
      minChildSize: 0.2.h,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification notification) {
              notification.disallowIndicator();
              return true;
            },
            child: ListView(
              controller: scrollController,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: dragIndicator()),
                    locationHead(),
                    SizedBox(height: 10.h),
                    locationInputTextFelid(
                        tittle: "Apartment Name  (Optional)"),
                    SizedBox(height: 10.h),
                    locationInputTextFelid(
                        tittle: "Apartment Name  (Optional)"),
                    SizedBox(height: 10.h),
                    locationInputTextFelid(tittle: "Address Line"),
                  ],
                ),
                SizedBox(height: 10.h),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    RoutesName.appPage,
                    arguments: const RouteArguments(
                        navAnimationType: AnimationType.fade),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 19.h),
                    backgroundColor: AppColor.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r)),
                  ),
                  child: const Text("Save Address",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ],
            ),
          ),
        );
      });
}
