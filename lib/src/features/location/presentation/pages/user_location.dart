import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
          return SizedBox(
            height: 690.h,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                googleMap(
                    context, mapController, initialCameraPosition, latLog),
                saveSheet(),
              ],
            ),
          );
        },
      ),
    );
  }
}
