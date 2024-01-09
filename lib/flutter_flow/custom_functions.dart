import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

double? calculatePercentageAndFormatAsCurrency(String value) {
// Convert the input string to a double and calculate 10% of the value
  String cleanedValue = value.replaceAll(RegExp(r'[^0-9.]'), '');

  // Convert the cleaned value to double
  double numericValue = double.tryParse(cleanedValue) ?? 0.0;

  return numericValue * 0.10;
}

double calculateWhatUsersWillSeeAsPrice(String price) {
// Remove non-numeric leading characters, commas, and currency symbols
  String cleanedValue = price.replaceAll(RegExp(r'[^0-9.]'), '');

  // Convert the cleaned value to double
  double numericValue = double.tryParse(cleanedValue) ?? 0.0;

  // Calculate the value minus 10%
  return numericValue - (numericValue * 0.10);
}

String? distanceBetweenTwoPoints(
  LatLng? positionOne,
  LatLng? positionTwo,
  String units,
) {
  // calculate the distance between two points on a spheroid and return distance as double
  if (units == "") {
    units = "km";
  }
  var p = 0.017453292519943295;
  const double milesPerKilometer = 0.621371;
  var a = 0.5 -
      math.cos((positionTwo!.latitude - positionOne!.latitude) * p) / 2 +
      math.cos(positionOne.latitude * p) *
          math.cos(positionTwo.latitude * p) *
          (1 - math.cos((positionTwo.longitude - positionOne.longitude) * p)) /
          2;
  double result = 12742 * math.asin(math.sqrt(a));

  // Convert to miles if the unit is "Miles"
  if (units == "mi") {
    result *= milesPerKilometer;
  }
  double roundedNumber = double.parse(result.toStringAsFixed(2));
  return "$roundedNumber " + units;
}

int? multiplyByOneHundred(double value) {
  int result = (value * 100).toInt();
  return result;
}

bool? searchRequestList(
  String? description1,
  String? description2,
  String? searchValue,
  bool checkForMyRequest,
  String? requesterUserId,
  String? myUserId,
) {
  String lowercaseSearchValue = searchValue?.toLowerCase() ?? '';
  String lowercaseDescription1 = description1?.toLowerCase() ?? '';
  String lowercaseDescription2 = description2?.toLowerCase() ?? '';

  bool containsSearchValue =
      lowercaseDescription1.contains(lowercaseSearchValue) ||
          lowercaseDescription2.contains(lowercaseSearchValue);

  if (checkForMyRequest) {
    // Check if userIDs are the same when checkForMyRequest is true
    return containsSearchValue && (requesterUserId == myUserId);
  }

  // If checkForMyRequest is false, return the result of the basic check
  return containsSearchValue;
}

String offerStatus(int statusId) {
  switch (statusId) {
    case 1:
      return 'New Offer';
    case 2:
      return 'Updated';
    case 3:
      return 'Cancelled';
    case 4:
      return 'Accepted';
    case 5:
      return 'Completed';
    default:
      return 'Unknown Status';
  }
}

double totalShoppingCartValue(List<ShoppingCartRecord>? shoppingCartEntries) {
  // pass List<ShoppingCartRecord> and return the sum of column Value
  double totalValue = 0.0;
  if (shoppingCartEntries != null) {
    for (final entry in shoppingCartEntries) {
      totalValue += entry.value ?? 0.0;
    }
  }
  return totalValue;
}

List<OfferRecord>? offersSorted(
  List<OfferRecord>? offers,
  String? sortBy,
) {
  if (offers == null) {
    return null;
  }

// Creating a new list from the original one to avoid modifying it directly
  List<OfferRecord> sortedOfferRecords = List<OfferRecord>.from(offers);

  if (sortBy == 'Price') {
    // Sort by value in descending order
    sortedOfferRecords.sort((a, b) => b.value.compareTo(a.value));
  } else if (sortBy == 'Date') {
    // Sort by created_at in descending order
    sortedOfferRecords.sort((a, b) {
      // Handle nulls: treat null as less than non-null
      if (a.createdAt == null) return 1;
      if (b.createdAt == null) return -1;
      return b.createdAt!.compareTo(a.createdAt!);
    });
  }

  return sortedOfferRecords;
}
