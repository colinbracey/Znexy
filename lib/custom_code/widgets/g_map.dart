// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';
import 'package:google_maps_widget/google_maps_widget.dart' as GM;

class GMap extends StatefulWidget {
  const GMap({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _GMapState createState() => _GMapState();
}

class _GMapState extends State<GMap> {
  final mapsWidgetController = GlobalKey<GM.GoogleMapsWidgetState>();

  @override
  Widget build(BuildContext context) {
    return GM.GoogleMapsWidget(
      apiKey: "AIzaSyD8c6ObN67Fy4Ub1MfyWKwuW5J-c-rht0A",
      key: mapsWidgetController,
      sourceLatLng: GM.LatLng(
        40.484000837597925,
        -3.369978368282318,
      ),
      destinationLatLng: GM.LatLng(
        40.48017307700204,
        -3.3618026599287987,
      ),
      routeWidth: 5,
      sourceMarkerIconInfo: GM.MarkerIconInfo(
        infoWindowTitle: "This is source name",
        onTapInfoWindow: (_) {
          print("Tapped on source info window");
        },
        assetPath: "assets/images/restaurant-marker-icon.png",
      ),
    );
  }
}
