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

import 'index.dart'; // Imports other custom widgets

import 'dart:math';
import 'package:google_maps_widget/google_maps_widget.dart' as GM;

class GMapWidget2 extends StatefulWidget {
  const GMapWidget2({
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
  _GMapWidget2State createState() => _GMapWidget2State();
}

class _GMapWidget2State extends State<GMapWidget2> {
  final _mapsWidgetController = GlobalKey<GM.GoogleMapsWidgetState>();

  // same as origin
  List<GM.LatLng> _driverPositions = [];

  @override
  void initState() {
    super.initState();

    // add initial source point
    _driverPositions.add(GM.LatLng(widget.trackOrderDoc.source!.latitude,
        widget.trackOrderDoc.source!.longitude));

    // add all the points
    _driverPositions.addAll(widget.trackOrderDoc.driverPositions!
        .map((element) => GM.LatLng(element.latitude, element.longitude)));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: GM.GoogleMapsWidget(
                    zoomControlsEnabled: true,
                    apiKey: "AIzaSyD8c6ObN67Fy4Ub1MfyWKwuW5J-c-rht0A",
                    key: _mapsWidgetController,
                    sourceLatLng: GM.LatLng(
                      widget.trackOrderDoc.source!.latitude,
                      widget.trackOrderDoc.source!.longitude,
                    ),
                    destinationLatLng: GM.LatLng(
                      widget.trackOrderDoc.destination!.latitude,
                      widget.trackOrderDoc.destination!.longitude,
                    ),

                    ///////////////////////////////////////////////////////
                    //////////////    OPTIONAL PARAMETERS    //////////////
                    ///////////////////////////////////////////////////////

                    routeWidth: 5,
                    sourceMarkerIconInfo: GM.MarkerIconInfo(
                      infoWindowTitle: "This is source name",
                      onTapInfoWindow: (_) {
                        print("Tapped on source info window");
                      },
                      //assetPath: "assets/images/restaurant-marker-icon.png",
                    ),
                    destinationMarkerIconInfo: GM.MarkerIconInfo(
                      //assetPath: "assets/images/house-marker-icon.png",
                      infoWindowTitle: "Requester",
                      onTapMarker: (currentLocation) {
                        print("Requester is currently at $currentLocation");
                      },
                      assetMarkerSize: Size.square(125),
                    ),
                    driverMarkerIconInfo: GM.MarkerIconInfo(
                      infoWindowTitle: "Alex",
                      //assetPath: widget.offerUserImage,
                      //assetPath: "assets/images/driver-marker-icon.png",
                      onTapMarker: (currentLocation) {
                        print("Driver is currently at $currentLocation");
                      },
                      assetMarkerSize: Size.square(125),
                      // rotation: 90,
                    ),
                    updatePolylinesOnDriverLocUpdate: true,
                    // an array of LatLng that represent a path from source to destination
                    onPolylineUpdate: (p) {
                      //print("Polyline updated ${p.points}");
                      // if (driverPoints.length == 1) {
                      //   driverPoints = p.points;
                      //   driverPoints.add(GM.LatLng(0, 0));
                      // }
                    },
                    driverCoordinatesStream: Stream.periodic(
                      const Duration(milliseconds: 5000),
                      (i) => GM.LatLng(_driverPositions[i].latitude,
                          _driverPositions[i].longitude),
                    ).takeWhile((element) =>
                        element.longitude != 0 && element.latitude != 0),

                    // mock stream
                    // driverCoordinatesStream: Stream.periodic(
                    //   Duration(milliseconds: 5000),
                    //   (i) => GM.LatLng(40.484000837597925 - i / 10000,
                    //       -3.369978368282318 + i / 10000),
                    // ),
                    // driverCoordinatesStream: Stream.periodic(
                    //         Duration(milliseconds: 500), (i) => driverPoints[i])
                    //     .takeWhile((element) =>
                    //         element.longitude != 0 && element.latitude != 0),

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
                        }),
              ),
              // demonstrates how to interact with the controller
            ],
          ),
        ),
      ),
    );
  }
}
