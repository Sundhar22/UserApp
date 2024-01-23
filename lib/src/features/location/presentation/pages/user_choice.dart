import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/user_choice_widgets.dart';

class UserLocationChoice extends StatefulWidget {
  const UserLocationChoice({super.key});

  @override
  State<UserLocationChoice> createState() => _UserLocationChoiceState();
}

class _UserLocationChoiceState extends State<UserLocationChoice> {
  final initialCameraPosition = const CameraPosition(
    target: LatLng(9.9062091, 78.1244277),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              child: GoogleMap(
                initialCameraPosition: initialCameraPosition,
              ),
            ),
            belowWidget(context),
          ],
        ),
      ),
    );
  }
}
