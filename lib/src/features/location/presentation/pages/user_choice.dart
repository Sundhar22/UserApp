import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_app/src/features/location/presentation/bloc/location_bloc.dart';

import '../widgets/user_choice_widgets.dart';

class UserLocationChoice extends StatelessWidget {
  UserLocationChoice({super.key});

  var latLog = const LatLng(9.9062091, 78.1244277);

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  var initialCameraPosition = const CameraPosition(
    target: LatLng(9.9062091, 78.1244277),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (BuildContext context, LocationState state) {
          if (state is CurrentLocationLoadedState) {
            currentLocationUiUpdate(state);
          }
          return SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  child: GoogleMap(
                    onTap: (value) {
                      print(value);
                    },
                    onMapCreated: (controller) {
                      _controller.complete(controller);
                    },
                    initialCameraPosition: initialCameraPosition,
                    markers: {
                      Marker(
                        
                        draggable: true,
                        markerId: const MarkerId('1'),
                        position: latLog,
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueRed),
                        onDragEnd: (value) {},
                      ),
                    },
                  ),
                ),
                belowWidget(context),
              ],
            ),
          );
        },
      ),
    );
  }

  // setMapStyle(BuildContext context) async {
  //   String style = await DefaultAssetBundle.of(context)
  //       .loadString('assets/json/map_style_dark.json');
  //   await _controller.future.then((value) {
  //     value.setMapStyle(style);
  //   });
  // }

  void currentLocationUiUpdate(CurrentLocationLoadedState state) {
    latLog = LatLng(
      state.currentLocation.geoPoint.latitude,
      state.currentLocation.geoPoint.longitude,
    );
    initialCameraPosition = CameraPosition(
      target: LatLng(
        state.currentLocation.geoPoint.latitude,
        state.currentLocation.geoPoint.longitude,
      ),
      zoom: 13,
    );
    _controller.future.then((controller) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(initialCameraPosition),
      );
    });
  }
}
