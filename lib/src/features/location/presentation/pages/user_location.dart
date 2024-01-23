import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_app/src/core/routes/routes.dart';

import '../../../../core/constants/constants.dart';
import '../bloc/location_bloc.dart';
import '../widgets/location_widgets.dart';

class UserLocation extends StatelessWidget {
  const UserLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: userLocationAppBar(context),
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (BuildContext context, state) {
          final Completer<GoogleMapController> mapController =
              Completer<GoogleMapController>();
          var initialCameraPosition =
              const CameraPosition(target: LatLng(0, 0), zoom: 12);
          var latLog = const LatLng(0, 0);
          latLog =
              sateUpdate(state, latLog, initialCameraPosition, mapController);
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              googleMap(context, mapController, initialCameraPosition, latLog),
              saveSheet(),
            ],
          );
        },
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
            context
                .read<LocationBloc>()
                .add(DargLocationEvent(location: value));
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
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 19.h),
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
}
