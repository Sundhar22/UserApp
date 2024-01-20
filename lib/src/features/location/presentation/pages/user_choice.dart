import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_app/src/features/location/presentation/bloc/location_bloc.dart';

import '../widgets/user_choice_widgets.dart';

class UserLocationChoice extends StatefulWidget {
  const UserLocationChoice({super.key});

  @override
  State<UserLocationChoice> createState() => _UserLocationChoiceState();
}

class _UserLocationChoiceState extends State<UserLocationChoice> {
  final LatLng latLog = const LatLng(9.9062091, 78.1244277);

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  void initState() {
    setMapStyle();
    super.initState();
  }

  setMapStyle() async {
    String style = await DefaultAssetBundle.of(context)
        .loadString('assets/json/map_style.json');
    await _controller.future.then((value) {
      value.setMapStyle(style);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (BuildContext context, LocationState state) {
          return SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                child: GoogleMap(
                  onMapCreated: (controller) {
                    _controller.complete(controller);
                  },
                  initialCameraPosition: CameraPosition(
                    target: latLog,
                    zoom: 17.3,
                  ),
                  markers: {
                    Marker(
                      draggable: true,
                      markerId: const MarkerId('1'),
                      position: latLog,
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueOrange),
                      onDragEnd: (value) => print(value),
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
}
