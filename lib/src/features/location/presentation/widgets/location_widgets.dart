import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/constants/app_const.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/global/global.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/flutterToast/flutter_toast.dart';
import '../bloc/location_bloc.dart';

Container locationHead(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(bottom: 5.h),
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 185.w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/icons/location-48.png',
                  height: 25.h, width: 25.w),
              SizedBox(width: 5.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.read<LocationBloc>().state.placemark!.locality!,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${context.read<LocationBloc>().state.placemark!.administrativeArea!},\n${context.read<LocationBloc>().state.placemark!.country!}',
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
          onPressed: () =>
              Navigator.pushReplacementNamed(context, RoutesName.location),
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
  bool? autoFocus,
  required TextEditingController controller,
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
          autofocus: autoFocus ?? false,
          controller: controller,
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
  final flatNameController = TextEditingController();
  final apartmentNameController = TextEditingController();
  final addressLineController = TextEditingController();

  return DraggableScrollableSheet(
      initialChildSize: 0.6.h,
      maxChildSize: 0.8.h,
      minChildSize: 0.1.h,
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
                    locationHead(context),
                    SizedBox(height: 10.h),
                    locationInputTextFelid(
                        autoFocus: true,
                        controller: flatNameController,
                        tittle: "Flat Name  (Optional)"),
                    SizedBox(height: 10.h),
                    locationInputTextFelid(
                        controller: apartmentNameController,
                        tittle: "Apartment Name  (Optional)"),
                    SizedBox(height: 10.h),
                    locationInputTextFelid(
                      controller: addressLineController,
                      tittle: "Address Line",
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                BlocListener<LocationBloc, LocationState>(
                  listener: (context, state) async {
                    if (state is SaveAddressLoadingState) {
                      toastMessage(
                          'Saving Address', context, AppColor.primaryColor);
                    }

                    if (state is LocationErrorState) {
                      toastMessage(state.message, context, Colors.red);
                    }
                    if (state is SaveAddressSuccessState) {
                      toastMessage('Address Saved', context, Colors.green);
                      storageService.setBool(
                          AppStorageConstants.FIRST_TIME_OPEN, false);
                      Navigator.pushNamedAndRemoveUntil(
                          context, RoutesName.appPage, (route) => false);
                    }
                  },
                  child: ElevatedButton(
                    onPressed: () {
                      if (addressLineController.text.isNotEmpty &&
                          addressLineController.text.length > 10) {
                        context.read<LocationBloc>().add(
                              SaveAddressEvent(
                                flatName: flatNameController.text,
                                apartmentAddress: apartmentNameController.text,
                                address: addressLineController.text,
                              ),
                            );
                      } else {
                        toastMessage('Enter a address more than 10 letters ',
                            context, Colors.red);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      backgroundColor: AppColor.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r)),
                    ),
                    child: const Text("Save Address",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
