// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math' as math;

Future<List<RequestRecord>> getPlacesWithinRadius(
  List<RequestRecord>? places,
  LatLng userGeo,
  double maxDistance,
) async {
  // Add your function code here!
  // First create some emptyList
  List<RequestRecord> placesWithinRadius = [];

  if (places == null) {
    return placesWithinRadius;
  }

  double lat1 = userGeo.latitude;
  double lon1 = userGeo.longitude;

  for (RequestRecord place in places) {
    double lat2 = place.location!.latitude;
    double lon2 = place.location!.longitude;
    var c = math.cos;
    var p = 0.017453292519943295; // Pi / 180
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    var distance = (12742 * math.asin(math.sqrt(a))); // Distance in kilometers

    if (distance <= maxDistance) {
      placesWithinRadius.add(place);
    }
  }

  // Optionally sort placesWithinRadius by distance if required here

  return placesWithinRadius;
}
