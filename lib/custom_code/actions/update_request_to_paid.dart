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

Future<bool> updateRequestToPaid(List<ShoppingCartRecord> shoppingCartEntries,
    String creditCardId, DocumentReference user) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<DocumentReference> offerIds = [];

  String offerId = "ok";
  String requestId = "ok";
  String coverImage = "";
  String receivedId = "";
  String senderId = "";
  String shoppingCartId = "";
  var shoppingCartRef;
  var receivedRef;
  var senderRef;
  var offerRef;
  var destination;
  var source;

  try {
    for (var entry in shoppingCartEntries) {
      offerRef = entry.offerId;
      offerId = offerRef!.id;

      var requestRef = entry.requestId;
      requestId = requestRef!.id;

      offerIds.add(offerRef);

      await FirebaseFirestore.instance.collection('Offer').doc(offerId).update({
        'Status': 5,
      });

      final DocumentSnapshot<Map<String, dynamic>> requestSnapShot =
          await FirebaseFirestore.instance
              .collection('Request')
              .doc(requestId)
              .get();

      if (requestSnapShot.exists) {
        Map<String, dynamic>? requestData = requestSnapShot.data();

        if (requestData != null) {
          coverImage = requestData['CoverImage'];
          senderRef = requestData['UserId'];
          senderId = senderRef!.id;
          destination = requestData['Location'];
        }
      }

      final DocumentSnapshot<Map<String, dynamic>> offerSnapShot =
          await FirebaseFirestore.instance
              .collection('Offer')
              .doc(offerId)
              .get();

      if (offerSnapShot.exists) {
        Map<String, dynamic>? offerData = offerSnapShot.data();

        if (offerData != null) {
          receivedRef = offerData['UserId'];
          receivedId = receivedRef!.id;
          source = offerData['Location'];
        }
      }

      final notificationCollectionRef = firestore.collection("Notification");

      await notificationCollectionRef.add({
        'CreatedAt': DateTime.now(),
        'OfferId': offerRef,
        'ReceivedId': receivedRef,
        'SenderId': senderRef,
        'Message': "Your bid has been accepted, lets get to work",
        'Read': false,
        'Type': 2,
        'RequestId': requestRef
      });

      final trackOrderCollectionRef = firestore.collection("TrackOrder");

      var newPositions = [
        LatLng(49.874924, -119.39418),
        LatLng(49.896382, -119.399677),
        LatLng(49.901026, -119.409296),
        LatLng(49.885101, -119.427504),
        LatLng(49.882447, -119.457737),
        LatLng(49.881562, -119.466326),
        LatLng(49.883553, -119.486252),
        LatLng(49.8893451, -119.4972178),
        LatLng(0, 0)
      ];

      // Convert each LatLng object into a map and collect them into a list
      var geoPoints = newPositions
          .map((position) => GeoPoint(position.latitude, position.longitude))
          .toList();

      await trackOrderCollectionRef.add({
        'AcceptedDate': DateTime.now(),
        'Accepted': true,
        'HeadingYourWay': false,
        'HeadingYourWayDate': null,
        'Arrived': false,
        'ArrivedDate': null,
        'WorkUnderWay': false,
        'WorkUnderWayDate': null,
        'WorkCompletedOfferer': false,
        'DriverPositions': geoPoints,
        'WorkCompletedDateOfferer': null,
        'WorkCompletedRequester': false,
        'WorkCompletedDateRequester': null,
        'Destination': destination,
        'Source': source,
        'OfferId': offerRef,
        'CongratulationsShown': false,
        'StartDateAgreed': false,
        'RequesterReviewLeft': false,
        'OffererReviewLeft': false
      });

      shoppingCartRef = entry.reference;
      shoppingCartId = shoppingCartRef!.id;

      await FirebaseFirestore.instance
          .collection('ShoppingCart')
          .doc(shoppingCartId)
          .delete();
    }

    final transactionCollectionRef = firestore.collection("Transaction");

    TransactionType transactionType = TransactionType.CCPayment;

    // Convert the enum to a string
    String transactionTypeString = transactionType.name;

    await transactionCollectionRef.add({
      'CreditCardId': creditCardId,
      'OfferIds': offerIds,
      'Type': transactionTypeString,
      'UserId': user,
      'CreatedAt': DateTime.now(),
    });

    return true;
  } catch (e) {
    // Handle any errors here
    print('Error occurred: $e');
    return false;
  }
}
