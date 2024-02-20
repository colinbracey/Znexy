// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
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
        'WorkCompletedDateOfferer': null,
        'WorkCompletedRequester': false,
        'WorkCompletedDateRequester': null,
        'Destination': destination,
        'Source': source,
        'OfferId': offerRef,
        'CongratulationsShown': false,
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
