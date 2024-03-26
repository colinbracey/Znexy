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

Future<List<RequestRecord>?> searchRequests(
  String searchString,
  List<RequestRecord>? requestDocuments,
) async {
  // Add your function code here!
  if (requestDocuments == null) {
    return null;
  }

  print("In function <$searchString>");
  List<RequestRecord> filteredRequests = [];
  for (RequestRecord place in requestDocuments) {
    String shortDescription = place.shortDescription.toLowerCase();
    String longDescription = place.longDescription.toLowerCase();
    print("Loop <$shortDescription>");

    if (shortDescription.contains(searchString.toLowerCase()) ||
        longDescription.contains(searchString.toLowerCase())) {
      filteredRequests.add(place);
    }
  }

  return filteredRequests;
}
