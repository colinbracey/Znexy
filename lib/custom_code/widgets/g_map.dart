// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'dart:math';
import 'package:google_maps_widget/google_maps_widget.dart' as GM;

class GMap extends StatefulWidget {
  const GMap({
    Key? key,
    this.width,
    this.height,
    required this.trackOrderRef,
    required this.trackOrderDoc,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String trackOrderRef;
  final TrackOrderRecord trackOrderDoc;

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
        widget.trackOrderDoc.source!.latitude,
        widget.trackOrderDoc.source!.longitude,
      ),
      destinationLatLng: GM.LatLng(
        widget.trackOrderDoc.destination!.latitude,
        widget.trackOrderDoc.destination!.longitude,
      ),
      routeWidth: 5,
      sourceMarkerIconInfo: GM.MarkerIconInfo(
        infoWindowTitle: "This is source name",
        onTapInfoWindow: (_) {
          print("Tapped on source info window");
        },
        //assetPath: "assets/images/restaurant-marker-icon.png",
        assetMarkerSize: Size.square(125),
        // assetPath:
        //   "https://firebasestorage.googleapis.com/v0/b/helpme-502f1.appspot.com/o/users%2FLrzKJtsED9O1DOL0RQXn7sG4Amc2%2Fuploads%2F1699987800006000.jpg?alt=media&token=3ae328c5-6461-4fd6-ac0f-1a2bad797aed",
      ),
      destinationMarkerIconInfo: GM.MarkerIconInfo(
          //assetPath: "assets/images/restaurant-marker-icon.png",
          ),
      driverMarkerIconInfo: GM.MarkerIconInfo(
        infoWindowTitle: "Alex",
        //assetPath: "assets/images/driver-marker-icon.png",
        onTapMarker: (currentLocation) {
          print("Driver is currently at $currentLocation");
        },
        assetMarkerSize: Size.square(125),
        //rotation: 90,
      ),
      updatePolylinesOnDriverLocUpdate: true,
      onPolylineUpdate: (_) {
        print("Polyline updated");
      },
      // driverCoordinatesStream: Stream.periodic(
      //   Duration(milliseconds: 500),
      //  (i) => GM.LatLng(
      //    40.47747872288886 + i / 10000,
      //    -3.368043154478073 - i / 10000,
      //  ),
      //),
      totalTimeCallback: (time) => {
        print("Time left $time"),
        FirebaseFirestore.instance
            .collection('TrackOrder')
            .doc(widget.trackOrderRef)
            .update({
          'TimeLeft': time,
        }),
      },
      totalDistanceCallback: (distance) => {
        print("Distance $distance"),
        FirebaseFirestore.instance
            .collection('TrackOrder')
            .doc(widget.trackOrderRef)
            .update({
          'DistanceLeft': distance,
        }),
      },
    );
  }
}
