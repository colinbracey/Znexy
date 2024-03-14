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

Future<bool> updateTrackingStatus(
  String trackOrderID,
  String status,
  bool requester,
) async {
  // pass trackorder id, retrieve record from database, update arrived and arriveddate

  // Retrieve record from database
  final DocumentSnapshot<Map<String, dynamic>> snapshot =
      await FirebaseFirestore.instance
          .collection('TrackOrder')
          .doc(trackOrderID)
          .get();

  if (snapshot.exists) {
    Map<String, dynamic>? data = snapshot.data();

    if (data != null) {
      var arrived = data['Arrived'];
      var arrivedDate = data['ArrivedDate'];
      var headingYourWay = data['HeadingYourWay'];
      var headingYourWayDate = data['HeadingYourWayDate'];
      var workUnderWay = data['WorkUnderWay'];
      var workUnderWayDate = data['workUnderWayDate'];

      switch (status) {
        case 'Request Accepted':
          await FirebaseFirestore.instance
              .collection('TrackOrder')
              .doc(trackOrderID)
              .update({
            'Accepted': true,
            'HeadingYourWay': false,
            'HeadingYourWayDate': null,
            'Arrived': false,
            'ArrivedDate': null,
            'WorkUnderWay': false,
            'WorkUnderWayDate': null,
            'WorkCompletedRequester': false,
            'WorkCompletedDateRequester': null,
            'WorkCompletedOfferer': false,
            'WorkCompletedDateOfferer': null
          });

          break;

        case 'Heading to you':
          await FirebaseFirestore.instance
              .collection('TrackOrder')
              .doc(trackOrderID)
              .update({
            'HeadingYourWay': true,
            'HeadingYourWayDate': DateTime.now(),
            'Arrived': false,
            'ArrivedDate': null,
            'WorkUnderWay': false,
            'WorkUnderWayDate': null,
            'WorkCompletedRequester': false,
            'WorkCompletedDateRequester': null,
            'WorkCompletedOfferer': false,
            'WorkCompletedDateOfferer': null
          });

          break;

        case 'Arrived':
          if (headingYourWay == false) {
            headingYourWay = true;
            headingYourWayDate = DateTime.now();
          }
          await FirebaseFirestore.instance
              .collection('TrackOrder')
              .doc(trackOrderID)
              .update({
            'HeadingYourWay': headingYourWay,
            'HeadingYourWayDate': headingYourWayDate,
            'Arrived': true,
            'ArrivedDate': DateTime.now(),
            'WorkCompletedRequester': false,
            'WorkCompletedDateRequester': null,
            'WorkCompletedOfferer': false,
            'WorkCompletedDateOfferer': null
          });

          break;

        case 'Work Started':
          if (headingYourWay == false) {
            headingYourWay = true;
            headingYourWayDate = DateTime.now();
          }

          if (arrived == false) {
            arrived = true;
            arrivedDate = DateTime.now();
          }

          await FirebaseFirestore.instance
              .collection('TrackOrder')
              .doc(trackOrderID)
              .update({
            'HeadingYourWay': headingYourWay,
            'HeadingYourWayDate': headingYourWayDate,
            'Arrived': arrived,
            'ArrivedDate': arrivedDate,
            'WorkUnderWay': true,
            'WorkUnderWayDate': DateTime.now(),
            'WorkCompletedRequester': false,
            'WorkCompletedDateRequester': null,
            'WorkCompletedOfferer': false,
            'WorkCompletedDateOfferer': null
          });

          break;

        case 'Work Complete':
          if (headingYourWay == false) {
            headingYourWay = true;
            headingYourWayDate = DateTime.now();
          }

          if (arrived == false) {
            arrived = true;
            arrivedDate = DateTime.now();
          }

          if (workUnderWay == false) {
            workUnderWay = true;
            workUnderWayDate = DateTime.now();
          }

          if (requester) {
            await FirebaseFirestore.instance
                .collection('TrackOrder')
                .doc(trackOrderID)
                .update({
              'HeadingYourWay': headingYourWay,
              'HeadingYourWayDate': headingYourWayDate,
              'Arrived': arrived,
              'ArrivedDate': arrivedDate,
              'WorkUnderWay': workUnderWay,
              'WorkUnderWayDate': workUnderWayDate,
              'WorkCompletedRequester': true,
              'WorkCompletedDateRequester': DateTime.now()
            });
          } else {
            await FirebaseFirestore.instance
                .collection('TrackOrder')
                .doc(trackOrderID)
                .update({
              'HeadingYourWay': headingYourWay,
              'HeadingYourWayDate': headingYourWayDate,
              'Arrived': arrived,
              'ArrivedDate': arrivedDate,
              'WorkUnderWay': workUnderWay,
              'WorkUnderWayDate': workUnderWayDate,
              'WorkCompletedOfferer': true,
              'WorkCompletedDateOfferer': DateTime.now()
            });
          }

          break;

        // Add more cases as needed
        default:
          break;
      }
      return true;
    }
  }
  return false;
}
